/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private\Resolution;

use namespace Facebook\HHAST;

/**
 * Returns the names of all generic type parameters declared on ancestors
 * (classes, functions, type declarations, etc.) of the given Node.
 */
function get_current_generics(
  HHAST\Script $root,
  HHAST\Node $node,
): keyset<string> {
  $ret = keyset[];
  foreach (
    $root->getNodesWithGenerics() as list($node_with_generics, $generics)
  ) {
    if ($node_with_generics->isAncestorOf($node)) {
      foreach ($generics->getParameters()->getChildrenOfItems() as $generic) {
        $ret[] = $generic->getName()->getText();
      }
    }
  }
  return $ret;
}
