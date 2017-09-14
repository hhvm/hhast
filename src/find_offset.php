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

use namespace HH\Lib\C;

function find_offset(
  EditableSyntax $root,
  EditableSyntax $node,
): int {
  if ($root === $node) {
    return 0;
  }

  $parents = null;
  foreach ($root->parented_preorder() as $tuple) {
    list($child, $parents) = $tuple;
    if ($child === $node) {
      break;
    }
  }
  invariant(
    $parents !== null,
    'Failed to find parents',
  );
  $parents = vec($parents);

  $parent = C\lastx($parents);
  $within_parent = $node->getFirstToken()?->getLeading()?->getWidth() ?? 0;
  foreach ($parent->getChildren() as $child) {
    if ($child === $node) {
      break;
    }
    $within_parent += $child->getWidth();
  }

  return $within_parent + find_offset(
    $root,
    $parent,
  );
}
