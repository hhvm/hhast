/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */


namespace Facebook\HHAST;

use function Facebook\HHAST\TestLib\expect;
use namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use type Facebook\HackTest\DataProvider;

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
      tuple(Migrations\AddFixMesMigration::class, 'migrations/add_fixmes.php'),
      tuple(
        Migrations\AssertToExpectMigration::class,
        'migrations/change_assert_to_expect.php',
      ),
      tuple(Migrations\HSLMigration::class, 'migrations/hsl.php'),
      tuple(
        Migrations\NamespaceFallbackMigration::class,
        'migrations/namespace_fallback.php',
      ),
      tuple(
        Migrations\PHPUnitToHackTestMigration::class,
        'migrations/PHPUnitToHackTest/dataprovider_and_comment.php',
      ),
      tuple(
        Migrations\PHPUnitToHackTestMigration::class,
        'migrations/PHPUnitToHackTest/expect_exception.php',
      ),
      tuple(
        Migrations\PHPUnitToHackTestMigration::class,
        'migrations/PHPUnitToHackTest/new_name_no_ns_with_use.php',
      ),
      tuple(
        Migrations\PHPUnitToHackTestMigration::class,
        'migrations/PHPUnitToHackTest/new_name_no_ns.php',
      ),
      tuple(
        Migrations\PHPUnitToHackTestMigration::class,
        'migrations/PHPUnitToHackTest/new_name_ns_direct.php',
      ),
      tuple(
        Migrations\PHPUnitToHackTestMigration::class,
        'migrations/PHPUnitToHackTest/setup_teardown.php',
      ),
      tuple(
        Migrations\PHPUnitToHackTestMigration::class,
        'migrations/PHPUnitToHackTest/old_name_no_ns.php',
      ),
      tuple(
        Migrations\PHPUnitToHackTestMigration::class,
        'migrations/PHPUnitToHackTest/old_name_ns_direct.php',
      ),
      tuple(
        Migrations\PHPUnitToHackTestMigration::class,
        'migrations/PHPUnitToHackTest/old_name_ns_with_use.php',
      ),
      tuple(
        Migrations\IsRefinementMigration::class,
        'migrations/is_refinement.php',
      ),
      tuple(
        Migrations\AwaitPrecedenceMigration::class,
        'migrations/await_precedence.php',
      ),
      tuple(
        Migrations\ExplicitPartialModeMigration::class,
        'migrations/ExplicitPartialMode/strict.php',
      ),
      tuple(
        Migrations\ExplicitPartialModeMigration::class,
        'migrations/ExplicitPartialMode/partial.php',
      ),
      tuple(
        Migrations\ExplicitPartialModeMigration::class,
        'migrations/ExplicitPartialMode/eof.php',
      ),
      tuple(
        Migrations\ExplicitPartialModeMigration::class,
        'migrations/ExplicitPartialMode/none.hack',
      ),
      tuple(
        Migrations\ExplicitPartialModeMigration::class,
        'migrations/ExplicitPartialMode/missing.php',
      ),
      tuple(
        Migrations\ExplicitPartialModeMigration::class,
        'migrations/ExplicitPartialMode/php.php',
      ),
      tuple(
        Migrations\ExplicitPartialModeMigration::class,
        'migrations/ExplicitPartialMode/extra_comments.php',
      ),
    ];
  }

  public function getMigrationSteps(
  ): array<
    (
      classname<Migrations\StepBasedMigration>,
      Migrations\IMigrationStep,
      string,
    )
  > {
    $out = array();
    foreach ($this->getMigrations() as $row) {
      list($class, $fixture) = $row;
      $instance = new $class('/var/empty');
      if (!$instance instanceof Migrations\StepBasedMigration) {
        continue;
      }
      $refined = TypeAssert\classname_of(
        Migrations\StepBasedMigration::class,
        $class,
      );
      foreach ($instance->getSteps() as $step) {
        $out[] = tuple($refined, $step, $fixture);
      }
    }
    return $out;
  }


  <<DataProvider('getMigrationSteps')>>
  public async function testMigrationStepsAreIdempotent(
    classname<Migrations\StepBasedMigration> $migration,
    Migrations\IMigrationStep $step,
    string $fixture,
  ): Awaitable<void> {
    $rewrite = (HHAST\EditableNode $ast) ==>
      $ast->rewrite(($n, $_) ==> $step->rewrite($n));

    $ast = await HHAST\from_file_async(
      HHAST\File::fromPath(__DIR__.'/fixtures/'.$fixture.'.in'),
    );
    $ast = $rewrite($ast);

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

  <<DataProvider('getMigrations')>>
  public async function testMigrationHasExpectedOutput(
    classname<Migrations\BaseMigration> $migration,
    string $fixture,
  ): Awaitable<void> {
    using $temp = new TestLib\TemporaryProject(
      __DIR__.'/fixtures/'.$fixture.'.in',
    );
    $file = $temp->getFilePath();
    $ast = await HHAST\from_file_async(HHAST\File::fromPath($file));

    $migration = new $migration($temp->getRootPath());

    $ast = $migration->migrateFile($file, $ast);

    expect($ast->getCode())->toMatchExpectFile($fixture.'.expect');
  }

  <<DataProvider('getMigrations')>>
  public async function testMigrationIsIdempotent(
    classname<Migrations\BaseMigration> $migration,
    string $fixture,
  ): Awaitable<void> {
    using $temp = new TestLib\TemporaryProject(
      __DIR__.'/fixtures/'.$fixture.'.in',
    );
    $file = $temp->getFilePath();
    $ast = await HHAST\from_file_async(HHAST\File::fromPath($file));

    $root = $temp->getRootPath();
    $migration = () ==> new $migration($root);

    $ast = $migration()->migrateFile($file, $ast);
    \file_put_contents($file, $ast->getCode());
    $new_ast = $migration()->migrateFile($file, $ast);

    expect($new_ast->getCode())->toBeSame(
      $ast->getCode(),
      'Migrating the AST twice should produce identical text to once',
    );

    expect($new_ast)->toBeSame(
      $ast,
      'Migrating the AST twice should get you the same AST object',
    );
  }

  public function testHslMigrationReturnsSameResults(): void {
    $base_path = __DIR__.'/fixtures/migrations/hsl.php';
    $handle = \HH\Lib\Tuple\from_async(
      HHAST\__Private\execute_async('hhvm', '--no-config', $base_path.'.in'),
      HHAST\__Private\execute_async(
        'hhvm',
        '--no-config',
        $base_path.'.expect',
      ),
    );
    list($phpstdlib_results, $hsl_results) = \HH\Asio\join($handle);
    expect($hsl_results)->toBeSame(
      $phpstdlib_results,
      'HSL and PHP functions return same results',
    );
  }
}
