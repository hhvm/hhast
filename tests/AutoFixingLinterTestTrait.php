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
use namespace HH\Lib\{C, Str, Vec};
use namespace Facebook\HHAST;

trait AutoFixingLinterTestTrait<Terror as Linters\FixableLintError> {
  require extends TestCase;
  use LinterTestTrait;

  abstract protected function getLinter(
    string $file,
  ): Linters\AutoFixingLinter<Terror>;

  /**
   * @dataProvider getDirtyFixtures
   */
  final public function testAutofix(string $fixture): void {
    $fixture = $this->getFullFixtureName($fixture);

    $linter = $this->getLinter(__DIR__.'/fixtures/'.$fixture.'.in');

    $code = $linter->getCodeWithFixedLintErrors($linter->getLintErrors());
    expect($code)->toMatchExpectFileWithInputFile(
      $fixture.'.autofix.expect',
      $fixture.'.in',
    );
  }
}
