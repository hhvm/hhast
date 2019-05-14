/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use function Facebook\FBExpect\expect;
use type Facebook\HackTest\DataProvider;

final class OffsetFromPositionTest extends TestCase {
  public function getExamples(): array<(string, (int, int), int)> {
    return [
      tuple("<?hh // strict \n", tuple(1, 1), 0),
      tuple("<?hh // strict \n", tuple(1, 3), 2),
      tuple("<?hh\nbar()\n", tuple(2, 1), 5),
      tuple("<?hh\nbar()\n", tuple(2, 2), 6),
    ];
  }

  <<DataProvider('getExamples')>>
  public async function testOffsetFromPosition(
    string $code,
    (int, int) $position,
    int $expected_offset,
  ): Awaitable<void> {
    list($line, $column) = $position;

    $root = await from_file_async(File::fromPathAndContents('/dev/null', $code));
    $actual_offset = offset_from_position($root, $line, $column);
    expect($actual_offset)->toBeSame(
      $expected_offset,
      'Expected line %d column %d to be offset %d, but got %d',
      $line,
      $column,
      $expected_offset,
      $actual_offset,
    );
  }
}
