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

final class UnusedUseClauseLinter extends TestCase {
  use AutoFixingLinterTestTrait<Linters\FixableASTLintError<INamespaceUseDeclaration>>;

  protected function getLinter(
    string $file,
  ): Linters\AutoFixingASTLinter<INamespaceUseDeclaration> {
    return new Linters\UnusedUseClauseLinter($file);
  }

  public function getCleanExamples(): array<array<string>> {
    return [
      ["<?hh\nuse type Foo; Foo::bar();"],
      ["<?hh\nuse type Foo; \$x instanceof Foo;"],
      ["<?hh\nuse type Foo; class Bar<T as Foo>(): void {}"],
      ["<?hh\nuse type Foo; new Foo();"],
      ["<?hh\nuse type Foo; function bar(Foo \$in): void {}"],
      ["<?hh\nuse type Foo; function bar(): Foo {}"],
      ["<?hh\nuse namespace Foo; Foo\bar();"],
      ["<?hh\nuse namespace Foo; new Foo\Bar();"],
      ["<?hh\nuse Foo; new Foo();"],
      ["<?hh\nuse Foo; new Foo\Bar();"],
      ["<?hh\nuse function foo; foo();"],
      ["<?hh\nuse const FOO; var_dump(FOO);"],
    ];
  }
}
