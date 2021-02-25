/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use namespace HH\Lib\{C, Vec};

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
    $next_leading = $next_token->getLeading()->toVec();
    if (!C\first($next_leading) is EndOfLine) {
      return null;
    }

    $seen_eol = C\last($left_brace->getTrailing()->toVec()) is EndOfLine;

    // The AST tends to be structured in such a way that the trivia
    // after the `{` including the newline is part of the `{`.
    // If this were to change in the future,
    // expect two newlines before the next token.
    if ($seen_eol) {
      return new ASTLintError(
        $this,
        "Don't start control flow blocks with a newline.",
        $next_token,
        () ==> self::stripLeadingEols($next_leading)
          |> $next_token->withLeading(new NodeList($$)),
      );
    } else if (idx($next_leading, 1) is EndOfLine) {
      return new ASTLintError(
        $this,
        "Don't start control flow blocks with a newline.",
        $next_token,
        () ==> self::stripLeadingEols($next_leading)
          |> Vec\concat(vec[$next_leading[0]], $$)
          |> $next_token->withLeading(new NodeList($$)),
      );
    }

    return null;
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

  private static function stripLeadingEols(vec<Trivia> $trivia): vec<Trivia> {
    return C\find_key($trivia, $n ==> !$n is EndOfLine)
      |> Vec\slice($trivia, $$ as nonnull);
  }
}
