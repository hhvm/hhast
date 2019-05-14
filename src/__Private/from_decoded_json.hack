/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private;

use type Facebook\HHAST\{EditableNode, SchemaVersionError, Script};
use const Facebook\HHAST\SCHEMA_VERSION;

function from_decoded_json(
  dict<string, mixed> $json,
  ?string $file = null,
): Script {
  $version = $json['version'] ?? null;
  if ($version is string && $version !== SCHEMA_VERSION) {
    throw new SchemaVersionError($file ?? '! no file !', $version);
  }
  return EditableNode::fromJSON(
    /* HH_IGNORE_ERROR[4110] */ $json['parse_tree'],
    $file ?? '! no file !',
    0,
    /* HH_IGNORE_ERROR[4110] */ $json['program_text'],
  ) as Script;
}
