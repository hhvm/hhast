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
use type Facebook\HHAST\__Private\LineEnding;

final class ConsistentLineEndingsLinter
  extends AutoFixingLineLinter<LineLintError> {
  // Could become configurable later.
  const type TConfig = shape('line ending' => LineEnding);

  private function getLineEnding(): LineEnding {
    return LineEnding::UNIX;
  }

  <<__Override>>
  public function getTitleForFix(LineLintError $_): string {
    $line_ending = $this->getLineEnding();
    return Str\format(
      'Use %s (%s style) line endings.',
      \json_encode($line_ending),
      LineEnding::getNames()[$line_ending],
    );
  }

  <<__Override>>
  public function getLintErrorsForLine(
    string $line,
    int $line_number,
  ): Traversable<LineLintError> {
    if ($line === '') {
      return vec[];
    }

    $line_ending = $this->getLineEnding();
    // The AutoFixingLineLinter removed the `\n`
    switch ($line_ending) {
      case LineEnding::WINDOWS:
        if (!Str\ends_with($line, "\r")) {
          return vec[new LineLintError(
            $this,
            'Expected \r\n',
            tuple($line_number + 1, Str\length($line) - 1),
          )];
        }
        break;
      case LineEnding::UNIX:
        if (Str\ends_with($line, "\r")) {
          return vec[new LineLintError(
            $this,
            'Expected just a \n, got \r\n',
            tuple($line_number + 1, Str\length($line) - 1),
          )];
        }
    }

    return vec[];
  }

  <<__Override>>
  public function getFixedLine(string $line): string {
    $bare_line = Str\trim_right($line, "\r\n");
    // The AutoFixingLineLinter adds the `\n`
    switch ($this->getLineEnding()) {
      case LineEnding::UNIX:
        return $bare_line;
      case LineEnding::WINDOWS:
        return $line."\r";
    }
  }
}
