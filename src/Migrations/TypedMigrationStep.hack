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

final class TypedMigrationStep<Tin as Node, Tout as Node>
  implements IMigrationStep {

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
    $rewriter = $this->rewriter;
    return $rewriter(/* HH_FIXME[4110] need reified generics */ $node);
  }
}
