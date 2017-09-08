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

namespace Facebook\HHAST\__Private;

function fold_map<TInput, TOutput, TAccumulation>(
    Traversable<TInput> $items,
    (function (TInput, TAccumulation): TOutput) $mapper,
    (function (TInput, TAccumulation): TAccumulation) $accumulator,
    TAccumulation $initial,
  ): vec<TOutput> {
  $acc = $initial;
  $result = vec[];
  foreach($items as $item) {
    array_push($result, $mapper($item, $acc));
    $acc = $accumulator($item, $acc);
  }
  return $result;
}
