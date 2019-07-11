/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

final class UseStatementWithAsLinterTest extends TestCase {
  use LinterTestTrait;

  protected function getLinter(string $file): Linters\UseStatementWithAsLinter {
    return Linters\UseStatementWithAsLinter::fromPath($file);
  }

  public function getCleanExamples(): vec<(string)> {
    return vec[
      tuple("<?hh\nuse Foo;"),
      tuple("<?hh\nuse type Foo;"),
      tuple("<?hh\nuse namespace Foo;"),
      tuple("<?hh\nuse type Foo;"),
      tuple("<?hh\nuse function Foo;"),
    ];
  }
}
