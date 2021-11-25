/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

final class MustUseBracesForControlFlowLinterTest extends TestCase {
  use AutoFixingLinterTestTrait<ASTLintError>;

  <<__Override>>
  protected function getLinter(
    string $file,
  ): MustUseBracesForControlFlowLinter {
    return MustUseBracesForControlFlowLinter::fromPath($file);
  }

  <<__Override>>
  public function getCleanExamples(): vec<(string)> {
    return vec[
      tuple('<?hh if (foo) { bar(); }'),
      tuple('<?hh if (foo) { bar(); } else { baz(); }'),
      tuple('<?hh foreach ($x as $y) { bar(); }'),
      tuple('<?hh while(true) { x(); }'),
    ];
  }
}
