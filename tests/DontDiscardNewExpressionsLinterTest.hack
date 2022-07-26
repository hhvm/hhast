/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

final class DontDiscardNewExpressionsLinterTest extends TestCase {
  use LinterTestTrait;

  <<__Override>>
  protected function getLinter(string $file): DontDiscardNewExpressionsLinter {
    return DontDiscardNewExpressionsLinter::fromPathWithConfig(
      $file,
      shape('exceptionSuffixes' => vec['Exception', 'MyCustomSuffix']),
    );
  }

  <<__Override>>
  public function getCleanExamples(): vec<(string)> {
    return vec[
      tuple('<?hh function _(): void { $_ = new DateTime(); }'),
      tuple('<?hh function _(): void { $x = new DateTime(); }'),
      tuple('<?hh function _(): DateTime { return new DateTime(); }'),
      tuple('<?hh function _(): nothing { throw new Exception(); }'),
      tuple('<?hh function _(): void { (new MyClass())->drop(); }'),
    ];
  }
}
