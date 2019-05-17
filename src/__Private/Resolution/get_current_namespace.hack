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
  Script,
};
use namespace HH\Lib\C;

function get_current_namespace(
  Script $root,
  EditableNode $node,
): ?string {
  $namespaces = $root->getNamespaces();
  if (C\is_empty($namespaces)) {
    return null;
  }
  if ($namespaces[0]['statement']) {
    return $namespaces[0]['decl']->getQualifiedNameAsString();
  }

  foreach ($namespaces as $ns) {
    $ns = $ns['decl'];
    if ($ns->isAncestorOf($node)) {
      return $ns->getQualifiedNameAsString();
    }
  }
  return null;
}
