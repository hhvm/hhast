/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use namespace HH\Lib\{C, Vec};

final class Script extends ScriptGeneratedBase {
  final public function getAncestorsOfDescendant(
    EditableNode $node,
  ): vec<EditableNode> {
    if ($node == $this) {
      return vec[];
    }

    invariant($this->isAncestorOf($node), "Node is not a descendant");
    $stack = vec[$this];
    $children = $this->getChildren();
    while ($children) {
      $child = C\firstx($children);
      $children = Vec\drop($children, 1);
      if ($child === $node) {
        return $stack;
      }
      if (!$child->isAncestorOf($node)) {
        continue;
      }
      $stack[] = $child;
      $children = $child->getChildren();
    }
    invariant_violation('unreachable');
  }
}
