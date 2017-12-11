<?hh // strict
/**
 * Copyright (c) 2016, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional
 * grant of patent rights can be found in the PATENTS file in the same
 * directory.
 *
 */

namespace Facebook\HHAST;

final class UseStatementWithAsLinterTest extends TestCase {
  use
    AutoFixingLinterTestTrait<Linters\FixableASTLintError<NamespaceUseClause>>;

  protected function getLinter(string $file): Linters\UseStatementWithAsLinter {
    return new Linters\UseStatementWithAsLinter($file);
  }

  public function getCleanExamples(): array<array<string>> {
    return [
      ["<?hh\nuse Foo;"],
      ["<?hh\nuse type Foo;"],
      ["<?hh\nuse namespace Foo;"],
      ["<?hh\nuse type Foo;"],
      ["<?hh\nuse function Foo;"],
    ];
  }
}
