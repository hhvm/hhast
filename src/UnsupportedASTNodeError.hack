/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

final class UnsupportedASTNodeError extends ASTError {
  public function __construct(string $file, int $offset, string $kind) {
    parent::__construct($file, $offset, 'Unsupported AST node kind: '.$kind);
  }
}
