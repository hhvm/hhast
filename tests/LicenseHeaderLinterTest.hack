/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

final class LicenseHeaderLinterTest extends TestCase {
  use AutoFixingLinterTestTrait<ASTLintError>;

  <<__Override>>
  protected function getLinter(string $file): LicenseHeaderLinter {
    LicenseHeaderLinter::__setExpectedHeaderForTesting(
      \file_get_contents(__DIR__.'/../.LICENSE_HEADER.hh.txt'),
    );
    return LicenseHeaderLinter::fromPath($file);
  }

  <<__Override>>
  public function getCleanExamples(): vec<(string)> {
    $header = \file_get_contents(__DIR__.'/../.LICENSE_HEADER.hh.txt');
    return vec[
      // .php, hh
      tuple("<?hh\n".$header),
      tuple("<?hh // strict\n".$header),
      tuple("<?hh // partial\n".$header),
      // .hack
      tuple($header),
      tuple(
        $header.
        "\n".
        "use namespace HH\Lib\Str;\n".
        "<<__EntryPoint>>\n".
        "function main(): noreturn { exit (0); }\n",
      ),
    ];
  }
}
