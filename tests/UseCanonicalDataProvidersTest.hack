/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */


namespace Facebook\HHAST;

final class UseCanonicalDataProvidersTest extends TestCase {
  use AutoFixingLinterTestTrait<ASTLintError>;

  protected function getLinter(string $file): UseCanonicalDataProvidersLinter {
    return UseCanonicalDataProvidersLinter::fromPath($file);
  }

  public function getCleanExamples(): vec<(string)> {
    return vec[
      tuple(<<<'REQUIRE_ONCE_FILE'
use type Facebook\HackTest\{DataProvider, HackTest};
use function Facebook\FBExpect\expect;

final class ATestClass extends HackTest {
  public function provideAdditions(): vec<(int, int, int)> {
    return vec[
      tuple(1, 1, 2),
    ];
  }

  <<DataProvider('provideAdditions')>>
  public function testAdder(int $a, int $b, int $expect): void {
    expect($a + $b)->toEqual($expect);
  }
}
REQUIRE_ONCE_FILE
      ),
    ];
  }
}
