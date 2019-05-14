/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\Linters;

use type Facebook\HHAST\{EditableNode, File};

abstract class AutoFixingASTLinter<Tnode as EditableNode> extends ASTLinter<Tnode> {
  abstract public function getFixedNode(Tnode $node): ?EditableNode;

  use AutoFixingLinterTrait<ASTLintError<Tnode>>;

  final public function getFixedFile(
    Traversable<ASTLintError<Tnode>> $errors,
  ): File {
    $ast = $this->getAST();
    foreach ($errors as $error) {
      invariant(
        $error->getFile() === $this->getFile(),
        "Can't fix errors in another file",
      );
      invariant(
        $error->getLinter() === $this,
        "Can't fix errors from another linter",
      );
      $old = $error->getBlameNode();
      $new = $this->getFixedNode($old);
      if ($new === null) {
        continue;
      }
      if ($ast === $old) {
        $ast = $new;
      } else {
        $ast = $ast->replace($old, $new);
      }
    }
    return $this->getFile()->withContents($ast->getCode());
  }
}
