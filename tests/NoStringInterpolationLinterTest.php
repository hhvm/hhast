<?hh // strict
/**
 * Copyright (c) 2016, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional
 * grant of patent rights can be found in the PATENTS file in the same
 * directory.
 *
 */

namespace Facebook\HHAST;

final class NoStringInterpolationLinterTest extends TestCase {
  use AutoFixingLinterTestTrait<Linters\FixableASTLintError<LiteralExpression>>;

  protected function getLinter(
    string $file,
  ): Linters\NoStringInterpolationLinter {
    return new Linters\NoStringInterpolationLinter($file);
  }

  public function getCleanExamples(): array<array<string>> {
    return [
      ['<?hh "foobar";'],
      ['<?hh "foo"."bar";'],
      ['<?hh "foo".$bar;'],
      ['<?hh "foo".$bar."baz";'],
      ['<?hh "foo{bar}baz";'],
    ];
  }
}
