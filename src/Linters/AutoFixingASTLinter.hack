/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use type Facebook\HHAST\File;

abstract class AutoFixingASTLinter extends ASTLinter {
  use AutoFixingLinterTrait<ASTLintError>;

  final public function getFixedFile(Traversable<ASTLintError> $errors): File {
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
      $new = $error->getFixedNode();
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
