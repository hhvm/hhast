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
use const Facebook\HHAST\SCHEMA_VERSION;
use namespace HH\Lib\C;

// Allow multiple schema versions if the only differences are
// deletions. The codegen should be built with the most complete
// version.
//
// Using fully-qualified constant names due to
// https://github.com/facebook/hhvm/issues/8511
const keyset<string> COMPATIBLE_SCHEMA_VERSIONS = (
  \Facebook\HHAST\SCHEMA_VERSION === '2019-05-20-0001'
)
  ? keyset[\Facebook\HHAST\SCHEMA_VERSION, '2019-07-23-0001']
  : keyset[\Facebook\HHAST\SCHEMA_VERSION];

function from_decoded_json(
  dict<string, mixed> $json,
  ?string $file = null,
): Script {
  $version = $json['version'] ?? null;
  if (
    $version is string && !C\contains_key(COMPATIBLE_SCHEMA_VERSIONS, $version)
  ) {
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
