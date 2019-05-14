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
    return $expr instanceof HHAST\ArrayCreationExpression ||
      $expr instanceof HHAST\AnonymousFunction ||
      (
        $expr instanceof HHAST\BinaryExpression &&
        $this->isOperatorWithoutSideEffects($expr->getOperator())
      ) ||
      $expr instanceof HHAST\CastExpression ||
      $expr instanceof HHAST\CollectionLiteralExpression ||
      $expr instanceof HHAST\DarrayIntrinsicExpression ||
      $expr instanceof HHAST\DictionaryIntrinsicExpression ||
      $expr instanceof HHAST\EmptyExpression ||
      $expr instanceof HHAST\InstanceofExpression ||
      $expr instanceof HHAST\IsExpression ||
      $expr instanceof HHAST\IssetExpression ||
      $expr instanceof HHAST\KeysetIntrinsicExpression ||
      $expr instanceof HHAST\LambdaExpression ||
      $expr instanceof HHAST\LiteralExpression ||
      $expr instanceof HHAST\Missing ||
      $expr instanceof HHAST\NameExpression ||
      (
        $expr instanceof HHAST\ParenthesizedExpression &&
        $this->isEmptyExpression($expr->getExpression())
      ) ||
      $expr instanceof HHAST\SubscriptExpression ||
      $expr instanceof HHAST\VectorIntrinsicExpression ||
      $expr instanceof HHAST\VariableExpression ||
      $expr instanceof HHAST\VarrayIntrinsicExpression;
  }

  /**
   * Returns whether the given token is an operator that does not result in
   * assignment or other operations that can have side effects.
   */
  private function isOperatorWithoutSideEffects(EditableToken $op): bool {
    // The pipe operator does not necessarily have any side effects but it
    // typically implies function invocation which can have side effects.
    return
      !$this->isAssignmentOperator($op) && !$op instanceof HHAST\BarGreaterThanToken;
  }

  /**
   * Returns whether the given token is an assignment operator.
   *
   * This list is all the types returned from ExpressionStatement::getOperator
   * that include "Equal" and are not comparison operators (==, >=, etc.);
   */
  private function isAssignmentOperator(EditableToken $op): bool {
    return $op instanceof HHAST\AmpersandEqualToken ||
      $op instanceof HHAST\BarEqualToken ||
      $op instanceof HHAST\CaratEqualToken ||
      $op instanceof HHAST\DotEqualToken ||
      $op instanceof HHAST\EqualToken ||
      $op instanceof HHAST\GreaterThanEqualToken ||
      $op instanceof HHAST\GreaterThanGreaterThanEqualToken ||
      $op instanceof HHAST\LessThanEqualToken ||
      $op instanceof HHAST\LessThanLessThanEqualToken ||
      $op instanceof HHAST\MinusEqualToken ||
      $op instanceof HHAST\PercentEqualToken ||
      $op instanceof HHAST\PlusEqualToken ||
      $op instanceof HHAST\QuestionQuestionEqualToken ||
      $op instanceof HHAST\SlashEqualToken ||
      $op instanceof HHAST\StarEqualToken ||
      $op instanceof HHAST\StarStarEqualToken;
  }
}
