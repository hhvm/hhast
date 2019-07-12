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
  LeftParenToken,
  MemberSelectionExpression,
  ObjectCreationExpression,
  ParenthesizedExpression,
  RightParenToken,
  Script,
};
use function Facebook\HHAST\Missing;

final class MethodCallOnConstructorLinter extends AutoFixingASTLinter {
  const type TNode = MemberSelectionExpression;
  const type TContext = Script;

  <<__Override>>
  public function getLintErrorForNode(
    Script $_context,
    MemberSelectionExpression $node,
  ): ?ASTLintError {
    $obj = $node->getObject();
    if (!$obj is ObjectCreationExpression) {
      return null;
    }

    return new ASTLintError(
      $this,
      'Parenthesize method and member access on object creation expressions',
      $node,
      () ==> $this->getFixedNode($node),
    );
  }

  <<__Override>>
  public function getTitleForFix(LintError $_): string {
    return 'Add parentheses';
  }

  public function getFixedNode(
    MemberSelectionExpression $node,
  ): MemberSelectionExpression {
    $obj = $node->getObject();
    return $node->withObject(new ParenthesizedExpression(
      new LeftParenToken($obj->getFirstTokenx()->getLeading(), Missing()),
      $obj->without($obj->getFirstTokenx()->getLeading())
        ->without($obj->getLastTokenx()->getTrailing()),
      new RightParenToken(Missing(), $obj->getLastTokenx()->getTrailing()),
    ));
  }
}
