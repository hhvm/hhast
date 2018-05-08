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

use type Facebook\HHAST\{AsToken, EditableNode, NamespaceUseClause};
use namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use function Facebook\HHAST\resolve_type;
use namespace HH\Lib\{C, Str, Vec};

class UseStatementWithAsLinter extends AutoFixingASTLinter<NamespaceUseClause> {
  <<__Override>>
  protected static function getTargetType(): classname<NamespaceUseClause> {
    return NamespaceUseClause::class;
  }

  <<__Override>>
  public function getLintErrorForNode(
    NamespaceUseClause $node,
    vec<EditableNode> $parents,
  ): ?FixableASTLintError<NamespaceUseClause> {
    if (!$node->hasAlias()) {
      return null;
    }
    return new FixableASTLintError(
      $this,
      "Don't use `as` in `use` statements: it makes code less readable and ".
      "less greppable.",
      $node,
    );
  }

  <<__Override>>
  public function getFixedNode(NamespaceUseClause $node): EditableNode {
    return $node
      ->withAs(HHAST\Missing())
      ->withAlias(HHAST\Missing())
      ->replace(
        $node->getName()->getLastTokenx(),
        $node->getName()->getLastTokenx()
          ->withTrailing($node->getAliasx()->getLastTokenx()->getTrailing()),
      );
  }
}
