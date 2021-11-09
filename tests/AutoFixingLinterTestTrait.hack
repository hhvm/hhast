/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use type Facebook\HackTest\DataProvider;
use function Facebook\HHAST\TestLib\expect;
use namespace HH\Lib\Str;

trait AutoFixingLinterTestTrait<Terror as SingleRuleLintError> {
  require extends TestCase;
  use LinterTestTrait;

  abstract protected function getLinter(string $file): AutoFixingLinter<Terror>;

  <<DataProvider('getDirtyFixtures')>>
  final public function testAutofix(string $example): void {
    $example = $this->getFullFixtureName($example);

    $in = __DIR__.'/examples/'.$example.'.in';
    $out = Str\strip_suffix($in, '.in').'.autofix.out';
    \copy($in, $out);
    $linter = $this->getLinter($out);

    /*HHAST_FIXME[DontUseAsioJoin]*/
    $all_errors = vec(\HH\Asio\join($linter->getLintErrorsAsync()));
    $code = $linter->getFixedFile($all_errors)->getContents();
    // Provide raw output for easier debugging
    \file_put_contents($out, $code);

    expect($code)->toMatchExpectFileWithInputFile(
      $example.'.autofix.expect',
      $example.'.in',
    );

    $linter = $this->getLinter(__DIR__.'/examples/'.$example.'.autofix.expect');
    /*HHAST_FIXME[DontUseAsioJoin]*/
    $errors = \HH\Asio\join($linter->getLintErrorsAsync());
    $re_fixed = $linter->getFixedFile($errors)->getContents();
    expect($re_fixed)->toBeSame($code, 'Not all fixable errors were fixed');
  }
}
