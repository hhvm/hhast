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
  EditableSyntax,
  NamespaceBody,
  NamespaceDeclaration,
  NamespaceEmptyBody,
  NamespaceUseDeclaration,
  Script
};
use type Facebook\TypeAssert\TypeAssert;
use namespace HH\Lib\{C, Dict, Vec};

function get_current_uses(
  EditableSyntax $node,
  vec<EditableSyntax> $parents,
): shape(
  'namespaces' => dict<string, string>,
  'types' => dict<string, string>,
) {
  $root = $parents[0];
  invariant(
    $root instanceof Script,
    'Expected first parent to be a Script, got %s',
    get_class($root),
  );
  $uses = get_uses_directly_in_scope($root->getDeclarations());

  $namespace = Vec\filter(
    $parents,
    $parent ==> $parent instanceof NamespaceBody,
  ) |> C\first($$);
  if ($namespace) {
    $namespace = TypeAssert::isInstanceOf(NamespaceBody::class, $namespace);
    $inner_uses = get_uses_directly_in_scope($namespace->getDeclarationsx());
    $uses['namespaces'] = Dict\merge(
      $uses['namespaces'],
      $inner_uses['namespaces'],
    );
    $uses['types'] = Dict\merge(
      $uses['types'],
      $inner_uses['types'],
    );
  }

  return $uses;
}
