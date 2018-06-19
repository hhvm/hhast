<?hh // strict
/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private;

use namespace HH\Lib\Vec;

// A wrapper around the built-in exec with a nicer signature.
// * returns a result rather than filling an out-parameter
// * throws on error
function execute(string ...$args): vec<string> {
  $command = Vec\map($args, $arg ==> \escapeshellarg($arg));

  $results = array();
  $exit_code = null;
  \exec(\implode(' ', $command).' 2>/dev/null', &$results, &$exit_code);
  if ($exit_code !== 0) {
    throw new SubprocessException($command, (int)$exit_code);
  }
  return vec($results);
}
