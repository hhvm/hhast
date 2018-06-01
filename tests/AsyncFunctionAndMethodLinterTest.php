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

final class AsyncFunctionAndMethodLinterTest extends TestCase {
  use LinterTestTrait;

  protected function getLinter(
    string $file,
  ): Linters\BaseLinter {
    return new Linters\AsyncFunctionAndMethodLinter($file);
  }

  public function getCleanExamples(): array<array<string>> {
    return [
      ['<?hh class Foo { public function __construct() {} }'],
      ['<?hh class Foo { public function __destruct() {} }'],
      ['<?hh class Foo { public function fooBar() {} }'],
      ['<?hh class Foo { public function getFooBarAsync(): Awaitable {} }'],
      ['<?hh class Foo { public function getFooBarUNSAFE() {} }'],
      ['<?hh class Foo { public function getFooBarAsyncxUNTYPED(): Awaitable {} }'],
      ['<?hh class Foo { public function getFooBarDEPRECATED(): int {} }'],
      ['<?hh function foo_bar() {}'],
      ['<?hh function get_foo_bar_asyncx(): Awaitable {}'],
      ['<?hh function foo_bar_UNSAFE() {}'],
      ['<?hh function foo_bar_async_UNTYPED(): Awaitable {}'],
      ['<?hh function foo_bar_DEPRECATED(): void {}'],
      // functions that start with 'test':
      ['<?hh class Foo { public function testFoo() : Awaitable {}'],
      ['<?hh function test_foo_async(): Awaitable<T> {}'],
    ];
  }
}
