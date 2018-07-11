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
  ConstToken,
  EditableNode,
  FunctionToken,
  INamespaceUseDeclaration,
  NamespaceGroupUseDeclaration,
  NamespaceUseDeclaration,
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
use namespace HH\Lib\{C, Str};

final class UnusedUseClauseLinter
  extends ASTLinter<INamespaceUseDeclaration> {
  <<__Override>>
  protected static function getTargetType(
  ): classname<INamespaceUseDeclaration> {
    return INamespaceUseDeclaration::class;
  }

  <<__Override>>
  public function getLintErrorForNode(
    INamespaceUseDeclaration $node,
    vec<EditableNode> $_context,
  ): ?ASTLintError<INamespaceUseDeclaration> {
    if (!$node instanceof NamespaceUseDeclaration) {
      // TODO: group use
      return null;
    }
    $clauses = $node->getClauses()->getItemsOfType(NamespaceUseClause::class);
    $prefix = '';

    $used = $this->getUnresolvedReferencedNames();
    $unused = keyset[];
    foreach ($clauses as $clause) {
      $as = $clause->getAlias();
      if ($as !== null) {
        $as = $as->getText();
      } else {
        $name = $clause->getName();
        if ($name instanceof NameToken) {
          $as = $name->getText();
        } else {
          invariant($name instanceof QualifiedName, "Unhandled name type");
          $as = $name->getParts()->getItemsOfType(NameToken::class)
            |> C\lastx($$)->getText();
        }
      }
      $kind = $node->getKind();
      if ($kind instanceof NamespaceToken) {
        if (!C\contains($used['namespaces'], $as)) {
          $unused[] = $as;
        }
        continue;
      }
      if ($kind instanceof TypeToken) {
        if (!C\contains($used['types'], $as)) {
          $unused[] = $as;
        }
        continue;
      }

      if ($kind instanceof FunctionToken) {
        if (!C\contains($used['functions'], $as)) {
          $unused[] = $as;
        }
        continue;
      }

      if ($kind instanceof ConstToken) {
        if (!C\contains($used['constants'], $as)) {
          $unused[] = $as;
        }
        continue;
      }

      invariant($kind === null, 'Unhandled kind: %s', \get_class($kind));
      if (C\contains($used['namespaces'], $as)) {
        continue;
      }
      if (C\contains($used['types'], $as)) {
        continue;
      }
      $unused[] = $as;
    }

    if (C\is_empty($unused)) {
      return null;
    }

    return new ASTLintError(
      $this,
      C\count($unused) === 1
        ? (C\first($unused).' is not used')
        : (Str\join($unused, ', ').'are not used'),
      $node,
    );
  }

  <<__Memoize>>
  private function getUnresolvedReferencedNames(): shape(
    'namespaces' => keyset<string>,
    'types' => keyset<string>,
    'functions' => keyset<string>,
    'constants' => keyset<string>,
  ) {
    return HHAST\get_unresolved_referenced_names($this->getAST());
  }
}
