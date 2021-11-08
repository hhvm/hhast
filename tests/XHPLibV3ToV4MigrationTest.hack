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

final class XHPLibV3ToV4MigrationTest extends MigrationTest {
  const type TMigration = XHPLibV3ToV4Migration;

  <<__Override>>
  public function getExamples(): vec<(string)> {
    return Vec\map(
      \glob(__DIR__.'/examples/migrations/XHPLibV3ToV4/*.hack.in'),
      $file ==> tuple(
        Str\strip_suffix($file, '.in')
          |> Str\strip_prefix($$, __DIR__.'/examples/'),
      ),
    );
  }
}
