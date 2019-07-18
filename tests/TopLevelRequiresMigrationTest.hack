/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use namespace HH\Lib\{Str, Vec};

final class TopLevelRequiresMigrationTest extends MigrationTest {
  const type TMigration = TopLevelRequiresMigration;

  <<__Override>>
  public function getExamples(): vec<(string)> {
    $prefix = __DIR__.'/examples/';
    $dir = $prefix.'migrations/TopLevelRequires/';
    return Vec\concat(\glob($dir.'*.php.in'), \glob($dir.'*.hack.hack'))
      |> Vec\map(
        $$,
        $file ==>
          tuple(Str\strip_suffix(Str\strip_prefix($file, $prefix), '.in')),
      );
  }
}
