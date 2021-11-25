/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

final class NoWhitespaceAtEndOfLineLinterTest extends TestCase {
  use AutoFixingLinterTestTrait<LineLintError>;

  <<__Override>>
  protected function getLinter(string $file): NoWhitespaceAtEndOfLineLinter {
    return NoWhitespaceAtEndOfLineLinter::fromPath($file);
  }

  <<__Override>>
  public function getCleanExamples(): vec<(string)> {
    return vec[
      tuple("<?hh print('foo');"),
      tuple("<?hh\n"."class Foo {\n"."public function trogdor(){}\n"."}\n"),
    ];
  }
}
