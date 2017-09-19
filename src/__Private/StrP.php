<?hh //strict
/**
 * Copyright (c) 2016, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the "hack" directory of this source tree. An additional
 * grant of patent rights can be found in the PATENTS file in the same
 * directory.
 *
 */

namespace Facebook\HHAST\__Private\StrP;

use namespace HH\Lib\Str;

function upper_camel(string $in): string {
  return preg_replace_callback(
    '/(^|_)([a-z])/',
    $matches ==> Str\uppercase($matches[2]),
    $in,
  );
}
