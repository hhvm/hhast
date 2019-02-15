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
  ExpressionStatement,
  EditableToken,
  EditableNode,
  EditableList,
};

use namespace Facebook\HHAST;

final class NoEmptyStatementsLinter
  extends AutoFixingASTLinter<ExpressionStatement> {
  <<__Override>>
  protected static function getTargetType(): classname<ExpressionStatement> {
    return ExpressionStatement::class;
  }

  <<__Override>>
  public function getTitleForFix(LintError $_): string {
    return 'Remove statement';
  }

  <<__Override>>
  public function getLintErrorForNode(
    ExpressionStatement $stmt,
    vec<EditableNode> $_parents,
  ): ?ASTLintError<ExpressionStatement> {

    $expr = $stmt->getExpression();
    if ($expr === null) {
      return new ASTLintError($this, 'This statement is empty', $stmt);
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

  <<__Override>>
  public function getFixedNode(ExpressionStatement $stmt): EditableNode {
    // Only offer a fix if the node is literally empty
    if ($stmt->getExpression() !== null) {
      return $stmt;
    }

    $semicolon = $stmt->getSemicolonx();
    $leading = $semicolon->getLeading();
    $trailing = $semicolon->getTrailing();

    return
      EditableList::concat($semicolon->getLeading(), $semicolon->getTrailing());
  }

  /**
   * Returns whether the given expression is empty.
   */
  private function isEmptyExpression(EditableNode $expr): bool {
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
      $expr is HHAST\EmptyExpression ||
      $expr is HHAST\InstanceofExpression ||
      $expr is HHAST\IsExpression ||
      $expr is HHAST\IssetExpression ||
      $expr is HHAST\KeysetIntrinsicExpression ||
      $expr is HHAST\LambdaExpression ||
      // TODO: Remove when library requires hhvm >= 3.30 and PHP support has been dropped
      (
        $expr is HHAST\LiteralExpression &&
        !($expr->getExpression() is HHAST\ExecutionStringLiteralToken)
      ) ||
      $expr is HHAST\Missing ||
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
  private function isOperatorWithoutSideEffects(EditableToken $op): bool {
    // The pipe operator does not necessarily have any side effects but it
    // typically implies function invocation which can have side effects.
    return
      !$this->isAssignmentOperator($op) && !$op is HHAST\BarGreaterThanToken;
  }

  /**
   * Returns whether the given token is an assignment operator.
   *
   * This list is all the types returned from ExpressionStatement::getOperator
   * that include "Equal" and are not comparison operators (==, >=, etc.);
   */
  private function isAssignmentOperator(EditableToken $op): bool {
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
