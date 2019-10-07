/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private;

use namespace HH\Lib\C;
use const Facebook\HHAST\SCHEMA_VERSION;

/**
 * Schema versions are compatible if one is a strict superset of the other
 * (i.e., syntax was either only added, or only removed, between the two
 * versions). The codegen should be built with the most complete version, and
 * this function should return true when passed any of the other versions (its
 * strict subsets) -- i.e., if $other_version is a strict subset of
 * Facebook\HHAST\SCHEMA_VERSION.
 */
function is_compatible_schema_version(string $other_version): bool {
  if ($other_version === SCHEMA_VERSION) {
    return true;
  }

  // Superset => subsets.
  $compatible_versions = keyset[];

  switch (SCHEMA_VERSION) {
    case '2019-05-20-0001':
      // No syntax was added, only removed, in the next schema version:
      $compatible_versions[] = '2019-07-23-0001';
      break;

    case '2019-10-03-0001':
      // This schema is a strict superset of the previous version (nothing was
      // removed, syntax for union and intersection typehints was added):
      $compatible_versions[] = '2019-08-22-0001';
      break;
  }

  return C\contains($compatible_versions, $other_version);
}
