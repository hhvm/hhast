<?hh // strict
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
  EditableNode,
  EqualEqualToken,
  EqualEqualEqualToken,
  ExclamationEqualToken,
  ExclamationEqualEqualToken,
  LessThanGreaterThanToken,
};
use function Facebook\HHAST\Missing;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\{C, Vec};

final class NoPHPEqualityLinter
  extends AutoFixingASTLinter<BinaryExpression> {
  <<__Override>>
  protected static function getTargetType(): classname<BinaryExpression> {
    return BinaryExpression::class;
  }

  <<__Override>>
  public function getLintErrorForNode(
    BinaryExpression $expr,
    vec<EditableNode> $_parents,
  ): ?FixableASTLintError<BinaryExpression> {
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

    return new FixableASTLintError(
      $this,
      'Do not use PHP equality - use "'.$replacement.'" instead.',
      $expr,
    );
    return null;
  }

  <<__Override>>
  public function getFixedNode(BinaryExpression $expr): ?EditableNode {
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
      return null;
    }
    return $expr->withOperator($op);
  }
}
