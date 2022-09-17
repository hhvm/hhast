/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use namespace HH\Lib\Str;

final class NoWhitespaceAtEndOfLineLinter
  extends AutoFixingLineLinter<LineLintError> {
  const type TConfig = shape();

  /**
   * This linter may change the behavior of the code.
   * A multiline string literal may contain whitespace at eol.
   * ```
   * <<<'EOF'
   *abc<space>
   *EOF
   * ```
   * Hhast will remove the trailing space character.
   * This changes the contents of the string.
   * The programmer running the linter should make sure
   * the suggested fix does not alter string literals.
   */
  <<__Override>>
  public function allowYesToAll(): bool {
    return false;
  }

  <<__Override>>
  public function getTitleForFix(LineLintError $_): string {
    return 'Remove trailing whitespace';
  }

  <<__Override>>
  public function getLintErrorsForLine(
    string $line,
    int $line_number,
  ): Traversable<LineLintError> {
    $errs = vec[];

    for ($i = Str\length($line) - 1; $i >= 0; $i--) {
      $char = $line[$i];
      if ($char !== ' ') {
        break;
      }

      $errs[] = new LineLintError(
        $this,
        'trailing whitespace at end of line',
        tuple($line_number + 1, $i + 1),
      );
      break;
    }

    return $errs;
  }

  <<__Override>>
  public function getFixedLine(string $line): string {
    return Str\trim_right($line, ' ');
  }
}
