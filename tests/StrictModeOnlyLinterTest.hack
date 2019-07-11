/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

final class StrictModeOnlyLinterTest extends TestCase {
  use AutoFixingLinterTestTrait<Linters\ASTLintError>;

  protected function getLinter(string $file): Linters\StrictModeOnlyLinter {
    return Linters\StrictModeOnlyLinter::fromPath($file);
  }

  public function getCleanExamples(): vec<(string)> {
    return vec[
      tuple("<?hh // strict\n"),
      tuple("<?hh // strict\n/* foo */\n\nfunction bar() {}"),
      tuple("<?hh // strict\n// foo;"),
      tuple("<?php // hello, world;"),
      tuple("<? // hello, world"),
    ];
  }
}
