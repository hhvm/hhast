/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private\Wrap;

use type Facebook\HHAST\{IExpression, INameishNode, NameExpression, Node};
use namespace HH\Lib\{C, Str};

function wrap_IExpression(Node $node): IExpression {
  if ($node is IExpression) {
    return $node;
  }

  if ($node is INameishNode) {
    return new NameExpression($node);
  }

  $loc = \Facebook\HHAST\__Private\NodeImplementationDetails::getSourceRef(
    $node,
  );
  $line = null;
  $col = null;
  if ($loc !== null) {
    $source = $loc['source'];
    $prefix = Str\slice($source, 0, $loc['offset']);
    $lines = Str\split($prefix, "\n");
    $line = C\count($lines);
    $col = Str\length(C\lastx($lines));
  }

  invariant_violation(
    'IExpression expected, got %s at %s:%d:%d',
    \get_class($node),
    $loc['file'] ?? 'unknown',
    $line,
    $col,
  );
}
