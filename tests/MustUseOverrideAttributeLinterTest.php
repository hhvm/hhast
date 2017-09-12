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
use namespace HH\Lib\{C, Str, Vec};
use namespace Facebook\HHAST;

final class MustUseOverrideAttributeLinterTest extends TestCase {
  public function getCleanExamples(): array<array<string>> {
    return [
      ['<?hh class Foo {}'],
      ['<?hh class Foo { function do_stuff(){}; }'],
      [
          '<?hh '.
          'class Foo extends '.self::class.' {'.
          'public function everyoneLovesMagicTrevor(){}'.
          '}'
      ],
      [
          '<?hh '.
          'class Foo extends '.self::class.' {'.
          '<<__Override>>'.
          'public function '.__FUNCTION__.'(){}'.
          '}'
      ],
      [
          '<?hh '.
          'class Foo extends '.self::class.' {'.
          'public function __construct(){}'.
          '}'
      ],
      [
          '<?hh '.
          'class Foo extends '.self::class.' {'.
          'public function __destruct(){}'.
          '}'
      ],
    ];
  }

  /**
   * @dataProvider getCleanExamples
   */
  public function testCleanExample(string $code): void {
    $file = tempnam(
      sys_get_temp_dir(),
      'hhast-test',
    );
    file_put_contents($file, $code);
    try {
      $linter = new Linters\MustUseOverrideAttributeLinter($file);
      expect(C\first($linter->getLintErrors()))->toBeNull();
    } finally {
      unlink($file);
    }
  }

  public function getDirtyFixtures(): array<array<string>> {
    return [
      ['overrides_parent'],
      ['overrides_grandparent'],
    ];
  }

  /**
   * @dataProvider getDirtyFixtures
   */
  public function testDirtyFixtures(string $fixture): void {
    $fixture = 'MustUseOverrideAttributeLinter/'.$fixture.'.php';

    $linter = new Linters\MustUseOverrideAttributeLinter(
      __DIR__.'/fixtures/'.$fixture.'.in',
    );

    $out = $linter->getLintErrors()
      |> Vec\map(
        $$,
        $error ==> shape(
          'blame' => $error->getBlameCode(),
          'blame_pretty' => $error->getPrettyBlameCode(),
          'description' => $error->getDescription(),
        ),
      )
      |> json_encode($$, JSON_PRETTY_PRINT)."\n";
    $this->assertMatches($out, $fixture.'.expect');
  }
}
