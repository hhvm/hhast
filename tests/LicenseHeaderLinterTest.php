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

use function Facebook\FBExpect\expect;
use namespace HH\Lib\{C, Str, Vec};
use namespace Facebook\HHAST;

final class LicenseHeaderLinterTest extends TestCase {
  use AutoFixingLinterTestTrait<Linters\FixableASTLintError<Script>>;

  protected function getLinter(
    string $file,
  ): Linters\LicenseHeaderLinter {
    return new Linters\LicenseHeaderLinter($file);
  }

  public function getCleanExamples(): array<array<string>> {
    return [
      ["<?hh\n".\file_get_contents(__DIR__.'/../.LICENSE_HEADER.hh.txt')],
    ];
  }
}
