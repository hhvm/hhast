/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use type Facebook\HHAST\Node;
use type Facebook\HHAST\_Private\SoftDeprecated;

/* HHAST_IGNORE_ALL[5639] */
final class TypedMigrationStep<Tin as Node, Tout as Node>
  implements IMigrationStep {

  <<SoftDeprecated(NodeTypeMigrationStep::class)>>
  public function __construct(
    private string $name,
    private classname<Tin> $tin,
    classname<Tout> $_tout,
    private (function(Tin): Tout) $rewriter,
  ) {
  }

  public function getName(): string {
    return $this->name;
  }

  public function rewrite(Node $node): Node {
    if (!\is_a($node, $this->tin)) {
      return $node;
    }
    $node = \HH\FIXME\UNSAFE_CAST<Node, Tin>(
      $node,
      'is_a($node, $this->tin) ~= $node is Tin',
    );
    $rewriter = $this->rewriter;
    return $rewriter($node);
  }
}
