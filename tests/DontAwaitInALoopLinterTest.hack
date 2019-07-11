/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

final class DontAwaitInALoopLinterTest extends TestCase {
  use LinterTestTrait;

  protected function getLinter(
    string $file,
  ): Linters\BaseLinter {
    return Linters\DontAwaitInALoopLinter::fromPath($file);
  }

  public function getCleanExamples(): vec<(string)> {
    return vec[
      tuple('<?hh function foo() { await $bar(); }'),
      tuple('<?hh function foo() { $x = await $bar(); }'),
      tuple('<?hh function foo() { return await $bar(); }'),
      tuple(
        '<?hh function foo($x) {'.
        '  $v = Vector {};'.
        '  foreach ($x as $y) { $v[] = async { await herp(); }; }'.
        '  return await HH\Asio\v($v);'.
        '}',
      ),
      tuple(
        '<?hh function foo($x) {'.
        '  $v = Vector {};'.
        '  foreach ($x as $y) { $v[] = (async () ==> await $y)(); }'.
        '  return await HH\Asio\v($v);'.
        '}',
      ),
      tuple(
        '<?hh function foo($x) {'.
        '  $v = Vector {};'.
        '  foreach ($x as $y) {'.
        '    $v[] = (function($it) { return await $yt; })($y);'.
        '  }'.
        '  return await HH\Asio\v($v);'.
        '}',
      ),
    ];
  }
}
