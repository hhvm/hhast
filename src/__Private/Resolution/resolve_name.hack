/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private\Resolution;

use namespace HH\Lib\{C, Str, Vec};
use type Facebook\HHAST\{NamespaceUseClause, Node, Script};

function resolve_name(
  string $name,
  Script $root,
  Node $node,
  dict<string, shape('name' => string, 'use_clause' => ?NamespaceUseClause)> $used_namespaces,
): shape('name' => string, 'use_clause' => ?NamespaceUseClause) {
  if (Str\starts_with($name, '\\')) {
    return shape('name' => Str\strip_prefix($name, '\\'), 'use_clause' => null);
  }
  invariant(
    !Str\contains($name, '<'),
    'Call on the class name without generics',
  );

  $ns = get_current_namespace($root, $node);

  if (Str\contains($name, '\\')) {
    $maybe_aliased = $name
      |> Str\split($$, '\\')
      |> C\firstx($$);
    if (C\contains_key($used_namespaces, $maybe_aliased)) {
      $ns = $used_namespaces[$maybe_aliased];
      return $name
        |> Str\split($$, '\\')
        |> Vec\drop($$, 1)
        |> Str\join($$, '\\')
        |> $ns['name'].'\\'.$$
        |> shape('name' => $$, 'use_clause' => $ns['use_clause']);
    }

    if ($ns !== null) {
      return shape('name' => $ns.'\\'.$name, 'use_clause' => null);
    }
    return shape('name' => $name, 'use_clause' => null);
  }

  if ($ns !== null) {
    return shape('name' => $ns.'\\'.$name, 'use_clause' => null);
  }

  return shape('name' => $name, 'use_clause' => null);
}
