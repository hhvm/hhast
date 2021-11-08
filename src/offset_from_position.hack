/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use namespace HH\Lib\{Str, Vec};

function offset_from_position(Node $root, int $line, int $column): int {
  if ($line === 1) {
    return $column - 1;
  }

  $lines = Str\split($root->getCode(), "\n");
  $to_skip = $line - 1;
  return $lines
    |> Vec\take($$, $to_skip)
    |> Str\join($$, "\n")
    |> Str\length($$)
    |> $$ + $column; // -1 for 1-index to 0-index, +1 for \n on previous line
}
