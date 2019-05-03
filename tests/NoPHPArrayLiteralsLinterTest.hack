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
  use AutoFixingLinterTestTrait<Linters\ASTLintError<EditableNode>>;

  protected function getLinter(string $file): Linters\NoPHPArrayLiteralsLinter {
    return Linters\NoPHPArrayLiteralsLinter::fromPath($file);
  }

  public function getCleanExamples(): array<array<string>> {
    return [
      ['<?hh $a = vec[];'],
      ['<?hh $a = vec[1, 2];'],
      ['<?hh $a = dict[];'],
      ['<?hh $a = dict["a" => 1, "b" => 2];'],
      ['<?hh $a = vec[dict["a" => vec[], "b" => vec[1, 2]]];'],
    ];
  }
}
