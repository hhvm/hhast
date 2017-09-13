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

use type Facebook\HHAST\{
  CompoundStatement,
  EditableSyntax,
  ForeachStatement,
  IfStatement,
  WhileStatement
};
use function Facebook\HHAST\resolve_type;
use namespace Facebook\HHAST;
use namespace HH\Lib\{C, Str, Vec};

class MustUseBlocksForControlFlowLinter
extends ASTLinter<EditableSyntax> {
  protected static function getTargetType(): classname<EditableSyntax> {
    return EditableSyntax::class;
  }

  public function getLintErrorForNode(
    EditableSyntax $node,
    vec<EditableSyntax> $parents,
  ): ?ASTLintError<EditableSyntax, this> {
    $body = $this->getBody($node);
    if ($body === null) {
      return null;
    }
    if ($body instanceof CompoundStatement) {
      return null;
    }

    return new ASTLintError(
      $this,
      sprintf(
        '%s without braces',
        $node->getSyntaxKind(),
      ),
      $node,
    );
  }

  private function getBody(EditableSyntax $node): ?EditableSyntax {
    if ($node instanceof IfStatement) {
      return $node->getStatement();
    }
    if ($node instanceof ForeachStatement) {
      return $node->getBody();
    }
    if ($node instanceof WhileStatement) {
      return $node->getBody();
    }
    return null;
  }
}
