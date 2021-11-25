/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

/**
 * Testing that we can suppress a specific linter error. Using
 * CamelCasedMethodsUnderscoredFunctionsLinter as the example.
 */
final class SuppressASTLinterCaseTest extends TestCase {
  use LinterTestTrait;

  <<__Override>>
  protected function getLinter(string $file): SingleRuleLinter {
    return CamelCasedMethodsUnderscoredFunctionsLinter::fromPath($file);
  }

  <<__Override>>
  public function getCleanExamples(): vec<(string)> {
    return vec[
      tuple(
        "<?hh\n".
        '/* HHAST_FIXME[CamelCasedMethodsUnderscoredFunctions] */ '.
        'function CamelCasing() { return null; }',
      ),
      tuple(
        '<?hh '.
        '/* HHAST_FIXME[CamelCasedMethodsUnderscoredFunctions] */ '.
        'function CamelCasing() { return null; }',
      ),
      tuple(
        "<?hh\n".
        'foo(); /* HHAST_FIXME[CamelCasedMethodsUnderscoredFunctions] */ '.
        'function CamelCasing() { return null; }',
      ),
      tuple(
        "<?hh\n".
        'foo(); '.
        'bar(); /* HHAST_FIXME[CamelCasedMethodsUnderscoredFunctions] */ '.
        'function CamelCasing() { return null; }',
      ),
    ];
  }
}
