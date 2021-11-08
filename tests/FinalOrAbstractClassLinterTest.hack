/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

final class FinalOrAbstractClassLinterTest extends TestCase {
  use LinterTestTrait;

  protected function getLinter(string $file): BaseLinter {
    return FinalOrAbstractClassLinter::fromPath($file);
  }

  public function getCleanExamples(): vec<(string)> {
    return vec[
      tuple('<?hh final class test {}'),
      tuple('<?hh abstract class test {}'),
      tuple('<?hh interface test {}'),
      tuple('<?hh trait test {}'),
      tuple('<?hh final class :page:test-page extends SomeXHPPage {}'),
      tuple('<?hh abstract final class test {}'),
    ];
  }
}
