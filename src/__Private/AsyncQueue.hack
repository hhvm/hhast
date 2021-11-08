/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private;

class AsyncQueue {
  private ?Awaitable<mixed> $queue;

  public async function enqueueAndWaitForAsync<T>(
    (function(): Awaitable<T>) $item,
  ): Awaitable<T> {
    $prev = $this->queue;
    $next = async {
      await $prev;
      return await $item();
    };
    $this->queue = $next;
    return await $next;
  }
}
