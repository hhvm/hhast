/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use namespace HH\Lib\{Str, Vec};

final class MustUseBracesForControlFlowLinter extends AutoFixingASTLinter {
  const type TConfig = shape();
  const type TNode = IControlFlowStatement;
  const type TContext = Script;

  <<__Override>>
  public function getLintErrorForNode(
    Script $_context,
    IControlFlowStatement $node,
  ): ?ASTLintError {
    $body = control_flow_statement_get_body_like($node);
    if ($body is ?CompoundStatement) {
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

  private function getLastHeadToken(Node $node): Token {
    if (
      $node is IfStatement ||
      $node is ForeachStatement ||
      $node is ForStatement ||
      $node is WhileStatement
    ) {
      return $node->getRightParen()->getLastToken();
    }
    if ($node is ElseClause || $node is DoStatement) {
      return $node->getKeyword()->getLastToken();
    }
    invariant_violation('unhandled type: %s', \get_class($node));
  }

  public function getFixedNode(
    IControlFlowStatement $node,
  ): IControlFlowStatement {
    $body = control_flow_statement_get_body_like($node);
    invariant($body is nonnull, "Can't fix a node with no body");
    $last_token = $this->getLastHeadToken($node);

    if (
      $last_token->getTrailingWhitespace()
        ->getFirstDescendantByType<EndOfLine>() is null
    ) {
      $right_brace_leading = new NodeList(vec[new WhiteSpace(' ')]);
      $body_trailing = null;
    } else {
      $whitespace = $node
        ->getFirstTokenx()
        ->getLeadingWhitespace();
      $right_brace_leading = $whitespace is EndOfLine
        ? null
        : new NodeList(Vec\filter_nulls(vec[$whitespace]));
      $body_trailing = $body->getLastTokenx()->getTrailing();
    }
    return $node
      ->replace(
        $body,
        new CompoundStatement(
          new LeftBraceToken(
            new NodeList(vec[new WhiteSpace(' ')]),
            $last_token->getTrailingWhitespace(),
          ),
          $body->replace(
            $body->getLastTokenx(),
            $body->getLastTokenx()->withTrailing($body_trailing),
          )
            |> new NodeList(vec[$$]),
          new RightBraceToken(
            $right_brace_leading,
            $body->getLastTokenx()->getTrailingWhitespace(),
          ),
        ),
      )
      ->replace($last_token, $last_token->withTrailing(null));
  }

  <<__Override>>
  protected function getTitleForFix(SingleRuleLintError $_): string {
    return 'Add braces';
  }

  <<__Override>>
  public function getPrettyTextForNode(IControlFlowStatement $node): string {
    $token = $node->getFirstTokenx();
    return $node
      ->replace(
        $token,
        $token->withLeading(
          new NodeList(Vec\filter_nulls(vec[$token->getLeadingWhitespace()])),
        ),
      )
      ->getCode();
  }
}
