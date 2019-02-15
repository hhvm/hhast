/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

final class HHParseError extends ParseError {
  public function __construct(string $file, string $message) {
    parent::__construct($file, /* offset = */ null, $message);
  }
}
