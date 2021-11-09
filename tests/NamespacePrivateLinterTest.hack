/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

final class NamespacePrivateLinterTest extends TestCase {
  use LinterTestTrait;

  protected function getLinter(string $file): SingleRuleLinter {
    return NamespacePrivateLinter::fromPath($file);
  }

  public function getCleanExamples(): vec<(string)> {
    return vec[
      tuple('<?hh function test();'),
    ];
  }
}
