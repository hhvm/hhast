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

trait LinterTestTrait {
  require extends TestCase;

  abstract protected function getLinter(string $file): Linters\BaseLinter ;

  abstract public function getCleanExamples(): array<array<string>>;
  abstract public function getDirtyFixtures(): array<array<string>>;

  final protected function getFullFixtureName(string $name): string {
    return static::class
      |> explode('\\', $$)
      |> C\lastx($$)
      |> Str\strip_suffix($$, 'Test')
      |> $$.'/'.$name.'.php';
  }

  /**
   * @dataProvider getCleanExamples
   */
  final public function testCleanExample(string $code): void {
    $file = tempnam(
      sys_get_temp_dir(),
      'hhast-test',
    );
    file_put_contents($file, $code);
    try {
      $linter = $this->getLinter($file);
      expect(C\first($linter->getLintErrors()))->toBeNull(
        'Got lint errors on supposedly-clean example',
      );
    } finally {
      unlink($file);
    }
  }

  /**
   * @dataProvider getDirtyFixtures
   */
  final public function testDirtyFixtures(string $fixture): void {
    $fixture = $this->getFullFixtureName($fixture);

    $linter = $this->getLinter(__DIR__.'/fixtures/'.$fixture.'.in');

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
