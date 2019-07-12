/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\Linters;

use type Facebook\HHAST\{ExpressionStatement, Node, NodeList, Script, Token};

use namespace Facebook\HHAST;

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
    return $expr is HHAST\ArrayCreationExpression ||
      $expr is HHAST\AnonymousFunction ||
      (
        $expr is HHAST\BinaryExpression &&
        $this->isOperatorWithoutSideEffects($expr->getOperator())
      ) ||
      $expr is HHAST\CastExpression ||
      $expr is HHAST\CollectionLiteralExpression ||
      $expr is HHAST\DarrayIntrinsicExpression ||
      $expr is HHAST\DictionaryIntrinsicExpression ||
      $expr is HHAST\InstanceofExpression ||
      $expr is HHAST\IsExpression ||
      $expr is HHAST\IssetExpression ||
      $expr is HHAST\KeysetIntrinsicExpression ||
      $expr is HHAST\LambdaExpression ||
      $expr is HHAST\LiteralExpression ||
      $expr is HHAST\Missing ||
      $expr is HHAST\NameExpression ||
      (
        $expr is HHAST\ParenthesizedExpression &&
        $this->isEmptyExpression($expr->getExpression())
      ) ||
      $expr is HHAST\SubscriptExpression ||
      $expr is HHAST\VectorIntrinsicExpression ||
      $expr is HHAST\VariableExpression ||
      $expr is HHAST\VarrayIntrinsicExpression;
  }

  /**
   * Returns whether the given token is an operator that does not result in
   * assignment or other operations that can have side effects.
   */
  private function isOperatorWithoutSideEffects(Token $op): bool {
    // The pipe operator does not necessarily have any side effects but it
    // typically implies function invocation which can have side effects.
    return !$this->isAssignmentOperator($op) &&
      !$op is HHAST\BarGreaterThanToken;
  }

  /**
   * Returns whether the given token is an assignment operator.
   *
   * This list is all the types returned from ExpressionStatement::getOperator
   * that include "Equal" and are not comparison operators (==, >=, etc.);
   */
  private function isAssignmentOperator(Token $op): bool {
    return $op is HHAST\AmpersandEqualToken ||
      $op is HHAST\BarEqualToken ||
      $op is HHAST\CaratEqualToken ||
      $op is HHAST\DotEqualToken ||
      $op is HHAST\EqualToken ||
      $op is HHAST\GreaterThanEqualToken ||
      $op is HHAST\GreaterThanGreaterThanEqualToken ||
      $op is HHAST\LessThanEqualToken ||
      $op is HHAST\LessThanLessThanEqualToken ||
      $op is HHAST\MinusEqualToken ||
      $op is HHAST\PercentEqualToken ||
      $op is HHAST\PlusEqualToken ||
      $op is HHAST\QuestionQuestionEqualToken ||
      $op is HHAST\SlashEqualToken ||
      $op is HHAST\StarEqualToken ||
      $op is HHAST\StarStarEqualToken;
  }
}
