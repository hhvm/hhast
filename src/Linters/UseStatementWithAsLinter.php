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
        $node->getNamex(),
        $node->getNamex()
          ->withTrailing($node->getAliasx()->getLastTokenx()->getTrailing()),
      );
  }
}
