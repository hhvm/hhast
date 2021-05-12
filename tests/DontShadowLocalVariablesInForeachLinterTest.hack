/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

final class DontShadowLocalVariablesInForeachLinterTest extends TestCase {
  use LinterTestTrait;

  protected function getLinter(string $file): BaseLinter {
    return DontShadowLocalVariablesInForeachLinter::fromPath($file);
  }

  public function getCleanExamples(): vec<(string)> {
    return vec[
      tuple(<<<'HACK'
<?hh function _(vec<mixed> $param): void {
  foreach($param as $thing) {}
}
HACK
      ),
      tuple(<<<'HACK'
<?hh function _(vec<mixed> $param): void {
  foreach(vec[] as $parameter) {}
}
HACK
      ),
      tuple(<<<'HACK'
<?hh function _(vec<mixed> $parameter): void {
  foreach(vec[] as $param) {}
}
HACK
      ),
      tuple(<<<'HACK'
<?hh function _(): void {
  foreach(vec[] as $later) {}
  $later = '';
}
HACK
      ),
      tuple(<<<'HACK'
<?hh function _(): void {
  $_ = 'special cased';
  foreach(vec[] as $key => $_) {}
}
HACK
      ),
      tuple(<<<'HACK'
<?hh function _($param): void {
  foreach(vec[] as $x->param) {}
}
HACK
      ),
      tuple(<<<'HACK'
<?hh function _($param): void {
  $old_style = function (): void use ($use) {
    // We don't check this, use `==>` ^^^^
    foreach(vec[] as $use) {}
  };
}
HACK
      ),
    ];
  }
}
