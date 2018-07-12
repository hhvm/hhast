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
  EditableList,
  EditableNode,
  EditableToken,
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
use namespace HH\Lib\{C, Str, Vec};

final class UnusedUseClauseLinter
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
    if (!$node instanceof NamespaceUseDeclaration) {
      // TODO: group use
      return null;
    }
    $clauses = $node->getClauses()->getItemsOfType(NamespaceUseClause::class);
    $unused = $this->getUnusedClauses($node->getKind(), $clauses);

    if (C\is_empty($unused)) {
      return null;
    }

    return new FixableASTLintError(
      $this,
      C\count($unused) === 1
        ? ('`'.C\firstx($unused)[0].'` is not used')
        : (
            $unused
            |> Vec\map($$, $p ==> '`'.$p[0].'`')
            |> Str\join($$, ', ')
            |> $$.' are not used'
          ),
      $node,
    );
  }

  private function getUnusedClauses(
    ?EditableToken $kind,
    vec<NamespaceUseClause> $clauses,
  ): vec<(string, NamespaceUseClause)> {
    $used = $this->getUnresolvedReferencedNames();
    $unused = vec[];
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
      if ($kind instanceof NamespaceToken) {
        if (!C\contains($used['namespaces'], $as)) {
          $unused[] = tuple($as, $clause);
        }
        continue;
      }
      if ($kind instanceof TypeToken) {
        if (!C\contains($used['types'], $as)) {
          $unused[] = tuple($as, $clause);
        }
        continue;
      }

      if ($kind instanceof FunctionToken) {
        if (!C\contains($used['functions'], $as)) {
          $unused[] = tuple($as, $clause);
        }
        continue;
      }

      if ($kind instanceof ConstToken) {
        if (!C\contains($used['constants'], $as)) {
          $unused[] = tuple($as, $clause);
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
      $unused[] = tuple($as, $clause);
    }
    return $unused;
  }

  <<__Override>>
  public function getFixedNode(INamespaceUseDeclaration $node): EditableNode {
    $clauses = $node->getClauses()->getItemsOfType(NamespaceUseClause::class);
    if (C\count($clauses) === 1) {
      return HHAST\Missing();
    }
    $unused = $this->getUnusedClauses(
      $node->getKind(),
      $clauses,
    ) |> Vec\map($$, $p ==> $p[1]);


    return $node->removeWhere(
      ($c, $_) ==>
        $c instanceof HHAST\ListItem && C\contains($unused, $c->getItem()),
    );
  }

  <<__Memoize>>
  private function getUnresolvedReferencedNames(
  ): shape(
    'namespaces' => keyset<string>,
    'types' => keyset<string>,
    'functions' => keyset<string>,
    'constants' => keyset<string>,
  ) {
    return HHAST\get_unresolved_referenced_names($this->getAST());
  }
}
