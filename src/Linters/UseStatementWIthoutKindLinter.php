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

use type Facebook\HHAST\{
  EditableNode,
  INamespaceUseDeclaration,
  NamespaceUseClause,
  NamespaceToken,
  NameToken,
  ScopeResolutionExpression,
  SimpleTypeSpecifier,
  TypeToken,
  QualifiedName,
};
use namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\{C, Keyset, Str};

class UseStatementWithoutKindLinter
  extends AutoFixingASTLinter<INamespaceUseDeclaration> {
  <<__Override>>
  protected static function getTargetType(
  ): classname<INamespaceUseDeclaration> {
    return INamespaceUseDeclaration::class;
  }

  <<__Override>>
  public function getLintErrorForNode(
    INamespaceUseDeclaration $node,
    vec<EditableNode> $_context,
  ): ?FixableASTLintError<INamespaceUseDeclaration> {
    if ($node->hasKind()) {
      return null;
    }

    return new FixableASTLintError(
      $this,
      "Use `use type` or `use namespace`",
      $node,
    );
  }

  <<__Override>>
  public function getFixedNode(INamespaceUseDeclaration $node): ?EditableNode {
    // Figure out what names are imported
    $names = Keyset\map(
      $node->getClauses()->getItemsOfType(NamespaceUseClause::class),
      $clause ==> {
        if ($clause->hasAs()) {
          return $clause->getAsx()->getText();
        }
        $name = $clause->getName();
        if ($name instanceof QualifiedName) {
          return C\lastx($name->getParts()->getItemsOfType(NameToken::class))
            ->getText();
        }
        invariant(
          $name instanceof NameToken,
          "Expected a Qualified or NameToken, got %s",
          \get_class($name),
        );
        return $name->getText();
      },
    );

    // We need to look at the full file to figure out if this should be a
    // `use type`, or `use namespace`
    $ast = $this->getAST();
    $used_as_ns = false;
    $used_as_type = false;
    foreach ($ast->traverse() as $child) {
      if ($child instanceof QualifiedName) {
        $name = C\firstx($child->getParts()->getItems());
        if (!$name instanceof NameToken) {
          continue;
        }
        if (C\contains_key($names, $name->getText())) {
          $used_as_ns = true;
        }
        continue;
      }

      if ($child instanceof SimpleTypeSpecifier) {
        $name = $child->getSpecifierx();
        if (!$name instanceof NameToken) {
          continue;
        }
        if (C\contains_key($names, $name->getText())) {
          $used_as_type = true;
        }
        continue;
      }

      if ($child instanceof ScopeResolutionExpression) {
        $name = $child->getQualifier();
        if (!$name instanceof NameToken) {
          continue;
        }
        if (C\contains_key($names, $name->getText())) {
          $used_as_type = true;
        }
        continue;
      }
    }

    $leading = $node->getClauses()->getFirstTokenx()->getLeadingWhitespace();
    $trailing = $node->getKeywordx()->getTrailingWhitespace();
    if ($used_as_type && !$used_as_ns) {
      return $node->withKind(new TypeToken($leading, $trailing));
    }
    if ($used_as_ns && !$used_as_type) {
      return
        $node->withKind(new NamespaceToken($leading, $trailing));
    }

    // Unused, or ambiguous
    return null;
  }
}
