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

function offset_from_position(
  EditableNode $root,
  int $line,
  int $column,
): int {
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
