/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\_Private;

final class SoftDeprecated implements \HH\MethodAttribute {
  public function __construct(public string $useThisInstead) {}
}
