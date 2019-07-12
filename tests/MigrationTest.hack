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
use type Facebook\HackTest\DataProvider;
use namespace HH\Lib\{C, Str};

abstract class MigrationTest extends TestCase {
  abstract const type TMigration as BaseMigration;

  public function getExamples(): vec<(string)> {
    $fname = Str\format(
      'migrations/%s.php',
      static::getClassname()
        |> Str\split($$, '\\')
        |> C\lastx($$)
        |> __Private\StrP\underscored($$)
        |> Str\lowercase($$)
        |> Str\strip_suffix($$, '_migration'),
    );
    $full = __DIR__.'/examples/'.$fname.'.in';
    if (!\file_exists($full)) {
      $fname = Str\strip_suffix($fname, '.php').'.hack';
      $full = __DIR__.'/examples/'.$fname.'.in';
    }
    expect(\file_exists($full))->toBeTrue('File "%s" does not exist', $full);
    return vec[tuple($fname)];
  }

  <<__MemoizeLSB>>
  final protected static function getClassname(): classname<this::TMigration> {
    return type_structure(static::class, 'TMigration')['classname'];
  }

  <<DataProvider('getExamples')>>
  final public async function testMigrationHasExpectedOutput(
    string $example,
  ): Awaitable<void> {
    $migration = static::getClassname();
    await using $temp = new TestLib\TemporaryProject(
      __DIR__.'/examples/'.$example.'.in',
    );
    $file = $temp->getFilePath();
    $ast = await HHAST\from_file_async(HHAST\File::fromPath($file));

    $migration = new $migration($temp->getRootPath());

    $ast = $migration->migrateFile($file, $ast);

    expect($ast->getCode())->toMatchExpectFile($example.'.expect');
  }

  <<DataProvider('getExamples')>>
  public async function testMigrationIsIdempotent(
    string $example,
  ): Awaitable<void> {
    $migration = static::getClassname();
    await using $temp = new TestLib\TemporaryProject(
      __DIR__.'/examples/'.$example.'.in',
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

  final public function testIsUsingCorrectTestClass(): void {
    if (
      \is_a(
        static::getClassname(),
        StepBasedMigration::class, /* string = */
        true,
      )
    ) {
      expect($this)->toBeInstanceOf(StepBasedMigrationTest::class);
    }
  }
}
