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
  Script,
  TypeToken,
};
use namespace HH\Lib\{C, Str};

function get_uses_directly_in_scope(?NodeList<Node> $scope): shape(
  'namespaces' => dict<string, Script::TAliasedNamespace>,
  'types' => dict<string, Script::TAliasedNamespace>,
  'functions' => dict<string, Script::TAliasedNamespace>,
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
        $clause,
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
        $clause,
        $prefix.Str\trim($clause->getNameUNTYPED()?->getCode() ?? ''),
        $clause->getAlias(),
      );
    }
  }

  $namespaces = dict[];
  $types = dict[];
  $functions = dict[];
  foreach ($uses as $use) {
    list($kind, $clause, $name, $alias) = $use;
    // Leading "\" in "use" declarations does nothing.
    $name = Str\strip_prefix($name, '\\');
    $alias = $alias === null
      ? $name
        |> \explode('\\', $$)
        |> C\lastx($$)
      : $alias->getCode()
      |> Str\trim($$)
      |> Str\strip_prefix($$, '\\');
    $target = shape('name' => $name, 'use_clause' => $clause);
    if ($kind === null) {
      $namespaces[$alias] ??= $target;
      $types[$alias] ??= $target;
      $functions[$alias] ??= $target;
    } else if ($kind is NamespaceToken) {
      $namespaces[$alias] = $target;
    } else if ($kind is TypeToken) {
      $types[$alias] = $target;
    } else if ($kind is FunctionToken) {
      $functions[$alias] = $target;
    }
  }

  return shape(
    'namespaces' => $namespaces,
    'types' => $types,
    'functions' => $functions,
  );
}
