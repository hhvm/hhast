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

use type Facebook\HHAST\EditableNode;
use function Facebook\HHAST\find_position;

class ASTLintError<
  Tnode as EditableNode,
> extends LintError {

  <<__Override>>
  public function __construct(
    protected BaseASTLinter<Tnode, ASTLintError<Tnode>> $linter,
    string $description,
    protected Tnode $node,
    protected ?EditableNode $context = null,
  ) {
    parent::__construct($linter, $description);
  }

  final public function getBlameNode(): Tnode {
    return $this->node;
  }

  <<__Override>>
  final public function getPosition(): (int, int) {
    return find_position($this->linter->getAST(), $this->getBlameNode());
  }

  <<__Override>>
  final public function getBlameCode(): string {
    return $this->node->getCode();
  }

  <<__Memoize, __Override>>
  final public function getPrettyBlame(): string {
    return $this->linter->getPrettyTextForNode($this->node, $this->context);
  }
}
