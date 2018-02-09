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
  Script,
  __Private\PerfCounter
};
use namespace Facebook\TypeAssert;
use namespace HH\Lib\{C, Str, Vec};

function get_current_namespace(
  EditableNode $node,
  vec<EditableNode> $parents,
): ?string {
  $c = (new PerfCounter(__FUNCTION__))->endAtScopeExit();
  $parents = vec($parents);

  $namespaces = Vec\filter(
    $parents,
    $parent ==> $parent instanceof NamespaceDeclaration,
  );

  invariant(
    C\count($namespaces) <= 1,
    "Can't nest namespace blocks",
  );

  // No blocks, just a declaration;
  if (C\is_empty($namespaces)) {
    $c2 = (new PerfCounter(__FUNCTION__.'#declaration'))->endAtScopeExit();
    $root = $parents
      |> C\firstx($$)
      |> TypeAssert\instance_of(Script::class, $$);
    $ns = $root
      ->getDeclarations()
      ->getChildrenOfType(NamespaceDeclaration::class)
      |> C\first($$);
    if ($ns === null) {
      return null;
    }
    $body = $ns->getBody();
    if ($body instanceof NamespaceBody) {
      \var_dump($root->getCode());
    }
    invariant(
      $body->isMissing() || $body instanceof NamespaceEmptyBody,
      "if using namespace blocks, all code must be in a NS block - got %s",
      \get_class($body),
    );
    return $ns->getQualifiedNameAsString();
  }

  $c2 = (new PerfCounter(__FUNCTION__.'#blocks'))->endAtScopeExit();

  return $namespaces
    |> C\firstx($$)
    |> TypeAssert\instance_of(NamespaceDeclaration::class, $$)
    |> $$->getName()->getCode()
    |> Str\trim($$)
    |> Str\strip_prefix($$, '\\')
    |> $$ === '' ? null : $$;
}
