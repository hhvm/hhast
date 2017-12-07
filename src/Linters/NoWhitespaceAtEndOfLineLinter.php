<?hh // strict
/**
 * Copyright (c) 2017, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional
 * grant of patent rights can be found in the PATENTS file in the same
 * directory.
 *
 */

namespace Facebook\HHAST\Linters;

use namespace HH\Lib\Str;
use namespace HH\Lib\C;
use namespace HH\Lib\Vec;

final class NoWhitespaceAtEndOfLineLinter
  extends AutoFixingLineLinter<FixableLineLintError> {

  <<__Override>>
  public function getLintErrors(): Traversable<FixableLineLintError> {
    $lines = $this->getLinesFromFile();
    $errs = vec[];

    foreach ($lines as $ln => $line) {
      $line_errors = vec($this->getLintErrorsForLine($line, $ln));

      if (C\is_empty($line_errors)) {
        continue;
      }

      // We got an error. Let's check the previous line to see if it is marked as ignorable
      if ($ln-1 >= 0 && $this->isLinterDisabled($lines[$ln-1])) {
        continue;
      }

      $errs = Vec\concat($errs, $line_errors);
    }

    return $errs;
  }

  public function getLintErrorsForLine(string $line, int $line_number): Traversable<FixableLineLintError> {
    $errs = vec[];

    for ($i = strlen($line) - 1; $i >= 0; $i--) {
      $char = $line[$i];
      if ($char !== ' ') {
        break;
      }

      $errs[] = new FixableLineLintError(
        $this,
        'trailing whitespace at end of line',
        tuple($line_number + 1, $i + 1),
      );
      break;
    }

    return $errs;
  }

  // Check if this linter has been disabled by a comment on the previous line.
  public function isLinterDisabled(string $previous_line): bool {
    return Str\contains($previous_line, $this->markerFixMe()) || Str\contains($previous_line, $this->markerIgnoreError());
  }

  <<__Override>>
  public function getFixedLine(string $line): string {
    return Str\trim_right($line, ' ');
  }
}
