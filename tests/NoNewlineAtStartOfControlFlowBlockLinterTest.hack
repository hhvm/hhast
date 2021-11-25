/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

final class NoNewlineAtStartOfControlFlowBlockLinterTest extends TestCase {
  use AutoFixingLinterTestTrait<ASTLintError>;

  <<__Override>>
  protected function getLinter(
    string $file,
  ): NoNewlineAtStartOfControlFlowBlockLinter {
    return NoNewlineAtStartOfControlFlowBlockLinter::fromPath($file);
  }

  <<__Override>>
  public function getCleanExamples(): vec<(string)> {
    return vec[
      tuple(<<<'HACK'
final class Newline {

  public null $null;
}
HACK
      ),
      tuple(<<<'HACK'
interface Newline {

  public function f(): void;
}
HACK
      ),
      tuple(<<<'HACK'
trait Newline {

  public null $null;
}
HACK
      ),
      tuple(<<<'HACK'
function main(): void {
  () ==> {

    $newline = 0;
  };
}
HACK
      ),
    ];
  }
}
