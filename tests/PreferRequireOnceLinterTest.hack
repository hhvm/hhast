/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */


namespace Facebook\HHAST;

final class PreferRequireOnceLinterTest extends TestCase {
  use AutoFixingLinterTestTrait<ASTLintError>;

  protected function getLinter(string $file): PreferRequireOnceLinter {
    return PreferRequireOnceLinter::fromPath($file);
  }

  public function getCleanExamples(): vec<(string)> {
    return vec[
      tuple(<<<REQUIRE_ONCE_FILE
<?hh // strict

function no_top_level_require_allowed_in_future_maybe(): void {
  require_once __DIR__ . '/dont_run_this_code.hack';
}
REQUIRE_ONCE_FILE
      ),
    ];
  }
}
