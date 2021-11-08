/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private\Resolution;

use type Facebook\HHAST\{Node, Script};

function get_current_uses(
  Script $root,
  Node $node,
): shape(
  'namespaces' => dict<string, Script::TAliasedNamespace>,
  'types' => dict<string, Script::TAliasedNamespace>,
  'functions' => dict<string, Script::TAliasedNamespace>,
) {
  foreach ($root->getNamespaces() as $ns) {
    if ($ns['children']->isAncestorOf($node)) {
      return $ns['uses'];
    }
  }

  // We should only get here if $node is inside a namespace declaration header.
  return shape(
    'namespaces' => dict[],
    'types' => dict[],
    'functions' => dict[],
  );
}
