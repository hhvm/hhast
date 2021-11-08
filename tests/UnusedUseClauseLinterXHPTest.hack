/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

final class UnusedUseClauseLinterXHPTest extends TestCase {
  use AutoFixingLinterTestTrait<ASTLintError>;

  protected function getLinter(string $file): AutoFixingASTLinter {
    if (!\ini_get('hhvm.hack.lang.disable_xhp_element_mangling')) {
      self::markTestSkipped(
        'requires hhvm.hack.lang.disable_xhp_element_mangling=true',
      );
    }
    return UnusedUseClauseLinter::fromPath($file);
  }

  public function getCleanExamples(): vec<(string)> {
    return vec[
      tuple("<?hh\nuse type foo; <foo />;"),
      tuple("<?hh\nuse type foo; <foo>bar</foo>;"),
    ];
  }
}
