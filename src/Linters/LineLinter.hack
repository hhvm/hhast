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
use namespace HH\Lib\{C, Vec};

abstract class LineLinter<+Terror as LineLintError> extends BaseLinter {
  use MemoizedLineLinterTrait;

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

  /** Parse a single line of code and attempts to find lint errors */
  abstract public function getLintErrorsForLine(
    string $line,
    int $line_number,
  ): Traversable<Terror>;
}
