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

/*
 * Attempt to find the line that this error occured on and return
 */
function find_line(Linters\LintError $error): ?string {
  if ($error == null) {
    return null;
  }

  $position = $error->getPosition();
  if ($position == null) {
    return null;
  }

  $code = file_get_contents($error->getFile());
  $lines = explode("\n", $code);

  // The position is a count of the number of lines, -1 to get the array entry
  $line_pos = $position[0] - 1;

  if (count($lines) < $line_pos) {
    return null;
  }

  return $lines[$line_pos];
}
