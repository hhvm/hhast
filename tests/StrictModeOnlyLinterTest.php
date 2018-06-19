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

final class StrictModeOnlyLinterTest extends TestCase {
  use AutoFixingLinterTestTrait<Linters\FixableASTLintError<MarkupSuffix>>;

  protected function getLinter(string $file): Linters\StrictModeOnlyLinter {
    return new Linters\StrictModeOnlyLinter($file);
  }

  public function getCleanExamples(): array<array<string>> {
    return [
      ["<?hh // strict\n"],
      ["<?hh // strict\n/* foo */\n\nfunction bar() {}"],
      ["<?hh // strict\n// foo;"],
      ["<?php // hello, world;"],
      ["<? // hello, world"],
    ];
  }
}
