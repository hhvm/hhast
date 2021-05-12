/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

final class NewAttribute {
  // The old parser mode would complain that a classlike
  // element, (use, public, etc...) is expected here.
  @__Memoize()
  public function onMethod(): void {}
}