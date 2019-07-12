/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\Linters;

use type Facebook\HHAST\{
  CompoundStatement,
  ElseClause,
  ElseifClause,
  EndOfLine,
  ForeachStatement,
  IControlFlowStatement,
  IfStatement,
  LeftBraceToken,
  Node,
  NodeList,
  RightBraceToken,
  Script,
  Token,
  WhileStatement,
  WhiteSpace,
};
use namespace Facebook\HHAST;
use namespace HH\Lib\{C, Str, Vec};

class MustUseBracesForControlFlowLinter extends AutoFixingASTLinter {
  const type TNode = IControlFlowStatement;
  const type TContext = Script;

  <<__Override>>
  public function getLintErrorForNode(
    Script $_context,
    IControlFlowStatement $node,
  ): ?ASTLintError {
    $body = $this->getBody($node);
    if ($body === null) {
      return null;
    }
    if ($body is CompoundStatement) {
      return null;
    }

    // Consider '} else if {' to be the same as '} elseif {'
    if ($node is ElseClause && $body is IfStatement) {
      return null;
    }

    return new ASTLintError(
      $this,
      Str\format(
        '%s without braces',
        $node->getSyntaxKind() |> Str\replace($$, '_', ' '),
      ),
      $node,
      () ==> $this->getFixedNode($node),
    );
  }

  private function getBody(Node $node): ?Node {
    if ($node is IfStatement) {
      return $node->getStatement();
    }
    if ($node is ElseClause) {
      return $node->getStatement();
    }
    if ($node is ElseifClause) {
      return $node->getStatement();
    }
    if ($node is ForeachStatement) {
      return $node->getBody();
    }
    if ($node is WhileStatement) {
      return $node->getBody();
    }
    return null;
  }

  private function getLastHeadToken(Node $node): Token {
    if ($node is IfStatement) {
      $paren = $node->getRightParen();
      if ($paren !== null) {
        return $paren->getLastTokenx();
      }
      return $node->getCondition()->getLastTokenx();
    }
    if ($node is ElseClause) {
      return $node->getKeyword();
    }
    if ($node is ElseifClause) {
      return $node->getRightParen()->getLastTokenx();
    }
    if ($node is ForeachStatement) {
      return $node->getRightParen()->getLastTokenx();
    }
    if ($node is WhileStatement) {
      return $node->getRightParen()->getLastTokenx();
    }
    invariant_violation('unhandled type: %s', \get_class($node));
  }

  public function getFixedNode(
    IControlFlowStatement $node,
  ): IControlFlowStatement {
    $body = $this->getBody($node);
    invariant($body !== null, "Can't fix a node with no body");
    $last_token = $this->getLastHeadToken($node);

    if (
      $last_token->getTrailingWhitespace()
        ->getDescendantsOfType(EndOfLine::class)
      |> C\is_empty(vec($$))
    ) {
      $right_brace_leading = new WhiteSpace(' ');
      $body_trailing = HHAST\Missing();
    } else {
      $whitespace_nodes = $node
        ->getFirstTokenx()
        ->getLeadingWhitespace()
        ->toVec();
      $no_newlines = vec[];
      foreach (Vec\reverse($whitespace_nodes) as $whitespace) {
        if ($whitespace is EndOfLine) {
          break;
        }
        $no_newlines[] = $whitespace;
      }
      $right_brace_leading = NodeList::createNonEmptyListOrMissing(
        Vec\reverse($no_newlines),
      );
      $body_trailing = $body->getLastTokenx()->getTrailing();
    }
    return $node
      ->replace(
        $body,
        new CompoundStatement(
          new LeftBraceToken(
            new WhiteSpace(' '),
            $last_token->getTrailingWhitespace(),
          ),
          $body->replace(
            $body->getLastTokenx(),
            $body->getLastTokenx()->withTrailing($body_trailing),
          ),
          new RightBraceToken(
            $right_brace_leading,
            $body->getLastTokenx()->getTrailingWhitespace(),
          ),
        ),
      )
      ->replace($last_token, $last_token->withTrailing(HHAST\Missing()));
  }

  <<__Override>>
  protected function getTitleForFix(LintError $_): string {
    return 'Add braces';
  }

  <<__Override>>
  public function getPrettyTextForNode(IControlFlowStatement $node): string {
    $token = $node->getFirstTokenx();
    return $node
      ->replace($token, $token->withLeading($token->getLeadingWhitespace()))
      ->getCode();
  }
}
