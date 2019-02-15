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
  ClassishDeclaration,
  EditableNode,
  FinalToken,
  AbstractToken,
  ClassToken,
};

use type Facebook\HHAST\Linters\{ASTLinter, ASTLintError};

/*
 * This linter ensures we always qualify classes as final or abstract
 */
final class FinalOrAbstractClassLinter extends ASTLinter<ClassishDeclaration> {
  <<__Override>>
  protected static function getTargetType(): classname<ClassishDeclaration> {
    return ClassishDeclaration::class;
  }

  <<__Override>>
  public function getLintErrorForNode(
    ClassishDeclaration $node,
    vec<EditableNode> $_parents,
  ): ?ASTLintError<ClassishDeclaration> {
    // ensure we are looking at a class declaration
    if (!($node->getKeyword() is ClassToken)) {
      return null;
    }

    // check if the ClassishDeclaration has modifiers
    $modifiers = $node->getModifiers();
    $found = false;
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
