<?hh // strict
/**
 * Copyright (c) 2016, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional
 * grant of patent rights can be found in the PATENTS file in the same
 * directory.
 *
 */

namespace Facebook\HHAST;

/**
 * Testing that we can disable a specific line based linter. Using NoWhitespaceAtEndOfLineLinter
 * as the example.
 */
final class DisableLineLinterTest extends TestCase {
  use LinterTestTrait;

  protected function getLinter(
    string $file,
  ): Linters\BaseLinter {
    return new Linters\NoWhitespaceAtEndOfLineLinter($file);
  }

  public function getCleanExamples(): array<array<string>> {
    return [
      ['<?hh',
        '/* HHAST_FIXME[NoWhitespaceAtEndOfLineLinter] */',
        'function CamelCasing() { return null; }         '
      ],
    ];
  }
}
