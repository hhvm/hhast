<?hh // strict
/**
 * Copyright (c) 2016, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional
 * grant of patent rights can be found in the PATENTS file in the same
 * directory.
 *
 */

namespace Facebook\HHAST\Migrations;

use type Facebook\HHAST\EditableNode;

final class TypedMigrationStep<
  Tin as EditableNode,
  Tout as EditableNode
> implements IMigrationStep {

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

  public function rewrite(EditableNode $node): EditableNode {
    if (!$node instanceof $this->tin) {
      return $node;
    }
    $rewriter = $this->rewriter;
    return $rewriter($node);
  }
}
