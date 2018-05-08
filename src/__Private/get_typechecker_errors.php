<?hh // strict
/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
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
  string $path,
): vec<TTypecheckerError> {
  $path = \realpath($path);
  $command = vec[
    'hh_client',
    '--json',
    '--from', 'hhast',
    \escapeshellarg($path),
  ];
  $output = \tempnam(
    \sys_get_temp_dir(),
    'hhast-temp',
  );
  \exec(
    Str\join($command, ' ').' >/dev/null 2>'.\escapeshellarg($output),
  );
  // Exit code is unstable, so not checking it

  $lines = \file_get_contents($output);
  \unlink($output);
  $untyped_data = null;
  foreach (Str\split($lines, "\n") as $maybe_json) {
    $untyped_data = \json_decode(
      $maybe_json,
      /* assoc = */ true,
      /* depth = */ 512,
      \JSON_FB_HACK_ARRAYS,
    );
  };

  $data = TypeAssert\matches_type_structure(
    type_alias_structure(TTypecheckerOutput::class),
    $untyped_data,
  );

  return $data['errors'] ?? vec[];
}
