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

use namespace HH\Lib\{C, Str};

function find_position(
  EditableNode $root,
  EditableNode $node,
): (int, int) {
  $offset = find_offset_after_leading($root, $node);
  $lines = $root->getCode()
    |> Str\slice($$, 0, $offset)
    |> \explode("\n", $$);

  return tuple(
    C\count($lines),
    Str\length(C\lastx($lines)),
  );
}
