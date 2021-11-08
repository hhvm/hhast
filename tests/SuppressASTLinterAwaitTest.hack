/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

/**
 * Testing that we can disable a specific linter. Using DontAwaitInALoopLinter
 * as the example.
 */
final class SuppressASTLinterAwaitTest extends TestCase {
  use LinterTestTrait;

  protected function getLinter(string $file): BaseLinter {
    return DontAwaitInALoopLinter::fromPath($file);
  }

  public function getCleanExamples(): vec<(string)> {
    // this tests that we can check for the comment in the parents until we hit a statement.
    return vec[
      tuple(
        '<?hh '.
        'async function await_all<T>(vec<Awaitable<T>> $in): Awaitable<vec<T>> {'.
        '  $out = vec[];'.
        '  foreach ($in as $item) {'.
        '    /* HHAST_FIXME[DontAwaitInALoop] */ '.
        '    $out[] = await $item;'.
        '  }'.
        '  return $out;'.
        '}',
      ),
    ];
  }
}
