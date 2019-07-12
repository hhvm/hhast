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
  const type TNode = ExpressionStatement;

  <<__Override>>
  public function getTitleForFix(LintError $_): string {
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
        () ==> $this->getFixedNode($stmt),
      );
    }

    return null;
  }

  public function getFixedNode(ExpressionStatement $stmt): Node {
    // Only offer a fix if the node is literally empty
    if ($stmt->getExpression() !== null) {
      return $stmt;
    }

    $semicolon = $stmt->getSemicolonx();
    $leading = $semicolon->getLeading();
    $trailing = $semicolon->getTrailing();

    return NodeList::concat(
      $semicolon->getLeading(),
      $semicolon->getTrailing(),
    );
  }

  /**
   * Returns whether the given expression is empty.
   */
  private function isEmptyExpression(Node $expr): bool {
    return $expr instanceof ArrayCreationExpression ||
      $expr instanceof AnonymousFunction ||
      (
        $expr instanceof BinaryExpression &&
        $this->isOperatorWithoutSideEffects($expr->getOperator())
      ) ||
      $expr instanceof CastExpression ||
      $expr instanceof CollectionLiteralExpression ||
      $expr instanceof DarrayIntrinsicExpression ||
      $expr instanceof DictionaryIntrinsicExpression ||
      $expr instanceof InstanceofExpression ||
      $expr instanceof IsExpression ||
      $expr instanceof IssetExpression ||
      $expr instanceof KeysetIntrinsicExpression ||
      $expr instanceof LambdaExpression ||
      $expr instanceof LiteralExpression ||
      $expr instanceof NameExpression ||
      (
        $expr instanceof ParenthesizedExpression &&
        $this->isEmptyExpression($expr->getExpression())
      ) ||
      $expr instanceof SubscriptExpression ||
      $expr instanceof VectorIntrinsicExpression ||
      $expr instanceof VariableExpression ||
      $expr instanceof VarrayIntrinsicExpression;
  }

  /**
   * Returns whether the given token is an operator that does not result in
   * assignment or other operations that can have side effects.
   */
  private function isOperatorWithoutSideEffects(Token $op): bool {
    // The pipe operator does not necessarily have any side effects but it
    // typically implies function invocation which can have side effects.
    return !$this->isAssignmentOperator($op) &&
      !$op instanceof BarGreaterThanToken;
  }

  /**
   * Returns whether the given token is an assignment operator.
   *
   * This list is all the types returned from ExpressionStatement::getOperator
   * that include "Equal" and are not comparison operators (==, >=, etc.);
   */
  private function isAssignmentOperator(Token $op): bool {
    return $op instanceof AmpersandEqualToken ||
      $op instanceof BarEqualToken ||
      $op instanceof CaratEqualToken ||
      $op instanceof DotEqualToken ||
      $op instanceof EqualToken ||
      $op instanceof GreaterThanEqualToken ||
      $op instanceof GreaterThanGreaterThanEqualToken ||
      $op instanceof LessThanEqualToken ||
      $op instanceof LessThanLessThanEqualToken ||
      $op instanceof MinusEqualToken ||
      $op instanceof PercentEqualToken ||
      $op instanceof PlusEqualToken ||
      $op instanceof QuestionQuestionEqualToken ||
      $op instanceof SlashEqualToken ||
      $op instanceof StarEqualToken ||
      $op instanceof StarStarEqualToken;
  }
}
