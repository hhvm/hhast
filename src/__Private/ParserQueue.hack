/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private;

final class ParserQueue extends ConcurrentAsyncQueue {
  // Random number; it might seem high, but it's likely that `hh_parse` will
  // execute quick enough that most of the processes are waiting to be cleaned
  // up
  const int LIMIT = 32;

  <<__Memoize>>
  public static function get(): ConcurrentAsyncQueue {
    return new ConcurrentAsyncQueue(self::LIMIT);
  }
}
