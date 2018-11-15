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

final class NoEmptyStatementsLinterTest extends TestCase {
  use AutoFixingLinterTestTrait<Linters\ASTLintError<ExpressionStatement>>;

  protected function getLinter(string $file): Linters\NoEmptyStatementsLinter {
    return Linters\NoEmptyStatementsLinter::fromPath($file);
  }

  public function getCleanExamples(): array<array<string>> {
    return [['<?hh fn_call(); '], ['<?hh for(;;) { }']];
  }
}
