<?hh // strict
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
use namespace HH\Lib\{Str, Vec};

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
    \copy($in, $out);
    $linter = $this->getLinter($out);

    $all_errors = vec(\HH\Asio\join($linter->getLintErrorsAsync()));
    $fixable = Vec\filter($all_errors, $err ==> $err->isFixable());
    $unfixable = Vec\filter($all_errors, $err ==> !$err->isFixable());
    $linter->fixLintErrors($fixable);

    $code = \file_get_contents($out);
    expect($code)->toMatchExpectFileWithInputFile(
      $fixture.'.autofix.expect',
      $fixture.'.in',
    );

    $linter = $this->getLinter(__DIR__.'/fixtures/'.$fixture.'.autofix.expect');

    expect(Vec\map(
      \HH\Asio\join($linter->getLintErrorsAsync()),
      $e ==> self::getErrorAsShape($e),
    ))
      ->toBeSame(Vec\map($unfixable, $e ==> self::getErrorAsShape($e)));
  }
}
