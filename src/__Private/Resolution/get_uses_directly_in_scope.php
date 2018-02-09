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

namespace Facebook\HHAST\__Private\Resolution;

use type Facebook\HHAST\{
  EditableNode,
  NamespaceBody,
  NamespaceDeclaration,
  NamespaceEmptyBody,
  NamespaceGroupUseDeclaration,
  NamespaceToken,
  NamespaceUseClause,
  NamespaceUseDeclaration,
  TypeToken
};
use namespace HH\Lib\{C, Str, Vec};

function get_uses_directly_in_scope(
  EditableNode $scope,
): shape(
  'namespaces' => dict<string, string>,
  'types' => dict<string, string>,
) {
  $uses = vec[];

  // use [kind] Foo, [kind] Bar;
  $statements = $scope->getChildrenOfType(NamespaceUseDeclaration::class);
  foreach ($statements as $statement) {
    $kind = $statement->getKind();
    $clauses = $statement->getClauses()->getDescendantsOfType(
      NamespaceUseClause::class,
    );
    foreach ($clauses as $clause) {
      $uses[] = tuple(
        $clause->hasClauseKind() ? $clause->getClauseKind() : $kind,
        Str\trim($clause->getNameUNTYPED()->getCode()),
        $clause->getAlias(),
      );
    }
  }

  // use [kind] Foo\{Bar, [kind] Baz}
  $statements = $scope->getChildrenOfType(NamespaceGroupUseDeclaration::class);
  foreach ($statements as $statement) {
    $kind = $statement->getKind();
    $prefix = $statement->getPrefix()->getCode()
      |> Str\trim($$)
      |> Str\strip_prefix($$, '\\');
    $clauses = $statement->getClauses()->getDescendantsOfType(
      NamespaceUseClause::class,
    );
    foreach ($clauses as $clause) {
      $uses[] = tuple(
        $clause->hasClauseKind() ? $clause->getClauseKind() : $kind,
        $prefix.Str\trim($clause->getNameUNTYPED()->getCode()),
        $clause->getAlias(),
      );
    }
  }

  $namespaces = dict[];
  $types = dict[];
  foreach ($uses as $use) {
    list($kind, $name, $alias) = $use;
    $alias = $alias === null
      ? $name
        |> \explode('\\', $$)
        |> C\lastx($$)
      : $alias->getCode()
        |> Str\trim($$)
        |> Str\strip_prefix($$, '\\');
    if ($kind === null) {
      $namespaces[$alias] = $name;
      $types[$alias] = $name;
    } else if ($kind instanceof NamespaceToken) {
      $namespaces[$alias] = $name;
    } else if ($kind instanceof TypeToken) {
      $types[$alias] = $name;
    }
  }

  return shape(
    'namespaces' => $namespaces,
    'types' => $types,
  );
}
