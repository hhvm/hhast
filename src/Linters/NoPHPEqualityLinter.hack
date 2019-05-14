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
  BinaryExpression,
  EqualEqualToken,
  EqualEqualEqualToken,
  ExclamationEqualToken,
  ExclamationEqualEqualToken,
  LessThanGreaterThanToken,
  Script,
};
use namespace HH\Lib\Str;

final class NoPHPEqualityLinter
  extends AutoFixingASTLinter<BinaryExpression> {
  <<__Override>>
  protected static function getTargetType(): classname<BinaryExpression> {
    return BinaryExpression::class;
  }

  <<__Override>>
  protected function getTitleForFix(
    ASTLintError<BinaryExpression> $err,
  ): string {
    $blame = $err->getBlameNode();
    $fixed = $this->getFixedNode($blame);
    return Str\format(
      'Replace `%s` with `%s`',
      $blame->getOperator()->getText(),
      $fixed->getOperator()->getText(),
    );
  }

  const type TContext = Script;

  <<__Override>>
  public function getLintErrorForNode(
    Script $_context,
    BinaryExpression $expr,
  ): ?ASTLintError<BinaryExpression> {
    $token = $expr->getOperator();
    $replacement = null;
    if ($token instanceof EqualEqualToken) {
      $replacement = '===';
    } else if (
      $token instanceof ExclamationEqualToken
      || $token instanceof LessThanGreaterThanToken) {
      $replacement = '!==';
    } else {
      return null;
    }

    return new ASTLintError(
      $this,
      'Do not use PHP equality - use "'.$replacement.'" instead.',
      $expr,
    );
  }

  <<__Override>>
  public function getFixedNode(BinaryExpression $expr): BinaryExpression {
    $op = $expr->getOperator();
    if ($op instanceof EqualEqualToken) {
      $op = new EqualEqualEqualToken($op->getLeading(), $op->getTrailing());
    } else if (
      $op instanceof ExclamationEqualToken
      || $op instanceof LessThanGreaterThanToken
    ) {
      $op =
        new ExclamationEqualEqualToken($op->getLeading(), $op->getTrailing());
    } else {
      invariant_violation("Shouldn't be asked to fix non-equality operators");
    }
    return $expr->withOperator($op);
  }
}
