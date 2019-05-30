/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private\Wrap;

use type Facebook\HHAST\{Node, IExpression, INameishNode, NameExpression};

function wrap_IExpression(Node $node): IExpression {
  if ($node instanceof IExpression) {
    return $node;
  }

  if ($node instanceof INameishNode) {
    return new NameExpression($node);
  }

  invariant_violation('IExpression expected, got: %s', \get_class($node));
}
