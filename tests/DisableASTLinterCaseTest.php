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

/**
 * Testing that we can disable a specific linter. Using
 * CamelCasedMethodsUnderscoredFunctionsLinter as the example.
 */
final class DisableASTLinterCaseTest extends TestCase {
  use LinterTestTrait;

  protected function getLinter(string $file): Linters\BaseLinter {
    return new Linters\CamelCasedMethodsUnderscoredFunctionsLinter($file);
  }

  public function getCleanExamples(): array<array<string>> {
    return [
      ['<?hh '.
       '/* HHAST_FIXME[CamelCasedMethodsUnderscoredFunctions] */. '.
       'function CamelCasing() { return null; }'
      ],
    ];
  }
}
