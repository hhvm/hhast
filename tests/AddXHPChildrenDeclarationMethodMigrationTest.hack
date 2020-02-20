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

final class AddXHPChildrenDeclarationMethodMigrationTest
  extends StepBasedMigrationTest {
  const type TMigration = AddXHPChildrenDeclarationMethodMigration;

  <<__Override>>
  public function getExamples(): vec<(string)> {
    return \glob(
      __DIR__.'/examples/migrations/AddXHPChildrenDeclarationMethod/*.hack.in',
    )
      |> Vec\map(
        $$,
        $file ==> tuple(
          Str\strip_suffix($file, '.in')
            |> Str\strip_prefix($$, __DIR__.'/examples/'),
        ),
      );
  }
}
