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

use type Facebook\HHAST\EditableNode;
use namespace Facebook\HHAST;

abstract class AutoFixingASTLinter<Tnode as EditableNode>
extends BaseASTLinter<Tnode, FixableASTLintError<Tnode>>
implements AutoFixingLinter<FixableASTLintError<Tnode>> {

  abstract public function getFixedNode(Tnode $node): ?EditableNode;

  final public function fixLintErrors(
    Traversable<FixableASTLintError<Tnode>> $errors,
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
      invariant(
        $new !== null,
        "Shouldn't be attempting to fix a non-fixable error",
      );
      if ($ast === $old) {
        $ast = $new;
      } else {
        $ast = $ast->replace($old, $new);
      }
    }
    \file_put_contents(
      $this->getFile(),
      $ast->getCode(),
    );
  }
}
