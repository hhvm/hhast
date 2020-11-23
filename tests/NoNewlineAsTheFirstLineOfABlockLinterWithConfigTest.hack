/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

final class NoNewlineAsTheFirstLineOfABlockLinterWithConfigTest
  extends TestCase {
  use AutoFixingLinterTestTrait<ASTLintError>;

  protected function getLinter(
    string $file,
  ): NoNewlineAsTheFirstLineOfABlockLinter {
    return NoNewlineAsTheFirstLineOfABlockLinter::fromPathWithConfig(
      $file,
      shape(
        'permit_newlines_after' => vec[
          'class',
          'if',
          'interface',
          'trait',
          '==>',
        ],
      ),
    );
  }

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
if (true) {

  $newline = 0;
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
