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

namespace Facebook\HHAST;

use function Facebook\FBExpect\expect;
use namespace HH\Lib\{C, Str, Vec};
use namespace Facebook\HHAST;

final class NoWhitespaceAtEndOfLineLinterTest extends TestCase {
  use AutoFixingLinterTestTrait<Linters\FixableLineLintError>;

  protected function getLinter(
    string $file,
  ): Linters\NoWhitespaceAtEndOfLineLinter {
    return new Linters\NoWhitespaceAtEndOfLineLinter($file);
  }

  public function getCleanExamples(): array<array<string>> {
    return [
      ["<?hh print('foo');"],
      ["<?hh\n"."class Foo {\n"."public function trogdor(){}\n"."}\n"],
    ];
  }
}
