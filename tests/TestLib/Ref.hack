/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */


namespace Facebook\HHAST\TestLib;

final class Ref<T> {
  public function __construct(public T $v) {}
}

function Ref<T>(T $value): Ref<T> {
  return new Ref($value);
}
