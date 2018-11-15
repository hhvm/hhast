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

use type Facebook\HHAST\{ExpressionStatement, EditableNode, EditableList};

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
    vec<EditableNode> $_parents,
  ): ?ASTLintError<ExpressionStatement> {

    $expr = $stmt->getExpression();
    if ($expr === null) {
      return new ASTLintError($this, 'This statement is empty', $stmt);
    }

    return null;
  }

  <<__Override>>
  public function getFixedNode(ExpressionStatement $stmt): EditableNode {
    $semicolon = $stmt->getSemicolonx();
    $leading = $semicolon->getLeading();
    $trailing = $semicolon->getTrailing();

    return
      EditableList::concat($semicolon->getLeading(), $semicolon->getTrailing());
  }
}
