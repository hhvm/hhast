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
  EditableList,
  EditableSyntax,
  EditableToken,
  ElseClause,
  ElseifClause,
  EndOfLine,
  ForeachStatement,
  IfStatement,
  LeftBraceToken,
  RightBraceToken,
  WhileStatement,
  WhiteSpace
};
use function Facebook\HHAST\resolve_type;
use type Facebook\TypeAssert\TypeAssert;
use namespace Facebook\HHAST;
use namespace HH\Lib\{C, Str, Vec};

class MustUseBracesForControlFlowLinter
extends AutoFixingASTLinter<EditableSyntax> {
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

    // Consider '} else if {' to be the same as '} elseif {'
    if (
      $node instanceof ElseClause
      && $body instanceof IfStatement
    ) {
      return null;
    }

    return new ASTLintError(
      $this,
      sprintf(
        '%s without braces',
        $node->getSyntaxKind() |> Str\replace($$, '_', ' '),
      ),
      $node,
    );
  }

  private function getBody(EditableSyntax $node): ?EditableSyntax {
    if ($node instanceof IfStatement) {
      return $node->getStatement();
    }
    if ($node instanceof ElseClause) {
      return $node->getStatement();
    }
    if ($node instanceof ElseifClause) {
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

  private function getLastHeadToken(EditableSyntax $node): EditableToken {
    if ($node instanceof IfStatement) {
      $paren = $node->getRightParen();
      if ($paren !== null) {
        return $paren->getLastTokenx();
      }
      return $node->getCondition()->getLastTokenx();
    }
    if ($node instanceof ElseClause) {
      return $node->getKeyword();
    }
    if ($node instanceof ElseifClause) {
      return $node->getRightParen()->getLastTokenx();
    }
    if ($node instanceof ForeachStatement) {
      return $node->getRightParen()->getLastTokenx();
    }
    if ($node instanceof WhileStatement) {
      return $node->getRightParen()->getLastTokenx();
    }
    invariant_violation(
      'unhandled type: %s',
      get_class($node),
    );
  }

  public function getFixedNode(EditableSyntax $node): EditableSyntax {
    $body = $this->getBody($node);
    invariant(
      $body !== null,
      "Can't fix a node with no body",
    );
    $last_token = $this->getLastHeadToken($node);

    if (
      $last_token->getTrailingWhitespace()
      ->getDescendantsOfType(EndOfLine::class)
      |>C\is_empty(vec($$))
    ) {
      $right_brace_leading = new WhiteSpace(' ');
      $body_trailing = HHAST\Missing();
    } else {
      $right_brace_leading = $node
        ->getFirstTokenx()->getLeadingWhitespace()
        ->getChildrenOfType(WhiteSpace::class)
        |> EditableList::fromItems($$);
      $body_trailing = $body->getLastTokenx()->getTrailing();
    }
    return $node
      ->replace(
        new CompoundStatement(
          new LeftBraceToken(
            new WhiteSpace(' '),
            $last_token->getTrailingWhitespace(),
          ),
          $body->replace(
            $body->getLastTokenx()->withTrailing($body_trailing),
            $body->getLastTokenx(),
          ),
          new RightBraceToken(
            $right_brace_leading,
            $body->getLastTokenx()->getTrailingWhitespace(),
          ),
        ),
        $body,
      )
      ->replace(
        $last_token->withTrailing(HHAST\Missing()),
        $last_token,
      );
  }

  public function getPrettyNode(EditableSyntax $node): EditableSyntax {
    $token = $node->getFirstTokenx();
    return $node->replace(
      $token->withLeading($token->getLeadingWhitespace()),
      $token,
    );
  }
}
