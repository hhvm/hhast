/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use type Facebook\HHAST\{SingleRuleLinter};
use namespace HH\Lib\{Dict, Str, Vec};

abstract class LineLinter<+Terror as LineLintError> extends SingleRuleLinter {

  public function getLinesFromFile(): vec<string> {
    $code = $this->getFile()->getContents();
    $lines = Str\split($code, "\n");
    return vec($lines);
  }

  public function getLine(int $l): ?string {
    return idx($this->getLinesFromFile(), $l);
  }

  <<__Override>>
  public async function getLintErrorsAsync(): Awaitable<vec<Terror>> {
    list($suppressed, $unconditional) = Dict\map_with_key(
      $this->getLinesFromFile(),
      ($ln, $line) ==> vec($this->getLintErrorsForLine($line, $ln)),
    )
      |> Dict\filter($$)
      |> Dict\partition_with_key(
        $$,
        ($ln, $_errs) ==>
          $ln > 0 && $this->isSuppressedForLine($this->getFile(), $ln),
      );

    if ($this->shouldAllowSuppressionComments()) {
      return Vec\flatten($unconditional);
    }

    foreach ($suppressed as $errs) {
      foreach ($errs as $err) {
        $err->prefixDescription(Str\format(
          "You may not use a comment to suppress %s errors.\n".
          "See lintMarkerAllowList in hhast-lint.json.\n",
          $this->getLinterName(),
        ));
      }
    }

    return Vec\concat($suppressed, $unconditional) |> Vec\flatten($$);
  }

  /** Parse a single line of code and attempts to find lint errors */
  abstract public function getLintErrorsForLine(
    string $line,
    int $line_number,
  ): Traversable<Terror>;
}
