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

use type Facebook\HHAST\{
  ClassishDeclaration,
  EditableSyntax,
  MethodishDeclaration
};
use type Facebook\TypeAssert\TypeAssert;

use namespace HH\Lib\{C, Vec};

class MustUseOverrideAttributeLinter extends ASTLinter<MethodishDeclaration> {
  protected static function getTargetType(): classname<MethodishDeclaration> {
    return MethodishDeclaration::class;
  }

  public function lintNode(
    MethodishDeclaration $node,
    vec<EditableSyntax> $parents,
  ): ?ASTLintError {
    $class = $parents
      |> Vec\filter($$, $x ==> $x instanceof ClassishDeclaration)
      |> C\lastx($$)
      |> TypeAssert::isInstanceOf(ClassishDeclaration::class, $$);

    if (!$class->hasExtendsList()) {
      return null;
    }

    $attrs_list = $node->hasAttribute()
      ? $node->getAttributex()->getAttributes()->to_vec()
      : vec[];
    if (C\contains($attrs_list, '__Override')) {
      return null;
    }

    return null;
  }
}
