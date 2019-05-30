/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;


function find_offset_of_leading(Node $root, Node $node): int {
  if ($root === $node) {
    return 0;
  }

  invariant($root->isAncestorOf($node), 'Root is not an ancestor of node');

  // - Script is the top-level item
  // - Nodes are immutable
  // - Modified copies do not have a source-ref
  // So, if we have a top-level item with a source-ref, there have been no
  // modifications, so the original sourceref is valid for any descendants
  if (
    $root is Script && __Private\NodeImplementationDetails::getSourceRef($root)
  ) {
    $source = __Private\NodeImplementationDetails::getSourceRef($node);
    if ($source is nonnull) {
      return $source['offset'];
    }
  }

  $offset = 0;
  foreach ($root->getChildren() as $child) {
    if ($child === $node) {
      return $offset;
    }
    if ($child->isAncestorOf($node)) {
      return $offset + find_offset_of_leading($child, $node);
    }
    $offset += $child->getWidth();
  }

  invariant_violation('never found next generation ancestor');
}
