<?hh // strict
/**
 * Copyright (c) 2016, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional
 * grant of patent rights can be found in the PATENTS file in the same
 * directory.
 *
 */

namespace Facebook\HHAST\__Private;;

use type Facebook\HHAST\EditableNode;

use namespace HH\Lib\{C, Str, Vec};
use namespace Facebook\TypeAssert;

type TTypecheckerError = shape(
  'message' => vec<
    shape(
      'path' => string,
      'descr' => string,
      'line' => int,
      'start' => int,
      'end' => int,
      'code' => int,
      ...
    ),
  >,
  ...
);


type TTypecheckerOutput = shape(
  ?'errors' => vec<TTypecheckerError>,
  ...
);

function get_typechecker_errors(
  string $file,
): vec<TTypecheckerError> {
  $file = realpath($file);
  $dir = dirname($file);
  $results = [];
  $command = vec[
    'hh_client',
    '--retries', '3',
    '--timeout', '1',
    '--json',
    '--from', 'hhast',
    escapeshellarg($dir),
  ];
  \exec(
    Str\join($command, ' ').' 2>&1',
    &$results,
  );
  // Exit code is unstable, so not checking it

  $json = Str\join($results, "\n");
  $data = TypeAssert\matches_type_structure(
    type_alias_structure(TTypecheckerOutput::class),
    \json_decode(
      $json,
      /* assoc = */ true,
      /* depth = */ 512,
      JSON_FB_HACK_ARRAYS,
    ),
  );

  return Vec\filter(
    $data['errors'] ?? vec[],
    $error ==> C\any(
      $error['message'],
      $message ==> $message['path'] === $file,
    ),
  );
}
