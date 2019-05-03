/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private;

use namespace HH\Lib\{C, Vec};

class ConcurrentAsyncQueue {
  public function __construct(private int $limit) {
  }

  private int $active = 0;
  private vec<Awaitable<void>> $queue = vec[];

  final public function getCurrentConcurrency(): int {
    return $this->active;
  }

  final public async function enqueueAndWaitForAsync<T>(
    (function(): Awaitable<T>) $next,
  ): Awaitable<T> {
    if ($this->active < $this->limit) {
      $awaitable = async {
        $this->active++;
        $ret = await $next();
        $this->active--;
        return $ret;
      };
    } else {
      $head = C\firstx($this->queue);
      $this->queue = Vec\drop($this->queue, 1);
      $awaitable = async {
        await $head;
        $this->active++;
        $ret = await $next();
        $this->active--;
        return $ret;
      };
    }
    $this->queue[] = async {
      await $awaitable;
    };
    return await $awaitable;
  }
}
