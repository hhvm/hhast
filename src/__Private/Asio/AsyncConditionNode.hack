/*
 *  Copyright (c) 2015-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private\Asio;

/**
 * A linked list node storing AsyncCondition and pointer to the next node.
 */
final class AsyncConditionNode<T> extends AsyncCondition<T> {
  private ?AsyncConditionNode<T> $next = null;

  public function addNext(): AsyncConditionNode<T> {
    invariant($this->next === null, 'The next node already exists');
    $this->next = new AsyncConditionNode();
    return $this->next;
  }
  public function getNext(): ?AsyncConditionNode<T> {
    return $this->next;
  }
}
