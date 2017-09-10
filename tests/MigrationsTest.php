<?hh // strict

/**
 * Copyright (c) 2016, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional
 * grant of patent rights can be found in the PATENTS file in the same
 * directory.
 *
 */

namespace Facebook\HHAST;

use function Facebook\FBExpect\expect;
use namespace Facebook\HHAST;
use namespace HH\Lib\{C, Str};

final class MigrationsTest extends TestCase {
  public function getMigrationsToRun(
  ): array<(classname<Migrations\BaseMigration>, string)> {
    return [
      tuple(
        Migrations\OptionalShapeFieldsMigration::class,
        'migrations/optional_shape_fields.php',
      ),
    ];
  }

  /**
   * @dataProvider getMigrationsToRun
   */
  public function testMigration(
    classname<Migrations\BaseMigration> $migration,
    string $fixture,
  ): void {
    $ast = HHAST\from_file(__DIR__.'/fixtures/'.$fixture.'.in');

    $migration = new $migration();

    $ast = $migration->migrateAst($ast);

    $this->assertMatches(
      $ast->full_text(),
      $fixture.'.expect',
    );
  }
}
