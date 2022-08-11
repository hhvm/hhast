/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

final class UnusedLambdaParameterLinterTest extends TestCase {
  use AutoFixingLinterTestTrait<ASTLintError>;

  <<__Override>>
  protected function getLinter(string $file): UnusedLambdaParameterLinter {
    return UnusedLambdaParameterLinter::fromPath($file);
  }

  <<__Override>>
  public function getCleanExamples(): vec<(string)> {
    return vec[
      tuple('<?hh function _(): void {$x ==> $x + 1;}'),
      tuple('<?hh function _(): void {($x) ==> $x + 1;}'),
      tuple('<?hh function _(): void {(... $xs) ==> C\count($xs);}'),
      tuple('<?hh function _(): void {$_unused ==> 0;}'),
      tuple('<?hh function _(): void {($_unused) ==> 0;}'),
      tuple('<?hh function _(): void {(... $_unused) ==> 0;}'),
      tuple('<?hh function _(): void {$x ==> $y ==> $x + $y;}'),
      tuple('<?hh function _(): void {$x ==> $_y ==> $z ==> $x + $z;}'),
      tuple('<?hh function _(): void {$x ==> { return $x; };}'),
    ];
  }
}
