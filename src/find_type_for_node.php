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

use namespace HH\Lib\Str;
use namespace Facebook\TypeAssert;
use namespace Facebook\HHAST;
use type Facebook\HHAST\EditableNode;

type TTypeAtPosOutput = shape(
  ?'full_type' => shape(
    'kind' => string,
    ?'name' => string,
    ...
  ),
  ...
);

function find_type_for_node(
  EditableNode $root,
  EditableNode $node,
  string $path,
): ?string {
  list($line, $offset) = HHAST\find_position($root, $node);
  $path = \realpath($path);
  $command = vec[
    'hh_client',
    '--json',
    '--from',
    'hhast',
    '--type-at-pos',
    $line.':'.($offset + 1),
    '<',
    \escapeshellarg($path),
  ];
  $output = \tempnam(\sys_get_temp_dir(), 'hhast-temp');
  \exec(Str\join($command, ' ').' >'.\escapeshellarg($output));
  // Exit code is unstable, so not checking it

  $lines = Str\trim(\file_get_contents($output));
  \unlink($output);
  $untyped_data = null;
  foreach (Str\split($lines, "\n") as $maybe_json) {
    $untyped_data = \json_decode(
      $maybe_json,
      /* assoc = */ true,
      /* depth = */ 512,
      \JSON_FB_HACK_ARRAYS,
    );
  }

  $data = TypeAssert\matches_type_structure(
    type_alias_structure(TTypeAtPosOutput::class),
    $untyped_data,
  );

  if (Shapes::keyExists($data, 'full_type')) {
    if ($data['full_type']['kind'] === 'primitive') {
      return $data['full_type']['name'] ?? null;
    }
    return $data['full_type']['kind'];
  }

  return null;
}
