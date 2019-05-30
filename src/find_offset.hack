/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;


function find_offset_after_leading(Node $root, Node $node): int {
  if ($root === $node) {
    return 0;
  }

  $leading_offset = find_offset_of_leading($root, $node);

  $first_token = $node->getFirstToken();
  if ($first_token === null) {
    return $leading_offset;
  }

  return $leading_offset + $first_token->getLeading()->getWidth();
}
