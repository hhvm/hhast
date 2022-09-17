/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

final class HHClientLinterAllowMarkerListTest extends TestCase {
  use LinterTestTrait;
  use HHClientLinterTestTrait;

  <<__Override>>
  public function getCleanExamples(): vec<(string)> {
    return vec[
      tuple("<?hh\n"),
    ];
  }

  const HHClientLinter::TConfig CONFIG = shape(
    'lintMarkerAllowList' => vec[5611, 5644],
  );
}
