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
  use AutoFixingLinterTestTrait<ASTLintError>;

  protected function getLinter(string $file): NoStringInterpolationLinter {
    return NoStringInterpolationLinter::fromPath($file);
  }

  public function getCleanExamples(): vec<(string)> {
    return vec[
      tuple('<?hh "foobar";'),
      tuple('<?hh "foo"."bar";'),
      tuple('<?hh "foo".$bar;'),
      tuple('<?hh "foo".$bar."baz";'),
      tuple('<?hh "foo{bar}baz";'),
    ];
  }
}
