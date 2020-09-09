/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;


final class RemoveXHPChildDeclarationsMigrationTest
  extends StepBasedMigrationTest {
  const type TMigration = RemoveXHPChildDeclarationsMigration;

  <<__Override>>
  public function getExamples(): vec<(string)> {
    return vec[tuple('migrations/remove_xhp_child_declarations.hack')];
  }
}
