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

use namespace HH\Lib\{Keyset, Str};

<<__Memoize>>
function encoding_detection_order(): keyset<string> {
  $encodings = keyset(\mb_list_encodings());
  unset($encodings['pass']);
  unset($encodings['auto']);
  return Keyset\union(
    keyset['UTF-8', 'ASCII'],
    \mb_detect_order(),
    Keyset\filter($encodings, $e ==> Str\starts_with($e, 'EUC-')),
    Keyset\filter($encodings, $e ==> Str\starts_with($e, 'UTF-')),
    Keyset\filter($encodings, $e ==> Str\starts_with($e, 'UCS-')),
    Keyset\filter($encodings, $e ==> Str\starts_with($e, 'ISO-8859-')),
    Keyset\filter($encodings, $e ==> Str\starts_with($e, 'Windows-')),
    Keyset\filter($encodings, $e ==> Str\starts_with($e, 'CP')),
    $encodings,
  );
}
