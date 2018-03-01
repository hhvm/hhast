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

namespace Facebook\HHAST;

use type Facebook\HHAST\EditableNode;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\{C, Str, Vec};
use namespace Facebook\HHAST\__Private\Resolution;

function resolve_type(
  string $type,
  EditableNode $node,
  vec<EditableNode> $parents,
): ?string {
  if (Str\starts_with($type, '\\')) {
    return Str\strip_prefix($type, '\\');
  }
  invariant(
    !Str\contains($type, '<'),
    'Call on the class name without generics',
  );

  $ns = Resolution\get_current_namespace($node, $parents);
  $uses = Resolution\get_current_uses($node, $parents);

  if (Str\contains($type, '\\')) {
    $maybe_aliased = $type
      |> \explode("\\", $$)
      |> C\firstx($$);
    if (C\contains_key($uses['namespaces'], $maybe_aliased)) {
      return $type
        |> \explode('\\', $$)
        |> Vec\drop($$, 1)
        |> \implode('\\', $$)
        |> $uses['namespaces'][$maybe_aliased].'\\'.$$;
    }

    if ($ns !== null) {
      return $ns.'\\'.$type;
    }
    return $type;
  }

  if (C\contains_key($uses['types'], $type)) {
    return $uses['types'][$type];
  }

  if ($ns !== null) {
    return $ns.'\\'.$type;
  }

  return $type;
}
