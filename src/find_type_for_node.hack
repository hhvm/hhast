/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private;

use namespace Facebook\{HHAST, TypeAssert};
use type Facebook\HHAST\Node;

type TTypeAtPosOutput = shape(
  ?'full_type' => shape(
    'kind' => string,
    ?'name' => string,
    ...
  ),
  ...
);

async function find_type_for_node_async(
  Node $root,
  Node $node,
  string $path,
): Awaitable<?string> {
  list($line, $offset) = HHAST\find_position($root, $node);
  $path = \realpath($path);
  $lines = await execute_async(
    'hh_client',
    '--json',
    '--from',
    'hhast',
    '--type-at-pos',
    $path.':'.$line.':'.($offset + 1),
    \dirname($path),
  );
  $untyped_data = null;
  foreach ($lines as $maybe_json) {
    $untyped_data = \json_decode(
      $maybe_json,
      /* assoc = */ true,
      /* depth = */ 512,
      \JSON_FB_HACK_ARRAYS,
    );
    if ($untyped_data !== null) {
      break;
    }
  }

  $data = TypeAssert\matches_type_structure(
    type_alias_structure(TTypeAtPosOutput::class),
    $untyped_data,
  );

  if (($data['full_type']['kind'] ?? null) === 'primitive') {
    return $data['full_type']['name'] ?? null;
  }
  return $data['full_type']['kind'] ?? null;
}
