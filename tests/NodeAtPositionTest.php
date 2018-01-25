<?hh // strict

/**
 * Copyright (c) 2016, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional
 * grant of patent rights can be found in the PATENTS file in the same
 * directory.
 *
 */

namespace Facebook\HHAST;

use function Facebook\FBExpect\expect;
use namespace HH\Lib\{C, Vec};

final class NodeAtPositionTest extends TestCase {
  public function getExamples(): array<(string, (int, int), classname<EditableNode>, string)> {
    return [
      tuple(
        "<?hh\nreturn 123;\n",
        tuple(2, 1),
        ReturnStatement::class,
        "return 123;\n",
      ),
      tuple(
        "<?hh\n  return 123;\n",
        tuple(2, 3),
        ReturnStatement::class,
        "  return 123;\n",
      ),
    ];
  }

  /**
   * @dataProvider getExamples
   */
  public function testNodeAtPosition(
    string $code,
    (int, int) $position,
    classname<EditableNode> $node_class,
    string $node_code,
  ): void {
    list($line, $column) = $position;

    $root = from_code($code);
    $node = find_node_at_position($root, $line, $column);

    expect($node)->toBeInstanceOf($node_class);
    expect($node->getCode())->toBeSame($node_code);
  }
}
