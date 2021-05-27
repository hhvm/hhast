/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

final class NewLintErrorSuppressionMechanismTest extends TestCase {
  use LinterTestTrait;

  protected function getLinter(string $file): BaseLinter {
    return DontAwaitInALoopLinter::fromPathWithConfigAndSuppressionAliasses(
      $file,
      null,
      keyset['This is a polling loop'],
    );
  }

  public function getCleanExamples(): vec<(string)> {
    return vec[
      tuple(<<<'HACK'
<?hh

async function old_styles(): Awaitable<void> {
  while(false) {
    /* HHAST_IGNORE_ERROR[DontAwaitInALoop] */
    await in_a_loop();
    // HHAST_IGNORE_ERROR[DontAwaitInALoop]
    await in_a_loop();
    /* HHAST_FIXME[DontAwaitInALoop] */
    await in_a_loop();
    // HHAST_FIXME[DontAwaitInALoop]
    await in_a_loop();
  }
}
HACK
      ),
      tuple(<<<'HACK'
<?hh

async function new_styles(): Awaitable<void> {
  while(false) {
    /* HHAST_IGNORE[DontAwaitInALoop] */
    await in_a_loop();
    // HHAST_IGNORE[DontAwaitInALoop]
    await in_a_loop();
    /* @lint-ignore DontAwaitInALoop */
    await in_a_loop();
    // @lint-ignore DontAwaitInALoop
    await in_a_loop();
    /* @lint-fixme DontAwaitInALoop */
    await in_a_loop();
    // @lint-fixme DontAwaitInALoop
    await in_a_loop();
  }
}
HACK
      ),
      tuple(<<<'HACK'
<?hh

async function aliased(): Awaitable<void> {
  while(false) {
    // This is a polling loop
    await in_a_loop();
  }
}
HACK
      ),
    ];
  }
}
