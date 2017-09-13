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

use function Facebook\FBExpect\expect;
use namespace HH\Lib\{C, Str, Vec};
use namespace Facebook\HHAST;

final class MustUseOverrideAttributeLinterTest extends TestCase {
  use AutoFixingLinterTestTrait<
    Linters\ASTLintError<
      HHAST\MethodishDeclaration,
      Linters\MustUseOverrideAttributeLinter,
    >
  >;


  protected function getLinter(
    string $file,
  ): Linters\MustUseOverrideAttributeLinter {
    return new Linters\MustUseOverrideAttributeLinter($file);
  }

  public function getCleanExamples(): array<array<string>> {
    return [
      ['<?hh class Foo {}'],
      ['<?hh class Foo { function do_stuff(){}; }'],
      [
          '<?hh '.
          'class Foo extends '.self::class.' {'.
          'public function everyoneLovesMagicTrevor(){}'.
          '}'
      ],
      [
          '<?hh '.
          'class Foo extends '.self::class.' {'.
          '<<__Override>>'.
          'public function '.__FUNCTION__.'(){}'.
          '}'
      ],
      [
          '<?hh '.
          'class Foo extends '.self::class.' {'.
          'public function __construct(){}'.
          '}'
      ],
      [
          '<?hh '.
          'class Foo extends '.self::class.' {'.
          'public function __destruct(){}'.
          '}'
      ],
    ];
  }

  public function getDirtyFixtures(): array<array<string>> {
    return [
      ['overrides_parent'],
      ['overrides_grandparent'],
      ['with_leading_newline'],
      ['with_other_attribute'],
      ['with_other_attribute_with_value'],
      ['with_leading_comment'],
      ['with_leading_comment_and_other_attribute'],
    ];
  }
}
