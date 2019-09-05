/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use namespace HH\Lib\C;
use namespace Facebook\HHAST\__Private\Resolution;

enum ResolvedTypeKind: string {
  GENERIC_PARAMETER = 'generic_parameter';
  QUALIFIED_TYPE = 'qualified_type';
}

function resolve_type(
  string $type,
  Script $root,
  Node $node,
): shape('kind' => ResolvedTypeKind, 'name' => string) {
  $uses = Resolution\get_current_uses($root, $node);

  if (C\contains_key(Resolution\get_current_generics($root, $node), $type)) {
    // Generic type names don't belong to a namespace, nothing to resolve.
    return shape(
      'kind' => ResolvedTypeKind::GENERIC_PARAMETER,
      'name' => $type,
    );
  }

  if (C\contains_key($uses['types'], $type)) {
    return shape(
      'kind' => ResolvedTypeKind::QUALIFIED_TYPE,
      'name' => $uses['types'][$type],
    );
  }

  return shape(
    'kind' => ResolvedTypeKind::QUALIFIED_TYPE,
    'name' => Resolution\resolve_name($type, $root, $node, $uses['namespaces']),
  );
}
