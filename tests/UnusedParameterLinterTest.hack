/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

final class UnusedParameterLinterTest extends TestCase {
  use AutoFixingLinterTestTrait<ASTLintError>;

  <<__Override>>
  protected function getLinter(string $file): UnusedParameterLinter {
    return UnusedParameterLinter::fromPath($file);
  }

  <<__Override>>
  public function getCleanExamples(): vec<(string)> {
    return vec[
      tuple('<?hh function foo(int $bar) { return $bar; }'),
      tuple('<?hh function foo(int $bar) { var_dump($bar); }'),
      tuple('<?hh function foo(int $_) { }'),
      tuple('<?hh function foo(int $_bar) { }'),
      tuple('<?hh class Foo { public function bar(int $_) { } }'),
      tuple(
        '<?hh class Foo { public function bar(int $baz) { var_dump($baz); } }',
      ),
      tuple('<?hh interface Foo { public function bar(int $baz); }'),
      tuple(
        '<?hh abstract class Foo { abstract public function bar(int $baz); }',
      ),
      tuple(
        '<?hh class Foo { public function __construct(private int $bar) {} }',
      ),
      tuple(
        // Lambda's are no longer flagged by this linter
        '<?hh function _(): void { ($a) ==> 0; (... $a) ==> 0; $a ==> 0; }',
      ),
    ];
  }
}
