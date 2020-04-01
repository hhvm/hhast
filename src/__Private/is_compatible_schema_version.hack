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
    case '2019-05-20-0001': // is a superset of:
      // Succeeding versions:
      $compatible_versions[] = '2019-07-23-0001';
      break;

    case '2019-10-03-0001': // is a superset of:
      // Preceding versions:
      // This one doesn't have union/intersection typehints:
      $compatible_versions[] = '2019-08-22-0001';
      // Succeeding versions:
      // This one doesn't have `break/continue <num>`:
      $compatible_versions[] = '2019-10-08-0001';
      // This one doesn't have `let` statement (unused experimental feature):
      $compatible_versions[] = '2019-11-15-0001';
      break;

    case '2020-01-22-0001': // is a superset of:
      // Preceding versions:
      // This one doesn't have XHP token, function pointer syntax:
      $compatible_versions[] = '2019-11-29-0001';
      // This one also doesn't have Pocket Universe `reify` syntax:
      $compatible_versions[] = '2019-11-15-0001';
      // Succeeding versions:
      // This one doesn't have square bracket array literals:
      $compatible_versions[] = '2020-02-03-0001';
      // This one disallows using "namespace" as an identifier:
      $compatible_versions[] = '2020-02-19-0001';
      // This one removes support for <?= (PHP echo tag):
      $compatible_versions[] = '2020-03-24-0001';
      // This one removes support for __halt_compiler():
      $compatible_versions[] = '2020-03-31-0001';
      break;
  }

  return C\contains($compatible_versions, $other_version);
}
