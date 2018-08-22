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


final class MustUseOverrideAttributeLinterTest extends TestCase {
  use AutoFixingLinterTestTrait<
    Linters\ASTLintError<MethodishDeclaration>
  >;

  protected function getLinter(
    string $file,
  ): Linters\MustUseOverrideAttributeLinter {
    return Linters\MustUseOverrideAttributeLinter::fromPath($file);
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
}
