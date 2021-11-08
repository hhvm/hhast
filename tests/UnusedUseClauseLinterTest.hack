/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

final class UnusedUseClauseLinterTest extends TestCase {
  use AutoFixingLinterTestTrait<ASTLintError>;

  protected function getLinter(string $file): AutoFixingASTLinter {
    return UnusedUseClauseLinter::fromPath($file);
  }

  public function getCleanExamples(): vec<(string)> {
    $examples = vec[
      tuple("<?hh\nuse type Foo; Foo::bar();"),
      tuple("<?hh\nuse type Foo; function bar<T as Foo>(): void {}"),
      tuple("<?hh\nuse type Foo; class Bar<T as Foo>{}"),
      tuple("<?hh\nuse type Foo; new Foo();"),
      tuple("<?hh\nuse type Foo; function bar(Foo \$in): void {}"),
      tuple("<?hh\nuse type Foo; function bar(): Foo {}"),
      tuple("<?hh\nuse namespace Foo; Foo\bar();"),
      tuple("<?hh\nuse namespace Foo; new Foo\Bar();"),
      tuple("<?hh\nuse Foo; new Foo();"),
      tuple("<?hh\nuse Foo; new Foo\Bar();"),
      tuple("<?hh\nuse function foo; foo();"),
      tuple("<?hh\nuse const FOO; var_dump(FOO);"),
      tuple(
        "<?hh\nuse namespace HH\Lib\{C, Vec};\n Vec\map(vec[], C\count<>);",
      ),
      tuple(
        "<?hh\nuse namespace HH\Lib\Vec;\n use function HH\Lib\C\count; Vec\map(vec[], count<>);",
      ),
    ];

    if (\ini_get('hhvm.hack.lang.disable_xhp_element_mangling')) {
      $examples[] = tuple(
        "<?hh\nuse type foo; function bar(): void { \$_ = <foo />; }",
      );
    }

    return $examples;
  }
}
