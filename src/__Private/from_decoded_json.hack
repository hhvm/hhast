/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private;

use type Facebook\HHAST\{SchemaVersionError, Script};

function from_decoded_json(
  dict<string, mixed> $json,
  ?string $file = null,
): Script {
  $version = $json['version'] ?? null;
  if ($version is string && !is_compatible_schema_version($version)) {
    throw new SchemaVersionError($file ?? '! no file !', $version);
  }
  return Script::fromJSON(
    /* HH_IGNORE_ERROR[4110] */ $json['parse_tree'],
    $file ?? '! no file !',
    0,
    /* HH_IGNORE_ERROR[4110] */ $json['program_text'],
    'Script',
  );
}
