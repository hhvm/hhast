<?hh // strict
/**
 * Copyright (c) 2016, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional
 * grant of patent rights can be found in the PATENTS file in the same
 * directory.
 *
 */

namespace Facebook\HHAST\Linters;

use type Facebook\HHAST\EditableSyntax;
use namespace Facebook\HHAST;

abstract class AutoFixingASTLinter<Tnode as EditableSyntax>
extends ASTLinter<Tnode>
implements AutoFixingLinter<ASTLintError<Tnode, this>>{

  abstract public function getFixedNode(Tnode $node): Tnode;

  final public function fixLintErrors(
    Traversable<ASTLintError<Tnode, this>> $errors,
  ): void {
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
      $ast = $ast->replace($new, $old);
    }
    file_put_contents(
      $this->getFile(),
      $ast->full_text(),
    );
  }
}
