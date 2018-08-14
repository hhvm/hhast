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

final class UseStatementWithoutKindLinterTest extends TestCase {
  use AutoFixingLinterTestTrait<
    Linters\FixableASTLintError<INamespaceUseDeclaration>,
  >;

  protected function getLinter(
    string $file,
  ): Linters\UseStatementWithoutKindLinter {
    return Linters\UseStatementWithoutKindLinter::fromPath($file);
  }

  public function getCleanExamples(): array<array<string>> {
    return [
      ["<?hh\nuse type Foo;"],
      ["<?hh\nuse namespace Foo;"],
      ["<?hh\nuse function Foo;"],
      ["<?hh\nuse const Foo;"],
      ["<?hh\nuse type Foo\\{Bar, Baz};"],
    ];
  }
}
