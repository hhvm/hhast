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
  use AutoFixingLinterTestTrait<ASTLintError>;

  protected function getLinter(string $file): MustUseOverrideAttributeLinter {
    return MustUseOverrideAttributeLinter::fromPath($file);
  }

  public function getCleanExamples(): vec<(string)> {
    return vec[
      tuple('<?hh class Foo {}'),
      tuple('<?hh class Foo { function do_stuff(){}; }'),
      tuple(
        '<?hh '.
        'class Foo extends '.
        self::class.
        ' {'.
        'public function everyoneLovesMagicTrevor(){}'.
        '}',
      ),
      tuple(
        '<?hh '.
        'class Foo extends '.
        self::class.
        ' {'.
        '<<__Override>>'.
        'public function '.
        __FUNCTION__.
        '(){}'.
        '}',
      ),
      tuple(
        '<?hh '.
        'class Foo extends '.
        self::class.
        ' {'.
        'public function __construct(){}'.
        '}',
      ),
      tuple(
        '<?hh '.
        'class Foo extends '.
        self::class.
        ' {'.
        'public function __destruct(){}'.
        '}',
      ),
    ];
  }
}
