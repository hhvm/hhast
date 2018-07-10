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

final class UseStatementWithLeadingBackslashLinterTest extends TestCase {
  use LinterTestTrait;

  protected function getLinter(string $file): Linters\BaseLinter {
    return new Linters\UseStatementWithLeadingBackslashLinter($file);
  }

  public function getCleanExamples(): array<array<string>> {
    return [
      ["<?hh\nuse Foo;"],
      ["<?hh\nuse type Foo;"],
      ["<?hh\nuse namespace Foo;"],
      ["<?hh\nuse type Foo;"],
      ["<?hh\nuse function Foo;"],
      ["<?hh\nuse function Foo\Bar;"],
      ["<?hh\nuse function Foo\{Bar, Baz};"],
      ["<?hh\nuse function Foo\{Bar, Herp\Derp};"],
    ];
  }
}
