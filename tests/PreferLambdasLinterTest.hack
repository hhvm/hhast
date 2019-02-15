/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */


namespace Facebook\HHAST;

use type Facebook\HHAST\AnonymousFunction;

final class PreferLambdasLinterTest extends TestCase {
  use AutoFixingLinterTestTrait<Linters\ASTLintError<AnonymousFunction>>;

  protected function getLinter(string $file): Linters\PreferLambdasLinter {
    return Linters\PreferLambdasLinter::fromPath($file);
  }

  public function getCleanExamples(): array<array<string>> {
    return [
      ['<?hh $fn = () ==> 5; '],
      ['<?hh $fn = ($a, $b) ==> { return $a === $b; }'],
    ];
  }
}
