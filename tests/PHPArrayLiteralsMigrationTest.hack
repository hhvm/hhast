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

final class PHPArrayLiteralsMigrationTest extends StepBasedMigrationTest {
  const type TMigration = PHPArrayLiteralsMigration;

  <<__Override>>
  public function getExamples(): vec<(string)> {
    if (\HHVM_VERSION_ID >= 407000) {
      // 4.70 was skipped but this condition also needs to cover 4.70-dev
      self::markTestSkipped('Array literals were removed in HHVM 4.71');
    }
    $examples = \glob(__DIR__.'/examples/migrations/PHPArrayLiterals/*.hack.in')
      |> Vec\map(
        $$,
        $file ==> tuple(
          Str\strip_suffix($file, '.in')
            |> Str\strip_prefix($$, __DIR__.'/examples/'),
        ),
      );
    if (\HHVM_VERSION_ID < 44400) {
      return $examples;
    }
    return Vec\filter(
      $examples,
      $ex ==> !Str\contains($ex[0], 'square_brackets'),
    );
  }
}
