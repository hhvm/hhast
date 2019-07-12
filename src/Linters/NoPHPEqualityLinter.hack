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

final class NoPHPEqualityLinter extends AutoFixingASTLinter {
  const type TNode = BinaryExpression;

  <<__Override>>
  protected function getTitleForFix(ASTLintError $err): string {
    $blame = $err->getBlameNode() as this::TNode;
    $fixed = $err->getFixedNode() as this::TNode;
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
  ): ?ASTLintError {
    $token = $expr->getOperator();
    $replacement = null;
    if ($token is EqualEqualToken) {
      $replacement = '===';
    } else if ($token is ExclamationEqualToken) {
      $replacement = '!==';
    } else {
      return null;
    }

    return new ASTLintError(
      $this,
      'Do not use PHP equality - use "'.$replacement.'" instead.',
      $expr,
      () ==> $this->getFixedNode($expr),
    );
  }

  public function getFixedNode(BinaryExpression $expr): BinaryExpression {
    $op = $expr->getOperator();
    if ($op is EqualEqualToken) {
      $op = new EqualEqualEqualToken($op->getLeading(), $op->getTrailing());
    } else if ($op is ExclamationEqualToken) {
      $op = new ExclamationEqualEqualToken(
        $op->getLeading(),
        $op->getTrailing(),
      );
    } else {
      invariant_violation("Shouldn't be asked to fix non-equality operators");
    }
    return $expr->withOperator($op);
  }
}
