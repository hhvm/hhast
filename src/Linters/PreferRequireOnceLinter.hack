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
  protected function getTitleForFix(LintError $_): string {
    return 'Prefer "require_once" over "include(_once)"" and "require"';
  }

  <<__Override>>
  public function getLintErrorForNode(
    Script $_context,
    InclusionExpression $node,
  ): ?ASTLintError {
    if ($node is Require_onceToken) {
      return null;
    }

    return new ASTLintError(
      $this,
      'Use require_once to require/include files',
      $node,
      () ==> $this->getFixedNode($node),
    );
  }

  /**
   * Could I get a helping hand here?
   * I want this to replace `include_once __DIR__ . '/../file.hack'` with `require_once __DIR__ . '/../file.hack'`.
   * It consumes all the indentation.
   * Is there something that feels like Node::getLeadingWhitespace()?
   */
  public function getFixedNode(InclusionExpression $node): ?Node {
    return $node->withRequire(
      new Require_onceToken(null, new NodeList(vec[new WhiteSpace(' ')])),
    );
  }
}
