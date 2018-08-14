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

final class MethodCallOnConstructorLinterTest extends TestCase {
  use AutoFixingLinterTestTrait<
    Linters\FixableASTLintError<MemberSelectionExpression>,
  >;

  protected function getLinter(
    string $file,
  ): Linters\MethodCallOnConstructorLinter {
    return Linters\MethodCallOnConstructorLinter::fromPath($file);
  }

  public function getCleanExamples(): array<array<string>> {
    return [
      ['<?hh $x->foo();'],
      ['<?hh $x = new Foo(); $x->foo();'],
      ['<?hh (new Foo())->bar();'],
    ];
  }
}
