/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */
namespace Facebook\HHAST\__Private\SyntaxExamples;

function maybe_as_complex_type(mixed $x): ?vec<mixed> {
  return $x ?as vec<_>;
}
