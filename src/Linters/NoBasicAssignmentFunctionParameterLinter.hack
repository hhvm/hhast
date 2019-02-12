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
  EditableNode,
  EditableList,
  FunctionCallExpression,
  BinaryExpression,
  EqualToken,
  DelimitedComment,
  ListItem,
  CommaToken,
  WhiteSpace,
};

use namespace HH\Lib\C;

class NoBasicAssignmentFunctionParameterLinter
  extends AutoFixingASTLinter<FunctionCallExpression> {

  <<__Override>>
  protected static function getTargetType(): classname<FunctionCallExpression> {
    return FunctionCallExpression::class;
  }

  <<__Override>>
  public function getLintErrorForNode(
    FunctionCallExpression $node,
    vec<EditableNode> $_parents,
  ): ?ASTLintError<FunctionCallExpression> {
    $exps = $node
      ->getArgumentList()
      ?->getItemsOfType(BinaryExpression::class);
    if ($exps === null) {
      return null;
    }

    if (
      !C\any(
        $exps,
        $exp ==> $exp instanceof BinaryExpression &&
          $exp->getOperator() instanceof EqualToken,
      )
    ) {
      return null;
    }

    return new ASTLintError(
      $this,
      "Basic assignment is not allowed in function parameters because it is often".
      "\n\t1) unexpected that it sets a local variable in the containing scope".
      "\n\t2) wrongly assumed that the variables are named parameters",
      $node,
    );
  }

  <<__Override>>
  protected function getTitleForFix(LintError $_): string {
    return 'Replace assignment with comment';
  }


  <<__Override>>
  public function getFixedNode(
    FunctionCallExpression $node,
  ): FunctionCallExpression {
    $args = $node->getArgumentListx()->toVec();
    $exps = $node->getArgumentListx();
    $fixed_exps = vec[];
    foreach ($args as $exp) {
      if ($exp instanceof ListItem) {
        $item = $exp->getItemx();
        if (
          $item instanceof BinaryExpression &&
          $item->getOperator() instanceof EqualToken
        ) {
          $fixed_exps[] = new DelimitedComment(
            '/* '.
            $item->getLeftOperand()->getCode().
            $item->getOperator()->getCode().
            '*/ ',
          );
          $fixed_exps[] = $item->getRightOperandx();
          if ($exp !== C\lastx($args)) {
            $fixed_exps[] =
              new CommaToken(new WhiteSpace(''), new WhiteSpace(' '));
          }
        } else {
          $fixed_exps[] = $exp;
        }
      }
    }
    return $node->replace($exps, new EditableList($fixed_exps));
  }
}
