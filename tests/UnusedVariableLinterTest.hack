/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

final class UnusedVariableLinterTest extends TestCase {
  use AutoFixingLinterTestTrait<Linters\ASTLintError>;

  protected function getLinter(string $file): Linters\UnusedVariableLinter {
    return Linters\UnusedVariableLinter::fromPath($file);
  }

  public function getCleanExamples(): array<array<string>> {
    return [
      ['<?hh function foo() { $bar = 1; return $bar; }'],
      ['<?hh function foo() { $_bar = 1; return 2; }'],
      ['<?hh function foo() { $GLOBALS["foo"] = "bar"; }'],
      ['<?hh function foo($xs) { foreach($xs as $x) { echo $x; } }'],
      ['<?hh function foo($xs) { foreach($xs as $i => $x) { echo $i; echo $x; } }'],
      ['<?hh function foo() { $k = 1; return dict[1 => 2][$k]; }'],
      ['<?hh function foo($d) { $k = 1; $d[$k] = 5; return $d; }'],
      ['<?hh function foo() { $d = []; return $d[1]; }'],
      ['<?hh function foo() { $d = []; $d["a"] = "b"; f($d["a"]); }'],
      ['<?hh function foo(&$d) { $d = 5; }'],
      ['<?hh function foo(inout $d) { $d = 5; }'],
      ['<?hh function foo() { $users = []; $u = ["id" => 15]; $users[$u["id"]] = 5; return $users; }'],
      ['<?hh class C { public function foo() { $bar = 1; return $bar; } }'],
      ['<?hh class C { public function foo() { $_bar = 1; return 2; } }'],
      ['<?hh class C { public function foo() { $GLOBALS["foo"] = "bar"; } }'],
      ['<?hh class C { public function foo($xs) { foreach($xs as $x) { echo $x; } } }'],
      ['<?hh class C { public function foo($xs) { foreach($xs as $i => $x) { echo $i; echo $x; } } }'],
      ['<?hh class C { public function foo() { $k = 1; return dict[1 => 2][$k]; } }'],
      ['<?hh class C { public function foo($d) { $k = 1; $d[$k] = 5; return $d; } }'],
      ['<?hh class C { public function foo(&$d) { $d = 5; } }'],
      ['<?hh class C { public function foo(inout $d) { $d = 5; } }'],
      ['<?hh class C { public function foo() { $users = []; $u = ["id" => 15]; $users[$u["id"]] = 5; return $users; } }'],
    ];
  }
}
