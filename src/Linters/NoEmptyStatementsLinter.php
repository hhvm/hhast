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
  ExpressionStatement,
  EditableNode,
  EqualEqualToken,
  EqualEqualEqualToken,
  ExclamationEqualToken,
  ExclamationEqualEqualToken,
  LessThanGreaterThanToken,
};
use function Facebook\HHAST\Missing;
use namespace HH\Lib\Str;

final class NoEmptyStatementsLinter
  extends AutoFixingASTLinter<ExpressionStatement> {
  <<__Override>>
  protected static function getTargetType(): classname<ExpressionStatement> {
    return ExpressionStatement::class;
  }

  <<__Override>>
  public function getLintErrorForNode(
    ExpressionStatement $stmt,
    vec<EditableNode> $_parents,
  ): ?ASTLintError<ExpressionStatement> {

    $expr = $stmt->getExpression();
    if ($expr === null) {
          return new ASTLintError(
      $this,
      'Delete this empty statement',
      $stmt,
    );
    }

    return null;
  }

  <<__Override>>
  public function getFixedNode(ExpressionStatement $_expr): EditableNode {
    return Missing();
  }
}
