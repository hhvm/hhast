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

final class NewlineAtEndOfFileLinterTest extends TestCase {
  use AutoFixingLinterTestTrait<Linters\FixableLintError>;

  protected function getLinter(
    string $file,
  ): Linters\AutoFixingLinter<Linters\FixableLintError> {
    return Linters\NewlineAtEndOfFileLinter::fromPath($file);
  }

  public function getCleanExamples(): array<array<string>> {
    return [["<?hh\n"], ["<?hh\nfoo();\n"], ["<?hh\nfoo();\n/* hello */\n"]];
  }
}
