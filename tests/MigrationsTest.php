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
  public function getMigrations(
  ): array<(classname<Migrations\BaseMigration>, string)> {
    return [
      tuple(
        Migrations\OptionalShapeFieldsMigration::class,
        'migrations/optional_shape_fields.php',
      ),
    ];
  }

  public function getMigrationSteps(
  ): array<(
    classname<Migrations\BaseMigration>,
    Migrations\IMigrationStep,
    string
  )> {
    $out = array();
    foreach ($this->getMigrations() as $row) {
      list($class, $fixture) = $row;
      foreach ((new $class())->getSteps() as $step) {
        $out[] = tuple(
          $class,
          $step,
          $fixture,
        );
      }
    }
    return $out;
  }


  /**
   * @dataProvider getMigrationSteps
   */
  public function testMigrationStepsAreIndividuallyIdempotent(
    classname<Migrations\BaseMigration> $migration,
    Migrations\IMigrationStep $step,
    string $fixture,
  ): void {
    $ast = HHAST\from_file(__DIR__.'/fixtures/'.$fixture.'.in')
      |> $step->rewrite($$);

    expect($step->rewrite($ast)->full_text())->toBeSame(
      $ast->full_text(),
      'Step "%s" in %s is not idempotent for text',
      $step->getName(),
      $migration,
    );

    expect($step->rewrite($ast))->toBeSame(
      $ast,
      'Step "%s" in %s is not idempotent for nodes',
      $step->getName(),
      $migration,
    );
  }

  /**
   * @dataProvider getMigrations
   */
  public function testMigrationStepsAreIdempotentWhenStacked(
    classname<Migrations\BaseMigration> $migration_class,
    string $fixture,
  ): void {
    $migration = new $migration_class();
    $ast = HHAST\from_file(__DIR__.'/fixtures/'.$fixture.'.in');

    foreach ($migration->getSteps() as $step) {
      $ast = $step->rewrite($ast);

      expect($step->rewrite($ast)->full_text())->toBeSame(
        $ast->full_text(),
        'Step "%s" in %s is not text-idempotent for output of previous steps',
        $step->getName(),
        $migration_class,
      );

      expect($step->rewrite($ast))->toBeSame(
        $ast,
        'Step "%s" in %s is not node-idempotent for output of previous steps',
        $step->getName(),
        $migration_class,
      );
    }
  }

  /**
   * @dataProvider getMigrations
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

    expect(
      $migration->migrateAst($ast)->full_text()
    )->toBeSame(
      $ast->full_text(),
      'Migrating the AST twice should produce identical results to once',
    );

    $this->markTestIncomplete('some ast transform happening');
    return;

    expect(
      $migration->migrateAst($ast),
    )->toBeSame(
      $ast,
      'Migrating the AST twice should get you the same AST, not just text',
    );
  }
}
