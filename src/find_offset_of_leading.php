<?hh // strict
/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use namespace HH\Lib\{C, Vec};

function find_offset_of_leading(
  EditableNode $root,
  EditableNode $node,
  ?vec<EditableNode> $stack = null
): int {
  if ($root === $node) {
    return 0;
  }

  $parents = null;
  $found = false;

  if ($stack === null) {
    $stack = $root->findWithParents($it ==> $it === $node);
  }
  invariant(
    !C\is_empty($stack),
    'did not find node in root',
  );
  invariant(
    C\lastx($stack) === $node,
    'expected node at top of stack',
  );

  $stack_count = C\count($stack);
  $parent = $stack[$stack_count - 2];

  $within_parent = 0;
  foreach ($parent->getChildren() as $child) {
    if ($child === $node) {
      break;
    }
    $within_parent += $child->getWidth();
  }

  $stack = Vec\take($stack, $stack_count - 1);

  return $within_parent + find_offset_of_leading(
    $root,
    $parent,
    $stack
  );
}
