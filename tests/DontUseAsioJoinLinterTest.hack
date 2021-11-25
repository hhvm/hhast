/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

final class DontUseAsioJoinLinterTest extends TestCase {
  use LinterTestTrait;

  <<__Override>>
  protected function getLinter(string $file): SingleRuleLinter {
    return DontUseAsioJoinLinter::fromPath($file);
  }

  <<__Override>>
  public function getCleanExamples(): vec<(string)> {
    return vec[
      tuple('<?hh'),
      tuple(
        '<?hh namespace HH\Lib\Str; function main(): void { join(vec[], "");}',
      ),
      tuple(
        '<?hh use HH\Lib\Str; function main(): void { Str\\join(vec[], "");}',
      ),
    ];
  }
}
