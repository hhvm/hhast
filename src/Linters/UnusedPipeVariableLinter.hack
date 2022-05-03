/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

final class UnusedPipeVariableLinter extends ASTLinter {
  const type TConfig = shape();
  const type TNode = BinaryExpression;
  const type TContext = Script;

  <<__Override>>
  public function getLintErrorForNode(
    Script $script,
    BinaryExpression $expr,
  ): ?ASTLintError {
    $op = $expr->getOperator();
    if (!$op is BarGreaterThanToken) {
      return null;
    }
    $rhs = $expr->getRightOperand();
    $pipe_var = $rhs->getFirstDescendantOfType(PipeVariableExpression::class);

    if ($pipe_var is null) {
      return new ASTLintError(
        $this,
        'Missing pipe variable in right-hand side of pipe operator',
        $expr,
      );
    }

    return null;
  }
}
