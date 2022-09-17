/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use type Facebook\HHAST\{ExpressionStatement, Node, NodeList, Script, Token};

final class NoEmptyStatementsLinter extends AutoFixingASTLinter {
  const type TConfig = shape();
  const type TNode = ExpressionStatement;

  /**
   * This linter finds serious logic bugs.
   * Each case should be considered individually
   * since the intent of the programmer probably differed from
   * what the code does right now.
   */
  <<__Override>>
  public function allowYesToAll(): bool {
    return false;
  }

  <<__Override>>
  public function getTitleForFix(SingleRuleLintError $_): string {
    return 'Remove statement';
  }

  const type TContext = Script;

  <<__Override>>
  public function getLintErrorForNode(
    Script $_context,
    ExpressionStatement $stmt,
  ): ?ASTLintError {

    $expr = $stmt->getExpression();
    if ($expr === null) {
      return new ASTLintError(
        $this,
        'This statement is empty',
        $stmt,
        () ==> $this->getFixedNode($stmt),
      );
    }

    if ($this->isEmptyExpression($expr)) {
      return new ASTLintError(
        $this,
        'This statement includes an expression that has no effect',
        $stmt,
      );
    }

    return null;
  }

  public function getFixedNode(ExpressionStatement $stmt): Node {
    $semicolon = $stmt->getSemicolon();
    // Some places where an expression statement can appear
    // can not be replaced with a NodeList.
    // Trying to do so is a TypeError (uncaught Throwable).
    // More places like this could exist, but there is no way to enumerate them.
    // If you have found another place where this method goes bad,
    // feel free to add another patch below.

    // Patching body likes of control flow statements.
    // if (side_effect()) ;
    //                   ^^
    // This expression statement can't be a NodeList.
    // We can add an empty CompoundStatement here.
    $owner = $this->getAST()->getParentOfDescendant($stmt);
    if ($owner is IControlFlowStatement) {
      $i_am_the_body = control_flow_statement_get_body_like($owner) === $stmt;
      if ($i_am_the_body) {
        return new CompoundStatement(
          new LeftBraceToken($semicolon->getLeading(), null),
          null,
          new RightBraceToken(null, $semicolon->getTrailing()),
        );
      }
    }

    // This could cause a TypeError still,
    // if it does, add more patches.
    return
      NodeList::concat($semicolon->getLeading(), $semicolon->getTrailing());
  }

  /**
   * Returns whether the given expression is empty.
   */
  private function isEmptyExpression(Node $expr): bool {
    return $expr is AnonymousFunction ||
      (
        $expr is BinaryExpression &&
        $this->isOperatorWithoutSideEffects($expr->getOperator())
      ) ||
      $expr is CastExpression ||
      $expr is CollectionLiteralExpression ||
      $expr is DarrayIntrinsicExpression ||
      $expr is DictionaryIntrinsicExpression ||
      $expr is IsExpression ||
      $expr is IssetExpression ||
      $expr is KeysetIntrinsicExpression ||
      $expr is LambdaExpression ||
      $expr is LiteralExpression ||
      $expr is NameExpression ||
      (
        $expr is ParenthesizedExpression &&
        $this->isEmptyExpression($expr->getExpression())
      ) ||
      $expr is SubscriptExpression ||
      $expr is VectorIntrinsicExpression ||
      $expr is VariableExpression ||
      $expr is VarrayIntrinsicExpression;
  }

  /**
   * Returns whether the given token is an operator that does not result in
   * assignment or other operations that can have side effects.
   */
  private function isOperatorWithoutSideEffects(Token $op): bool {
    // The pipe operator does not necessarily have any side effects but it
    // typically implies function invocation which can have side effects.
    return !$this->isAssignmentOperator($op) && !$op is BarGreaterThanToken;
  }

  /**
   * Returns whether the given token is an assignment operator.
   *
   * This list is all the types returned from ExpressionStatement::getOperator
   * that include "Equal" and are not comparison operators (==, >=, etc.);
   */
  private function isAssignmentOperator(Token $op): bool {
    return $op is AmpersandEqualToken ||
      $op is BarEqualToken ||
      $op is CaratEqualToken ||
      $op is DotEqualToken ||
      $op is EqualToken ||
      $op is GreaterThanEqualToken ||
      $op is GreaterThanGreaterThanEqualToken ||
      $op is LessThanEqualToken ||
      $op is LessThanLessThanEqualToken ||
      $op is MinusEqualToken ||
      $op is PercentEqualToken ||
      $op is PlusEqualToken ||
      $op is QuestionQuestionEqualToken ||
      $op is SlashEqualToken ||
      $op is StarEqualToken ||
      $op is StarStarEqualToken;
  }
}
