/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private\Resolution;

use type Facebook\HHAST\{
  FunctionToken,
  NamespaceGroupUseDeclaration,
  NamespaceToken,
  NamespaceUseClause,
  NamespaceUseDeclaration,
  Node,
  NodeList,
  TypeToken,
};
use namespace HH\Lib\{C, Str};

function get_uses_directly_in_scope(
  ?NodeList<Node> $scope,
): shape(
  'namespaces' => dict<string, string>,
  'types' => dict<string, string>,
  'functions' => dict<string, string>,
) {
  if ($scope === null) {
    return shape(
      'namespaces' => dict[],
      'types' => dict[],
      'functions' => dict[],
    );
  }
  $uses = vec[];

  // use [kind] Foo, [kind] Bar;
  $statements = $scope->getChildrenOfType(NamespaceUseDeclaration::class);
  foreach ($statements as $statement) {
    $kind = $statement->getKind();
    $clauses = $statement->getClauses()
      ->getDescendantsOfType(NamespaceUseClause::class);
    foreach ($clauses as $clause) {
      $uses[] = tuple(
        $clause->hasClauseKind() ? $clause->getClauseKind() : $kind,
        Str\trim($clause->getNameUNTYPED()?->getCode() ?? ''),
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
    $clauses = $statement->getClauses()
      ->getDescendantsOfType(NamespaceUseClause::class);
    foreach ($clauses as $clause) {
      $uses[] = tuple(
        $clause->hasClauseKind() ? $clause->getClauseKind() : $kind,
        $prefix.Str\trim($clause->getNameUNTYPED()?->getCode() ?? ''),
        $clause->getAlias(),
      );
    }
  }

  $namespaces = dict[];
  $types = dict[];
  $functions = dict[];
  foreach ($uses as $use) {
    list($kind, $name, $alias) = $use;
    // Leading "\" in "use" declarations does nothing.
    $name = Str\strip_prefix($name, '\\');
    $alias = $alias === null
      ? $name
        |> \explode('\\', $$)
        |> C\lastx($$)
      : $alias->getCode()
      |> Str\trim($$)
      |> Str\strip_prefix($$, '\\');
    if ($kind === null) {
      $namespaces[$alias] ??= $name;
      $types[$alias] ??= $name;
      $functions[$alias] ??= $name;
    } else if ($kind is NamespaceToken) {
      $namespaces[$alias] = $name;
    } else if ($kind is TypeToken) {
      $types[$alias] = $name;
    } else if ($kind is FunctionToken) {
      $functions[$alias] = $name;
    }
  }

  return shape(
    'namespaces' => $namespaces,
    'types' => $types,
    'functions' => $functions,
  );
}
