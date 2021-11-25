/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

final class NewlineAtEndOfFileLinterTest extends TestCase {
  use AutoFixingLinterTestTrait<SingleRuleLintError>;

  <<__Override>>
  protected function getLinter(string $file): NewlineAtEndOfFileLinter {
    return NewlineAtEndOfFileLinter::fromPath($file);
  }

  <<__Override>>
  public function getCleanExamples(): vec<(string)> {
    return vec[
      tuple("<?hh\n"),
      tuple("<?hh\nfoo();\n"),
      tuple("<?hh\nfoo();\n/* hello */\n"),
    ];
  }
}
