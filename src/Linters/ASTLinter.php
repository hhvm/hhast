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

abstract class ASTLinter<T as HHAST\EditableSyntax> extends BaseLinter {
  private HHAST\EditableSyntax $ast;

  public function __construct(
    string $file,
  ) {
    parent::__construct($file);

    $this->ast = HHAST\from_file($file);
  }

  abstract protected static function getTargetType(): classname<T>;

  abstract protected function getLintErrorForNode(
    T $node,
    vec<EditableSyntax> $parents,
  ): ?ASTLintError;

  final public function getLintErrors(
  ): Traversable<ASTLintError> {
    $target = static::getTargetType();

    foreach ($this->ast->parented_preorder() as $node) {
      list($node, $parents) = $node;
      $parents = vec($parents);

      if ($node instanceof $target) {
        $error = $this->getLintErrorForNode($node, $parents);
        if ($error !== null) {
          yield $error;
        }
      }
    }
  }
}
