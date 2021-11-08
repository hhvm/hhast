/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use type Facebook\HHAST\{BaseLinter};
use namespace HH\Lib\{C, Str, Vec};

abstract class LineLinter<+Terror as LineLintError> extends BaseLinter {

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
    $lines = $this->getLinesFromFile();
    $errs = vec[];

    foreach ($lines as $ln => $line) {
      $line_errors = vec($this->getLintErrorsForLine($line, $ln));

      if (C\is_empty($line_errors)) {
        continue;
      }

      // We got an error. Let's check the previous line to see if it is marked as ignorable
      if ($ln - 1 >= 0 && $this->isLinterSuppressed($lines[$ln - 1])) {
        continue;
      }

      $errs = Vec\concat($errs, $line_errors);
    }

    return $errs;
  }

  /** Check if this linter has been disabled by a comment on the previous line.
   */
  protected function isLinterSuppressed(string $previous_line): bool {
    return Str\contains($previous_line, $this->getFixmeMarker()) ||
      Str\contains($previous_line, $this->getIgnoreSingleErrorMarker());
  }

  /** Parse a single line of code and attempts to find lint errors */
  abstract public function getLintErrorsForLine(
    string $line,
    int $line_number,
  ): Traversable<Terror>;
}
