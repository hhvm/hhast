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

use namespace HH\Lib\{C, Str, Vec};

function find_node_at_position(
  EditableNode $root,
  int $line,
  int $char,
): EditableNode {
  return find_node_at_offset(
    $root,
    offset_from_position($root, $line, $char),
  );
}
