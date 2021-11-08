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

use type Facebook\HackTest\DataProvider;

abstract class StepBasedMigrationTest extends MigrationTest {
  abstract const type TMigration as StepBasedMigration;

  final public function getStepsAndExamples(): vec<(IMigrationStep, string)> {
    $out = vec[];
    $class = static::getClassname();
    $m = new $class('/var/empty');
    foreach ($this->getExamples() as list($example)) {
      foreach ($m->getSteps() as $step) {
        $out[] = tuple($step, $example);
      }
    }
    return $out;
  }

  <<DataProvider('getStepsAndExamples')>>
  final public async function testMigrationStepsAreIdempotent(
    IMigrationStep $step,
    string $example,
  ): Awaitable<void> {
    $rewrite = (Node $ast) ==> $ast->rewrite(($n, $_) ==> $step->rewrite($n));

    $ast = await from_file_async(
      File::fromPath(__DIR__.'/examples/'.$example.'.in'),
    );
    $ast = $rewrite($ast);

    expect($rewrite($ast)->getCode())->toBeSame(
      $ast->getCode(),
      'Step "%s" in %s is not text-idempotent',
      $step->getName(),
      static::getClassname(),
    );

    expect($rewrite($ast))->toBeSame(
      $ast,
      'Step "%s" in %s is not object-idempotent',
      $step->getName(),
      static::getClassname(),
    );
  }
}
