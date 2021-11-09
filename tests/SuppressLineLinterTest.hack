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
 * Testing that we can suppress a specific line based linter. Using NoWhitespaceAtEndOfLineLinter
 * as the example.
 */
final class SuppressLineLinterTest extends TestCase {
  use LinterTestTrait;

  protected function getLinter(string $file): SingleRuleLinter {
    return NoWhitespaceAtEndOfLineLinter::fromPath($file);
  }

  public function getCleanExamples(): vec<(string)> {
    return vec[
      tuple(
        '<?hh'.
        " /* HHAST_FIXME[NoWhitespaceAtEndOfLine] */\n".
        ' function NoWhiteSpace() { return null; }         ',
      ),
    ];
  }
}
