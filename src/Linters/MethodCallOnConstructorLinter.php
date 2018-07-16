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
  MemberSelectionExpression,
  ObjectCreationExpression,
  ParenthesizedExpression,
};
use namespace HH\Lib\Str;

final class MethodCallOnConstructorLinter
  extends ASTLinter<MemberSelectionExpression> {
  <<__Override>>
  protected static function getTargetType(
  ): classname<MemberSelectionExpression> {
    return MemberSelectionExpression::class;
  }

  <<__Override>>
  public function getLintErrorForNode(
    MemberSelectionExpression $node,
    vec<EditableNode> $parents,
  ): ?ASTLintError<MemberSelectionExpression> {
    $obj = $node->getObject();
    if (!$obj instanceof ObjectCreationExpression) {
      return null;
    }

    return new ASTLintError(
      $this,
      'Parenthesize method calls on object creation expressions',
      $node,
    );
  }
}
