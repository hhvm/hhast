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

class ASTLintError<
  Tnode as EditableSyntax,
  Tlinter as ASTLinter<Tnode>
> extends LintError {
  public function __construct(
    protected Tlinter $linter,
    string $description,
    private Tnode $node,
  ) {
    parent::__construct($linter, $description);
  }

  final public function getBlameCode(): string {
    return $this->node->full_text();
  }

  final public function getPrettyBlameCode(): string {
    return $this->linter->getPrettyNodeForBlame($this->node)->full_text();
  }
}
