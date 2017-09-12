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

use type Facebook\HHAST\EditableSyntax;
use type Facebook\TypeAssert\TypeAssert;
use namespace HH\Lib\{C, Str, Vec};

function resolve_type(
  string $type,
  EditableSyntax $node,
  vec<EditableSyntax> $parents,
): ?string {
  if (Str\starts_with($type, '\\')) {
    return Str\strip_prefix($type, '\\');
  }

  $ns = get_current_namespace($node, $parents);
  $uses = get_current_uses($node, $parents);

  if (Str\contains($type, '\\')) {
    $maybe_aliased = $type
      |> explode("\\", $$)
      |> C\firstx($$);
    if (C\contains_key($uses['namespaces'], $maybe_aliased)) {
      return $type
        |> explode('\\', $$)
        |> Vec\drop($$, 1)
        |> implode('\\', $$)
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
