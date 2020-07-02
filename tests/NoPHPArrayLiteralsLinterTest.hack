/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

final class NoPHPArrayLiteralsLinterTest extends TestCase {
  use AutoFixingLinterTestTrait<ASTLintError>;

  protected function getLinter(string $file): NoPHPArrayLiteralsLinter {
    if (\HHVM_VERSION_ID >= 406500) {
      self::markTestSkipped(
        'PHP array literals are not supported in this version',
      );
    }
    return NoPHPArrayLiteralsLinter::fromPath($file);
  }

  public function getCleanExamples(): vec<(string)> {
    return vec[
      tuple('<?hh $a = vec[];'),
      tuple('<?hh $a = vec[1, 2];'),
      tuple('<?hh $a = dict[];'),
      tuple('<?hh $a = dict["a" => 1, "b" => 2];'),
      tuple('<?hh $a = vec[dict["a" => vec[], "b" => vec[1, 2]]];'),
    ];
  }
}
