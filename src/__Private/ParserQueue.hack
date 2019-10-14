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


final class ParserQueue {
  private Async\Semaphore<vec<string>, vec<string>> $impl;
  protected function __construct() {
    $this->impl = new Async\Semaphore(
      self::LIMIT,
      async (vec<string> $args) ==> await execute_async('hh_parse', ...$args),
    );
  }

  // Random number; it might seem high, but it's likely that `hh_parse` will
  // execute quick enough that most of the processes are waiting to be cleaned
  // up
  const int LIMIT = 32;

  <<__Memoize>>
  public static function get(): ParserQueue {
    return new ParserQueue();
  }

  public async function waitForAsync(
    vec<string> $args,
  ): Awaitable<vec<string>> {
    return await $this->impl->waitForAsync($args);
  }
}
