/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use namespace HH\Lib\{C, Str};

function find_position(Node $root, Node $node): (int, int) {
  $offset = find_offset_after_leading($root, $node);
  $lines = $root->getCode()
    |> Str\slice($$, 0, $offset)
    |> \explode("\n", $$);

  return tuple(C\count($lines), Str\length(C\lastx($lines)));
}
