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
      ['<?hh class Foo { public function getFooBarAsync(): Awaitable<void> {} }'],
      ['<?hh class Foo { public function getFooBarUNSAFE() {} }'],
      ['<?hh class Foo { public function getFooBarAsyncxUNTYPED(): Awaitable<string> {} }'],
      ['<?hh class Foo { public function getFooBarDEPRECATED(): int {} }'],
      ['<?hh function foo_bar() {}'],
      ['<?hh function get_foo_bar_asyncx(): Awaitable<float> {}'],
      ['<?hh function foo_bar_UNSAFE() {}'],
      ['<?hh function foo_bar_async_UNTYPED(): Awaitable<int> {}'],
      ['<?hh function foo_bar_DEPRECATED(): void {}'],
      ['<?php class Foo { function defaultVisibilityIsPublic(): string {}' ],
      // functions that start with 'test':
      ['<?hh class Foo { public function testFoo() : Awaitable<string> {}'],
      ['<?hh function test_foo_async(): Awaitable<void> {}'],
    ];
  }
}
