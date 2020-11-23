/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

final class NoNewlineAsTheFirstLineOfABlockLinterTest extends TestCase {
  use AutoFixingLinterTestTrait<ASTLintError>;

  protected function getLinter(
    string $file,
  ): NoNewlineAsTheFirstLineOfABlockLinter {
    return NoNewlineAsTheFirstLineOfABlockLinter::fromPath($file);
  }

  public function getCleanExamples(): vec<(string)> {
    return vec[
      tuple(<<<'HACK'
async function main_async(): Awaitable<void> {
  echo "Hello, World!";
}
HACK
      ),
    ];
  }
}
