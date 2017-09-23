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

class FixableASTLintError<
  Tnode as EditableNode,
> extends ASTLintError<Tnode> implements FixableLintError {

  <<__Override>>
  public function __construct(
    AutoFixingASTLinter<Tnode> $linter,
    string $description,
    Tnode $node,
    ?EditableNode $context = null,
  ) {
    parent::__construct($linter, $description, $node, $context);
  }

  final public function isFixable(): bool {
    return true;
  }

  final public function getReadableFix(): (string, string) {
    $linter = $this->linter;
    invariant(
      $linter instanceof AutoFixingASTLinter,
      "Can't render fix for unfixable lint error",
    );
    $node = $linter->getFixedNode($this->node);
    return tuple(
      $this->getPrettyBlame(),
      $linter->getPrettyTextForNode($node, $this->context),
    );
  }

  final public function shouldRenderBlameAndFixAsDiff(): bool {
    return true;
  }
}
