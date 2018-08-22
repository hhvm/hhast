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


final class MustUseBracesForControlFlowLinterTest extends TestCase {
  use AutoFixingLinterTestTrait<
    Linters\ASTLintError<IControlFlowStatement>
  >;


  protected function getLinter(
    string $file,
  ): Linters\MustUseBracesForControlFlowLinter {
    return Linters\MustUseBracesForControlFlowLinter::fromPath($file);
  }

  public function getCleanExamples(): array<array<string>> {
    return [
      ['<?hh if (foo) { bar(); }'],
      ['<?hh if (foo) { bar(); } else { baz(); }'],
      ['<?hh foreach ($x as $y) { bar(); }'],
      ['<?hh while(true) { x(); }'],
    ];
  }
}
