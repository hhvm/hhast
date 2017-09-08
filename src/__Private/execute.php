<?hh //strict
/**
 * Copyright (c) 2016, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the "hack" directory of this source tree. An additional
 * grant of patent rights can be found in the PATENTS file in the same
 * directory.
 *
 */

namespace Facebook\HHAST\__Private;

use namespace HH\Lib\Vec;

// A wrapper around the built-in exec with a nicer signature.
// * returns a result rather than filling an out-parameter
// * throws on error
function execute(
  string ...$args
) : vec<string> {
  $command = Vec\map(
    $args,
    $arg ==> escapeshellarg($arg),
  ) |> implode(' ', $$);

  $results = array();
  $exit_code = null;
  exec($command, $results, $exit_code);
  if ($exit_code !== 0)
    throw new \Exception("execute of '$command' failed with code '$exit_code'.");
  return vec($results);
}
