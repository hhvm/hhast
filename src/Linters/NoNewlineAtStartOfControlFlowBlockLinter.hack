/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use namespace HH\Lib\Str;

class NoNewlineAtStartOfControlFlowBlockLinter extends AutoFixingASTLinter {
  const type TNode = IControlFlowStatement;
  const type TContext = Script;

  <<__Override>>
  public function getLintErrorForNode(
    Script $_context,
    IControlFlowStatement $node,
  ): ?ASTLintError {
    $body = $this->getBody($node);
    if (!$body is CompoundStatement) {
      return null;
    }

    $left_brace = $body->getLeftBrace();
    $next_token = $this->getAST()->getNextToken($left_brace);

    if ($next_token is null) {
      return null;
    }

    $whitespace = $next_token->getLeading()->getCode();

    if (!Str\starts_with($whitespace, \PHP_EOL)) {
      return null;
    }

    return new ASTLintError(
      $this,
      "Don't start control flow blocks with a newline.",
      $next_token,
      () ==> self::fix($next_token),
    );
  }

  private function getBody(IControlFlowStatement $node): ?IStatement {
    if ($node is IfStatement || $node is ElseifClause || $node is ElseClause) {
      return $node->getStatement();
    }
    if (
      $node is ForeachStatement ||
      $node is ForStatement ||
      $node is DoStatement ||
      $node is WhileStatement
    ) {
      return $node->getBody();
    }
    if ($node is SwitchStatement) {
      return null;
    }
    invariant_violation(
      'Unhandled control flow block type %s',
      \get_class($node),
    );
  }

  private static function fix(Token $token): Token {
    return $token->withLeading(
      $token->getLeading()->toVec()
        |> new Vector($$)
        |> $$->skipWhile($t ==> $t is EndOfLine)
        |> new NodeList(vec($$)),
    );
  }
}
