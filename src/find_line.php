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

use namespace HH\Lib\Str;

function find_line(
  EditableNode $root,
  EditableNode $node,
): string {
  $offset = find_offset_after_leading($root, $node);
  $code = $root->getCode();
  $endline_pos = Str\search($code, "\n", $offset);

  // If we can't find the end of the line it is possible we're the last line of a file
  // without a final endline, so returning anything from offset onwards...
  if ($endline_pos !== null) {
    return Str\slice($code, $offset, $endline_pos - $offset);
  }else{
    return Str\slice($code, $offset);
  }
}
