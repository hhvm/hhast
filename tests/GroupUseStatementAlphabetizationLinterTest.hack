/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

final class GroupUseStatementAlphabetizationLinterTest extends TestCase {
  use AutoFixingLinterTestTrait<Linters\ASTLintError>;

  protected function getLinter(
    string $file,
  ): Linters\GroupUseStatementAlphabetizationLinter {
    return Linters\GroupUseStatementAlphabetizationLinter::fromPath($file);
  }

  public function getCleanExamples(): vec<(string)> {
    return vec[
      tuple('<?hh use type Facebook\HHAST\{AbstractToken};'),
      tuple('<?hh use type Facebook\HHAST\{AbstractToken, AsToken};'),
      tuple('<?hh use type Facebook\{HHAST\AbstractToken, HHAST\AsToken};'),
    ];
  }
}
