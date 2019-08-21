/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;


/*
 * This linter ensures we always qualify classes as final or abstract
 */
final class FinalOrAbstractClassLinter extends ASTLinter {
  const type TNode = ClassishDeclaration;
  const type TContext = Script;

  <<__Override>>
  public function getLintErrorForNode(
    Script $_context,
    ClassishDeclaration $node,
  ): ?ASTLintError {
    // ensure we are looking at a class declaration
    if (!($node->getKeyword() is ClassToken)) {
      return null;
    }

    // check if the ClassishDeclaration has modifiers
    $modifiers = $node->getModifiers();
    if ($modifiers !== null) {
      foreach ($modifiers->traverse() as $mod) {
        if ($mod is FinalToken || $mod is AbstractToken) {
          return null;
        }
      }
    }
    return new ASTLintError(
      $this,
      'Class should always be declared abstract or final',
      $node,
    );
  }
}
