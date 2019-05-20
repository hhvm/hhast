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
  use AutoFixingLinterTestTrait<Linters\ASTLintError>;

  protected function getLinter(
    string $file,
  ): Linters\NoPHPEqualityLinter{
    return Linters\NoPHPEqualityLinter::fromPath($file);
  }

  public function getCleanExamples(): array<array<string>> {
    return [
      ['<?hh "foo" === "bar";'],
      ['<?hh "foo" !== "bar";'],
      ['<?hh "foo" > "bar";'],
    ];
  }
}
