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

use function Facebook\FBExpect\expect;
use namespace HH\Lib\{C, Str, Vec};
use namespace Facebook\HHAST;

final class MustUseBracesForControlFlowLinterTest extends TestCase {
  use AutoFixingLinterTestTrait<
    Linters\ASTLintError<
      HHAST\EditableSyntax,
      Linters\MustUseBracesForControlFlowLinter,
    >
  >;


  protected function getLinter(
    string $file,
  ): Linters\MustUseBracesForControlFlowLinter {
    return new Linters\MustUseBracesForControlFlowLinter($file);
  }

  public function getCleanExamples(): array<array<string>> {
    return [
      ['<?hh if (foo) { bar(); }'],
      ['<?hh if (foo) { bar(); } else { baz(); }'],
      ['<?hh foreach ($x as $y) { bar(); }'],
      ['<?hh while(true) { x(); }'],
    ];
  }

  public function getDirtyFixtures(): array<array<string>> {
    return [
      ['if_one_line'],
      ['if_two_lines'],
      ['if_else_two_lines'],
      ['if_else_four_lines'],
      ['if_else_comments'],
    ];
  }
}
