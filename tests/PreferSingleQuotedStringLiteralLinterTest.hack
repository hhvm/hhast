/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

final class PreferSingleQuotedStringLiteralLinterTest extends TestCase {
  use AutoFixingLinterTestTrait<ASTLintError>;

  protected function getLinter(
    string $file,
  ): PreferSingleQuotedStringLiteralLinter {
    return PreferSingleQuotedStringLiteralLinter::fromPath($file);
  }

  public function getCleanExamples(): vec<(string)> {
    return vec[
      tuple(<<<'CODE'
<?hh // strict
function main(): void {"\n";}
CODE
      ),
      tuple(<<<'CODE'
<?hh // strict
function main(): void {"\t";}
CODE
      ),
      tuple(<<<'CODE'
<?hh // strict
function main(): void {"don\'t";}
CODE
      ),
      tuple(<<<'CODE'
<?hh // strict
function main(): void {"\1";}
CODE
      ),
      tuple(<<<'CODE'
<?hh // strict
function main(): void {"\12";}
CODE
      ),
      tuple(<<<'CODE'
<?hh // strict
function main(): void {"\123";}
CODE
      ),
      tuple(<<<'CODE'
<?hh // strict
function main(): void {"\x80";}
CODE
      ),
      tuple(<<<'CODE'
<?hh // strict
function main(): void {"\x0";}
CODE
      ),
      tuple(<<<'CODE'
<?hh // strict
function main(): void {"\u{1234}";}
CODE
      ),
      tuple(<<<'CODE'
<?hh // strict
function main(): void {re"#a#";}
CODE
      ),
      tuple(<<<'CODE'
<?hh // strict
function main(): void {"$test";}
CODE
      ),
    ];
  }
}
