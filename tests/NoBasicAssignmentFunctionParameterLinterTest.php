<?hh // strict
/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */


namespace Facebook\HHAST;


final class NoBasicAssignmentFunctionParameterLinterTest extends TestCase {
  use LinterTestTrait;

  protected function getLinter(
    string $file,
  ): Linters\BaseLinter {
    return Linters\NoBasicAssignmentFunctionParameterLinter::fromPath($file);
  }

  public function getCleanExamples(): array<array<string>> {
    return [
      ['<?hh foo(1, 2)'],
      ['<?hh foo($a == 1, $b == 2)'],
      ['<?hh foo(1 + 1, $b + 2)'],
      ['<?hh foo($a, $b)'],
      ['<?hh class Foo { public function foo(int $a = 1, int $b = 2): int {} }'],
      ['<?hh function foo(int $a = 1, int $b = 2) : int {}'],
    ];
  }
}
