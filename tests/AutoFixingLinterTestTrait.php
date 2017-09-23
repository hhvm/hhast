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

    $in = __DIR__.'/fixtures/'.$fixture.'.in';
    $out = Str\strip_suffix($in, '.in').'.autofix.out';
    copy($in, $out);
    $linter = $this->getLinter($out);

    $linter->fixLintErrors($linter->getLintErrors());
    $code = file_get_contents($out);
    expect($code)->toMatchExpectFileWithInputFile(
      $fixture.'.autofix.expect',
      $fixture.'.in',
    );

    $linter = $this->getLinter(
      __DIR__.'/fixtures/'.$fixture.'.autofix.expect'
    );
    expect(vec($linter->getLintErrors()))->toBeSame(vec[]);
  }
}
