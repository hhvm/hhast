/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

final class ExplicitPartialModeMigrationTest extends MigrationTest {
  const type TMigration = ExplicitPartialModeMigration;

  <<__Override>>
  public function getExamples(): vec<(string)> {
    return vec[
      tuple('migrations/ExplicitPartialMode/strict.php'),
      tuple('migrations/ExplicitPartialMode/partial.php'),
      tuple('migrations/ExplicitPartialMode/eof.php'),
      tuple('migrations/ExplicitPartialMode/none.hack'),
      tuple('migrations/ExplicitPartialMode/missing.php'),
      tuple('migrations/ExplicitPartialMode/php.php'),
      tuple('migrations/ExplicitPartialMode/extra_comments.php'),
    ];
  }
}
