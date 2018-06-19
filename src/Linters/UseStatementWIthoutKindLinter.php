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

use type Facebook\HHAST\{EditableNode, INamespaceUseDeclaration};
use namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\{C, Str, Vec};

class UseStatementWithoutKindLinter
  extends ASTLinter<INamespaceUseDeclaration> {
  <<__Override>>
  protected static function getTargetType(): classname<INamespaceUseDeclaration> {
    return INamespaceUseDeclaration::class;
  }

  <<__Override>>
  public function getLintErrorForNode(
    INamespaceUseDeclaration $node,
    vec<EditableNode> $_context,
  ): ?ASTLintError<INamespaceUseDeclaration> {
    if ($node->hasKind()) {
      return null;
    }

    return new ASTLintError(
      $this,
      "Use `use type` or `use namespace`",
      $node,
    );
  }
}
