/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

final class PreferRequireOnceLinter extends AutoFixingASTLinter {
  const type TContext = Script;
  const type TNode = InclusionExpression;

  <<__Override>>
  public function getLintErrorForNode(
    Script $_context,
    InclusionExpression $node,
  ): ?ASTLintError {
    if ($node->getRequire() is Require_onceToken) {
      return null;
    }

    return new ASTLintError(
      $this,
      'Prefer "require_once" over "include(_once)" and "require"',
      $node,
      () ==> $this->getFixedNode($node),
    );
  }

  public function getFixedNode(InclusionExpression $node): ?Node {
    $left_trivia = $node->getRequire()->getLeading();
    $right_trivia = $node->getRequire()->getTrailing();
    return $node->withRequire(
      new Require_onceToken($left_trivia, $right_trivia),
    );
  }

  <<__Override>>
  protected function getTitleForFix(LintError $_): string {
    return 'Change to "require_once"';
  }
}
