/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

final class NoFinalMethodInFinalClassLinterTest extends TestCase {
  use AutoFixingLinterTestTrait<ASTLintError>;

  protected function getLinter(string $file): NoFinalMethodInFinalClassLinter {
    return NoFinalMethodInFinalClassLinter::fromPath($file);
  }

  public function getCleanExamples(): vec<(string)> {
    return vec[
      tuple(<<<FINAL_CLASS_NO_FINAL_METHOD
<?hh // strict

final class Herp {
  public function derp(): void { }
}
FINAL_CLASS_NO_FINAL_METHOD
      ),
      tuple(<<<NON_FINAL_CLASS_FINAL_METHOD
<?hh // strict

class Herp {
  final public function derp(): void { }
}
NON_FINAL_CLASS_FINAL_METHOD
      ),
      tuple(<<<FINAL_CLASS_NO_METHODS
<?hh // strict

final class Herp { }
FINAL_CLASS_NO_METHODS
      ),
    ];
  }
}
