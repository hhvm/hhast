/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private;

function fold_map<TInput, TOutput, TAccumulation>(
  Traversable<TInput> $items,
  (function(TInput, TAccumulation): TOutput) $mapper,
  (function(TInput, TAccumulation): TAccumulation) $accumulator,
  TAccumulation $initial,
): vec<TOutput> {
  $acc = $initial;
  $result = vec[];
  foreach ($items as $item) {
    $result[] = $mapper($item, $acc);
    $acc = $accumulator($item, $acc);
  }
  return $result;
}
