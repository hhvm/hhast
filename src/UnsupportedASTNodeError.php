<?hh // strict
/**
 * Copyright (c) 2017, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional
 * grant of patent rights can be found in the PATENTS file in the same
 * directory.
 *
 */

namespace Facebook\HHAST;

final class UnsupportedASTNodeError extends ASTError {
  public function __construct(string $file, int $offset, string $kind) {
    parent::__construct($file, $offset, 'Unsupported AST node kind: '.$kind);
  }
}
