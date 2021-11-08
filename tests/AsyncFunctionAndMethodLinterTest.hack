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

  protected function getLinter(string $file): BaseLinter {
    return AsyncFunctionAndMethodLinter::fromPath($file);
  }

  public function getCleanExamples(): vec<(string)> {
    return vec[
      tuple('<?hh class Foo { public function __construct() {} }'),
      tuple('<?hh class Foo { public function __destruct() {} }'),
      tuple('<?hh class Foo { public function fooBar() {} }'),
      tuple(
        '<?hh class Foo { public function getFooBarAsync(): Awaitable<void> {} }',
      ),
      tuple('<?hh class Foo { public function getFooBarUNSAFE() {} }'),
      tuple(
        '<?hh class Foo { public function getFooBarAsyncxUNTYPED(): Awaitable<string> {} }',
      ),
      tuple('<?hh class Foo { public function getFooBarDEPRECATED(): int {} }'),
      tuple('<?hh function foo_bar() {}'),
      tuple('<?hh function get_foo_bar_asyncx(): Awaitable<float> {}'),
      tuple('<?hh function foo_bar_UNSAFE() {}'),
      tuple('<?hh function foo_bar_async_UNTYPED(): Awaitable<int> {}'),
      tuple('<?hh function foo_bar_DEPRECATED(): void {}'),
      tuple(
        '<?hh class Foo { function defaultVisibilityIsPublic(): string {} }',
      ),
      // functions that start with 'test':
      tuple(
        '<?hh class Foo { public function testFoo() : Awaitable<string> {} }',
      ),
      tuple('<?hh function test_foo_async(): Awaitable<void> {}'),
    ];
  }
}
