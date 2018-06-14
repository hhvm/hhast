<?hh // strict
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
  EditableNode,
  NamespaceBody,
  NamespaceDeclaration,
  NamespaceEmptyBody,
  NamespaceUseDeclaration,
  Script,
};
use namespace Facebook\TypeAssert;
use namespace HH\Lib\{C, Dict, Vec};

function get_current_uses(
  EditableNode $node,
  vec<EditableNode> $parents,
): shape(
  'namespaces' => dict<string, string>,
  'types' => dict<string, string>,
) {
  $root = $parents[0];
  invariant(
    $root instanceof Script,
    'Expected first parent to be a Script, got %s',
    \get_class($root),
  );
  $uses = get_uses_directly_in_scope($root->getDeclarations());

  $namespace =
    Vec\filter($parents, $parent ==> $parent instanceof NamespaceBody)
    |> C\first($$);
  if ($namespace) {
    $namespace = TypeAssert\instance_of(NamespaceBody::class, $namespace);
    $inner_uses = get_uses_directly_in_scope($namespace->getDeclarationsx());
    $uses['namespaces'] =
      Dict\merge($uses['namespaces'], $inner_uses['namespaces']);
    $uses['types'] = Dict\merge($uses['types'], $inner_uses['types']);
  }

  return $uses;
}
