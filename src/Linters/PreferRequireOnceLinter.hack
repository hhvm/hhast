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
  const type TConfig = shape();
  const type TContext = Script;
  const type TNode = InclusionExpression;

  /**
   * Changing `include`, `include_once`, or `require`
   * to `require_once` may change the behavior of the program.
   * If `include_once`-like don't error behavior is expected,
   * use `if (HH\could_include($f)) require_once $f; else your_error_here($f);`.
   *
   * Including a file multiple times doesn't make sense in Hack,
   * it will either introduce 0 named entities, or error,
   * since you are redeclaring a named entity.
   */
  <<__Override>>
  public function allowYesToAll(): bool {
    return false;
  }

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
    return
      $node->withRequire(new Require_onceToken($left_trivia, $right_trivia));
  }

  <<__Override>>
  protected function getTitleForFix(SingleRuleLintError $_): string {
    return 'Change to "require_once"';
  }
}
