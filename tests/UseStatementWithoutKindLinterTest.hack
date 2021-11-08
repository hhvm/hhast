/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

final class UseStatementWithoutKindLinterTest extends TestCase {
  use AutoFixingLinterTestTrait<ASTLintError>;

  protected function getLinter(string $file): UseStatementWithoutKindLinter {
    return UseStatementWithoutKindLinter::fromPath($file);
  }

  public function getCleanExamples(): vec<(string)> {
    return vec[
      tuple("<?hh\nuse type Foo;"),
      tuple("<?hh\nuse namespace Foo;"),
      tuple("<?hh\nuse function Foo;"),
      tuple("<?hh\nuse const Foo;"),
      tuple("<?hh\nuse type Foo\\{Bar, Baz};"),
    ];
  }
}
