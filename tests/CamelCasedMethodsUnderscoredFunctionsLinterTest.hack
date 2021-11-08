/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

final class CamelCasedMethodsUnderscoredFunctionsLinterTest extends TestCase {
  use LinterTestTrait;

  protected function getLinter(string $file): BaseLinter {
    return CamelCasedMethodsUnderscoredFunctionsLinter::fromPath($file);
  }

  public function getCleanExamples(): vec<(string)> {
    return vec[
      tuple('<?hh class Foo { public function __construct() {} }'),
      tuple('<?hh class Foo { public function __destruct() {} }'),
      tuple('<?hh class Foo { public function fooBar() {} }'),
      tuple('<?hh class Foo { public function getFooBar() {} }'),
      tuple('<?hh class Foo { public function getFooBarUNSAFE() {} }'),
      tuple('<?hh class Foo { public function getFooBarUNTYPED() {} }'),
      tuple('<?hh class Foo { public function getFooBarDEPRECATED() {} }'),
      tuple('<?hh function foo_bar() {}'),
      tuple('<?hh function foo_bar_UNSAFE() {}'),
      tuple('<?hh function foo_bar_UNTYPED() {}'),
      // Special-case factory functions:
      tuple('<?hh function Foo(): Foo {}'),
      tuple('<?hh function Foo(): Foo<T> {}'),
      tuple('<?hh function Foo(): __Private\Foo<T> {}'),
    ];
  }
}
