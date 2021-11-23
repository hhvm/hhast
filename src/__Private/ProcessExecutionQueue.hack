/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private;

use namespace HH\Lib\Async;

final class ProcessExecutionQueue {

  <<__Memoize>>
  private function impl(): Async\Semaphore<vec<string>, vec<string>> {
    return new Async\Semaphore(
      $this->limit,
      async (vec<string> $args) ==>
        await execute_async($this->process_name, ...$args),
    );
  }

  public function __construct(
    private int $limit,
    private string $process_name,
  )[] {
  }

  public async function waitForAsync(
    vec<string> $args,
  ): Awaitable<vec<string>> {
    return await $this->impl()->waitForAsync($args);
  }
}
