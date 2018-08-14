<?hh // strict
/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

final class NoStringInterpolationLinterTest extends TestCase {
  use AutoFixingLinterTestTrait<Linters\FixableASTLintError<LiteralExpression>>;

  protected function getLinter(
    string $file,
  ): Linters\NoStringInterpolationLinter {
    return Linters\NoStringInterpolationLinter::fromPath($file);
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
