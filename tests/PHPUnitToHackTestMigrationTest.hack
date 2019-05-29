/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

final class PHPUnitToHackTestMigrationTest extends StepBasedMigrationTest {
  const type TMigration = Migrations\PHPUnitToHackTestMigration;

  <<__Override>>
  public function getExamples(): vec<(string)> {
    return vec[
      tuple('migrations/PHPUnitToHackTest/dataprovider_and_comment.php'),
      tuple('migrations/PHPUnitToHackTest/expect_exception.php'),
      tuple('migrations/PHPUnitToHackTest/new_name_no_ns_with_use.php'),
      tuple('migrations/PHPUnitToHackTest/new_name_no_ns.php'),
      tuple('migrations/PHPUnitToHackTest/new_name_ns_direct.php'),
      tuple('migrations/PHPUnitToHackTest/setup_teardown.php'),
      tuple('migrations/PHPUnitToHackTest/old_name_no_ns.php'),
      tuple('migrations/PHPUnitToHackTest/old_name_ns_direct.php'),
      tuple('migrations/PHPUnitToHackTest/old_name_ns_with_use.php'),
    ];
  }
}
