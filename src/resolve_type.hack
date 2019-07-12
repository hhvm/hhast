/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use namespace HH\Lib\{C, Str, Vec};
use namespace Facebook\HHAST\__Private\Resolution;

function resolve_type(string $type, Script $root, Node $node): string {
  if (Str\starts_with($type, '\\')) {
    return Str\strip_prefix($type, '\\');
  }
  invariant(
    !Str\contains($type, '<'),
    'Call on the class name without generics',
  );

  $autoimports = keyset[
    'Awaitable',
    'ConstMap',
    'ConstSet',
    'ConstVector',
    'Container',
    'ImmMap',
    'ImmSet',
    'ImmVector',
    'KeyedContainer',
    'KeyedTraversable',
    'Map',
    'Set',
    'Traversable',
    'Vector',
  ];
  if (C\contains_key($autoimports, $type)) {
    return 'HH\\'.$type;
  }

  $ns = Resolution\get_current_namespace($root, $node);
  $uses = Resolution\get_current_uses($root, $node);

  if (Str\contains($type, '\\')) {
    $maybe_aliased = $type
      |> \explode("\\", $$)
      |> C\firstx($$);
    if (C\contains_key($uses['namespaces'], $maybe_aliased)) {
      return $type
        |> \explode('\\', $$)
        |> Vec\drop($$, 1)
        |> Str\join($$, '\\')
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
