/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

final class NoPHPEqualityLinterTest extends TestCase {
  use AutoFixingLinterTestTrait<ASTLintError>;

  <<__Override>>
  protected function getLinter(string $file): NoPHPEqualityLinter {
    return NoPHPEqualityLinter::fromPath($file);
  }

  <<__Override>>
  public function getCleanExamples(): vec<(string)> {
    return vec[
      tuple('<?hh "foo" === "bar";'),
      tuple('<?hh "foo" !== "bar";'),
      tuple('<?hh "foo" > "bar";'),
    ];
  }
}
