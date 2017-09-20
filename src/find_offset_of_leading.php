<?hh // strict
/**
 * Copyright (c) 2016, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the 'hack' directory of this source tree. An additional
 * grant of patent rights can be found in the PATENTS file in the same
 * directory.
 *
 */

namespace Facebook\HHAST;

use namespace HH\Lib\{C, Vec};

function find_offset_of_leading(
  EditableNode $root,
  EditableNode $node,
): int {
  if ($root === $node) {
    return 0;
  }

  $parents = null;
  $found = false;
  invariant(
    !C\is_empty($root->getDescendantsWhere(($it, $_p) ==> $it === $node)),
    'node is not a descendant of root',
  );
  $stack = $root->findWithParents($it ==> $it === $node);
  invariant(
    !C\is_empty($stack),
    'did not find node in root',
  );
  invariant(
    C\lastx($stack) === $node,
    'expected node at top of stack',
  );
  $parent = $stack[C\count($stack) - 2];

  $within_parent = 0;
  foreach ($parent->getChildren() as $child) {
    if ($child === $node) {
      break;
    }
    $within_parent += $child->getWidth();
  }

  return $within_parent + find_offset_of_leading(
    $root,
    $parent,
  );
}
