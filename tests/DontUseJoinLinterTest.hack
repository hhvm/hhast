/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

final class DontUseJoinLinterTest extends TestCase {
  use LinterTestTrait;

  protected function getLinter(string $file): BaseLinter {
    return DontUseJoinLinter::fromPath($file);
  }

  public function getCleanExamples(): vec<(string)> {
    return vec[
      tuple('<?hh function main(): void {HH\Lib\Str\join(vec[], \'\');}'),
      tuple(
        '<?hh use namespace HH\Lib\Str function main(): void {Str\join(vec[], \'\');}',
      ),
      tuple(
        '<?hh use function HH\Lib\Str\join function main(): void {join(vec[], \'\');}',
      ),
      tuple(
        '<?hh use namespace HH\Lib\Str as Asio function main(): void {Asio\join(vec[], \'\');}',
      ),
    ];
  }
}
