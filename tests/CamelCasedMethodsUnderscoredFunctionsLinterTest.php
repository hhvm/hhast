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

use function Facebook\FBExpect\expect;
use namespace HH\Lib\{C, Str, Vec};
use namespace Facebook\HHAST;

final class CamelCasedMethodsUnderscoredFunctionsLinterTest extends TestCase {
  use LinterTestTrait;

  protected function getLinter(
    string $file,
  ): Linters\BaseLinter {
    return new Linters\CamelCasedMethodsUnderscoredFunctionsLinter($file);
  }

  public function getCleanExamples(): array<array<string>> {
    return [
      ['<?hh class Foo { public function __construct() {} }'],
      ['<?hh class Foo { public function __destruct() {} }'],
      ['<?hh class Foo { public function fooBar() {} }'],
      ['<?hh class Foo { public function getFooBar() {} }'],
      ['<?hh class Foo { public function getFooBarUNSAFE() {} }'],
      ['<?hh class Foo { public function getFooBarUNTYPED() {} }'],
      ['<?hh class Foo { public function getFooBarDEPRECATED() {} }'],
      ['<?hh function foo_bar() {}'],
      ['<?hh function foo_bar_UNSAFE() {}'],
      ['<?hh function foo_bar_UNTYPED() {}'],
      // Special-case factory functions:
      ['<?hh function Foo(): Foo {}'],
      ['<?hh function Foo(): Foo<T> {}'],
      ['<?hh function Foo(): __Private\Foo<T> {}'],
    ];
  }
}
