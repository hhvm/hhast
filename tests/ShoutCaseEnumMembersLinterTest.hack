/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

final class ShoutCaseEnumMembersLinterTest extends TestCase {
  use AutoFixingLinterTestTrait<ASTLintError>;

  <<__Override>>
  protected function getLinter(string $file): ShoutCaseEnumMembersLinter {
    return ShoutCaseEnumMembersLinter::fromPath($file);
  }

  <<__Override>>
  public function getCleanExamples(): vec<(string)> {
    return vec[
      tuple('enum EmptyEnum: int {}'),
      tuple(<<<EXAMPLE
enum FullShoutCase: int {
  WORD = 1;
  WORD_WITH_UNDERSCORES = 2;
  NUM1 = 3;
  W0RD_W1TH_NUM_AND_UND3RSC0R3S = 4;
}
EXAMPLE
      ),
    ];
  }
}
