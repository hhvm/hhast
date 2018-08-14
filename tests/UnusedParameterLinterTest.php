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

final class UnusedParameterLinterTest extends TestCase {
  use AutoFixingLinterTestTrait<
    Linters\FixableASTLintError<ParameterDeclaration>,
  >;

  protected function getLinter(string $file): Linters\UnusedParameterLinter {
    return Linters\UnusedParameterLinter::fromPath($file);
  }

  public function getCleanExamples(): array<array<string>> {
    return [
      ['<?hh function foo(int $bar) { return $bar; }'],
      ['<?hh function foo(int $bar) { var_dump($bar); }'],
      ['<?hh function foo(int $_) { }'],
      ['<?hh function foo(int $_bar) { }'],
      ['<?hh class Foo { public function bar(int $_) { }'],
      ['<?hh class Foo { public function bar(int $baz) { var_dump($baz); }'],
      ['<?hh interface Foo { public function bar(int $baz); }'],
      ['<?hh abstract class Foo { abstract public function bar(int $baz); }'],
      ['<?hh class Foo { public function __construct(private int $bar) {} }'],
    ];
  }
}
