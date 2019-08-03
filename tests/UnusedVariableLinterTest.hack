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
  use AutoFixingLinterTestTrait<ASTLintError>;

  protected function getLinter(string $file): UnusedVariableLinter {
    return UnusedVariableLinter::fromPath($file);
  }

  public function getCleanExamples(): vec<(string)> {
    return vec[
      tuple('<?hh function foo() { $bar = 1; return $bar; }'),
      tuple('<?hh function foo() { $_bar = 1; return 2; }'),
      tuple('<?hh function foo() { $GLOBALS["foo"] = "bar"; }'),
      tuple('<?hh function foo($xs) { foreach($xs as $x) { echo $x; } }'),
      tuple('<?hh function foo($xs) { foreach($xs as $i => $x) { echo $i; echo $x; } }'),
      tuple('<?hh function foo() { $k = 1; return dict[1 => 2][$k]; }'),
      tuple('<?hh function foo($d) { $k = 1; $d[$k] = 5; return $d; }'),
      tuple('<?hh function foo() { $d = []; return $d[1]; }'),
      tuple('<?hh function foo() { $d = []; $d["a"] = "b"; f($d["a"]); }'),
      tuple('<?hh function foo(&$d) { $d = 5; }'),
      tuple('<?hh function foo(inout $d) { $d = 5; }'),
      tuple('<?hh function foo() { $users = []; $u = ["id" => 15]; $users[$u["id"]] = 5; return $users; }'),
      tuple('<?hh function foo() { $s = "a"; echo "{$s}"; }'),
      // TODO: Decide whether to support "${}" style string interpolation
      // tuple('<?hh function foo() { $s = "a"; echo "${s}"; }'),
      // tuple('<?hh function foo() { $d = dict["a" => "b"]; echo "${d[\'a\']}"; }'),
      tuple('<?hh class C { public function foo() { $bar = 1; return $bar; } }'),
      tuple('<?hh class C { public function foo() { $_bar = 1; return 2; } }'),
      tuple('<?hh class C { public function foo() { $GLOBALS["foo"] = "bar"; } }'),
      tuple('<?hh class C { public function foo($xs) { foreach($xs as $x) { echo $x; } } }'),
      tuple('<?hh class C { public function foo($xs) { foreach($xs as $i => $x) { echo $i; echo $x; } } }'),
      tuple('<?hh class C { public function foo() { $k = 1; return dict[1 => 2][$k]; } }'),
      tuple('<?hh class C { public function foo($d) { $k = 1; $d[$k] = 5; return $d; } }'),
      tuple('<?hh class C { public function foo() { $d = []; return $d[1]; } }'),
      tuple('<?hh class C { public function foo() { $d = []; $d["a"] = "b"; f($d["a"]); } }'),
      tuple('<?hh class C { public function foo(&$d) { $d = 5; } }'),
      tuple('<?hh class C { public function foo(inout $d) { $d = 5; } }'),
      tuple('<?hh class C { public function foo() { $users = []; $u = ["id" => 15]; $users[$u["id"]] = 5; return $users; } }'),
      tuple('<?hh class C { public function foo() { $s = "a"; echo "{$s}"; } }'),
      // TODO: Decide whether to support "${}" style string interpolation
      // tuple('<?hh class C { public function foo() { $s = "a"; echo "${s}"; } }'),
      // tuple('<?hh class C { public function foo() { $d = dict["a" => "b"]; echo "${d[\'a\']}"; } }'),
    ];
  }
}
