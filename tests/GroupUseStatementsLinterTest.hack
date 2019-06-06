/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

final class GroupUseStatementsLinterTest extends TestCase {
  use AutoFixingLinterTestTrait<Linters\ASTLintError>;

  protected function getLinter(string $file): Linters\GroupUseStatementsLinter {
    return Linters\GroupUseStatementsLinter::fromPath($file);
  }

  public function getCleanExamples(): array<array<string>> {
    return [
      ['<?hh use namespace HH\C;'],
      ['<?hh use namespace HH\{Lib\Vec, Lib\Math};'],
    ];
  }
}
