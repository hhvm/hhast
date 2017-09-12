<?hh // strict
/**
 * Copyright (c) 2016, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional
 * grant of patent rights can be found in the PATENTS file in the same
 * directory.
 *
 */

namespace Facebook\HHAST\Linters;

use type Facebook\HHAST\EditableSyntax;

class ASTLintError extends LintError {
  public function __construct(
    private EditableSyntax $node,
    classname<BaseLinter> $linter,
    string $description,
  ) {
    parent::__construct($linter, $description);
  }

  final public function getNode(): EditableSyntax {
    return $this->node;
  }
}
