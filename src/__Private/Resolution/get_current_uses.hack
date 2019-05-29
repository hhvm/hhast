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
  Node,
  Script,
};

function get_current_uses(
  Script $root,
  Node $node,
): shape(
  'namespaces' => dict<string, string>,
  'types' => dict<string, string>,
) {
  $namespaces = $root->getNamespaces();
  if (!$namespaces) {
    return get_uses_directly_in_scope($root->getDeclarations());
  }
  if ($namespaces[0]['statement']) {
    return $namespaces[0]['uses'];
  }

  foreach ($namespaces as $ns) {
    if ($ns['decl']->isAncestorOf($node)) {
      return $ns['uses'];
    }
  }

  return shape('namespaces' => dict[], 'types' => dict[]);
}
