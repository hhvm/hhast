/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;


final class XHPClassModifierMigrationTest extends StepBasedMigrationTest {
  const type TMigration = XHPClassModifierMigration;

  <<__Override>>
  public function getExamples(): vec<(string)> {
    return vec[tuple('migrations/xhp_class_modifier.hack')];
  }
}
