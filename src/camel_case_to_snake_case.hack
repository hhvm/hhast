/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;
use namespace HH\Lib\{Regex, Str};

function camel_case_to_snake_case(string $camel_case): string {
  return Regex\replace_with(
    $camel_case,
    re"/([a-z])([A-Z])/",
    $shape ==> $shape[1].'_'.Str\lowercase($shape[2]),
  )
    |> Regex\replace_with(
      $$,
      re"/([a-z])(\d)/i",
      $shape ==> $shape[1].'_'.$shape[2],
    )
    |> Regex\replace_with(
      $$,
      re"/(\d)([a-z])/i",
      $shape ==> $shape[1].'_'.Str\lowercase($shape[2]),
    )
    |> Str\replace($$, '__', '_');
}
