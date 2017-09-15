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

function find_offset_after_leading(
  EditableSyntax $root,
  EditableSyntax $node,
): int {
  if ($root === $node) {
    return 0;
  }

  return find_offset_of_leading($root, $node)
    + $node->getFirstTokenx()->getLeading()->getWidth();
}
