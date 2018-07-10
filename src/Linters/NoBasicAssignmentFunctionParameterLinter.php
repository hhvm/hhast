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

use namespace Facebook\TypeAssert;
use namespace HH\Lib\{C, Str, Vec};

class NoBasicAssignmentFunctionParameterLinter
  extends AutoFixingASTLinter<FunctionCallExpression> {

  <<__Override>>
  protected static function getTargetType(): classname<FunctionCallExpression> {
    return FunctionCallExpression::class;
  }

  <<__Override>>
  public function getLintErrorForNode(
    FunctionCallExpression $node,
    vec<EditableNode> $parents,
  ): ?FixableASTLintError<FunctionCallExpression> {
    $exps = $node
      ->getArgumentList()
      ?->getItemsOfType(BinaryExpression::class);
    if ($exps === null) {
      return null;
    }
    $assignment_exps = Vec\filter(
      $exps,
      $exp ==> $exp instanceof BinaryExpression &&
        $exp->getOperator() instanceof EqualToken,
    );
    if (C\is_empty($assignment_exps)) {
      return null;
    }
    return new FixableASTLintError(
      $this,
      "Basic assignment is not allowed in function parameters because it is often".
      "\n\t1) unexpected that it sets a local variable in the containing scope".
      "\n\t2) wrongly assumed that the variables are named parameters",
      $node,
      new EditableList($assignment_exps),
    );
  }

  <<__Override>>
  public function getPrettyTextForNode(
    FunctionCallExpression $blame,
    ?EditableNode $assignment_exps,
  ): string {
    invariant(
      $assignment_exps instanceof EditableList,
      'Expected a list of assignment expressions',
    );
    $assignment_exps = Vec\map(
      $assignment_exps->toVec(),
      $item ==> TypeAssert\instance_of(BinaryExpression::class, $item),
    );
    return $blame->getCode();
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
        $item = $exp->getItem();
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
          $fixed_exps[] = $item->getRightOperand();
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
