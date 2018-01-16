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

use function Facebook\HHAST\TestLib\expect;
use namespace Facebook\HHAST;
use namespace HH\Lib\{C, Str};
use namespace Facebook\TypeAssert;

final class MigrationsTest extends TestCase {
  public function getMigrations(
  ): array<(classname<Migrations\BaseMigration>, string)> {
    return [
      tuple(
        Migrations\OptionalShapeFieldsMigration::class,
        'migrations/optional_shape_fields.php',
      ),
      tuple(
        Migrations\ImplicitShapeSubtypesMigration::class,
        'migrations/implicit_shape_subtypes.php',
      ),
      tuple(
        Migrations\CallTimePassByReferenceMigration::class,
        'migrations/call_time_pass_by_reference.php',
      ),
      tuple(
        Migrations\AddFixMesMigration::class,
        'migrations/add_fixmes.php',
      ),
    ];
  }

  public function getMigrationSteps(
  ): array<(
    classname<Migrations\StepBasedMigration>,
    Migrations\IMigrationStep,
    string
  )> {
    $out = array();
    foreach ($this->getMigrations() as $row) {
      list($class, $fixture) = $row;
      $instance = new $class();
      if (!$instance instanceof Migrations\StepBasedMigration) {
        continue;
      }
      $refined = TypeAssert\classname_of(
        Migrations\StepBasedMigration::class,
        $class,
      );
      foreach ($instance->getSteps() as $step) {
        $out[] = tuple(
          $refined,
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
  public function testMigrationStepsAreIdempotent(
    classname<Migrations\StepBasedMigration> $migration,
    Migrations\IMigrationStep $step,
    string $fixture,
  ): void {
    $rewrite = $ast ==> $ast->rewrite(($n, $_) ==> $step->rewrite($n));

    $ast = HHAST\from_file(__DIR__.'/fixtures/'.$fixture.'.in')
      |> $rewrite($$);

    expect($rewrite($ast)->getCode())->toBeSame(
      $ast->getCode(),
      'Step "%s" in %s is not text-idempotent',
      $step->getName(),
      $migration,
    );

    expect($rewrite($ast))->toBeSame(
      $ast,
      'Step "%s" in %s is not object-idempotent',
      $step->getName(),
      $migration,
    );
  }

  /**
   * @dataProvider getMigrations
   */
  public function testMigrationHasExpectedOutput(
    classname<Migrations\BaseMigration> $migration,
    string $fixture,
  ): void {
    using $temp = new TestLib\TemporaryProject(
      __DIR__.'/fixtures/'.$fixture.'.in',
    );
    $file = $temp->getFilePath();
    $ast = HHAST\from_file($file);

    $migration = new $migration();

    $ast = $migration->migrateFile($file, $ast);

    expect($ast->getCode())->toMatchExpectFile($fixture.'.expect');
  }

  /**
   * @dataProvider getMigrations
   */
  public function testMigrationIsIdempotent(
    classname<Migrations\BaseMigration> $migration,
    string $fixture,
  ): void {
    using $temp = new TestLib\TemporaryProject(
      __DIR__.'/fixtures/'.$fixture.'.in',
    );
    $file = $temp->getFilePath();
    $ast = HHAST\from_file($file);

    $migration = new $migration();

    $ast = $migration->migrateFile($file, $ast);
    \file_put_contents($file, $ast->getCode());
    $new_ast = $migration->migrateFile($file, $ast);

    expect($new_ast->getCode())->toBeSame(
      $ast->getCode(),
      'Migrating the AST twice should produce identical text to once',
    );

    expect($new_ast)->toEqual(
      $ast,
      'Migrating the AST twice should get you an equal AST object',
    );

    expect($new_ast)->toBeSame(
      $ast,
      'Migrating the AST twice should get you the same AST object',
    );
  }
}
