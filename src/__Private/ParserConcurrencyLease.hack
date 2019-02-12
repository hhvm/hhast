/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private;

use namespace HH\Lib\Tuple;

final class ParserConcurrencyLease implements \IDisposable {
  const int LIMIT = 16; // Random number

  private static int $active = 0;

  private function __construct() {
    self::$active++;
  }

  <<__ReturnDisposable>>
  public static async function getAsync(): Awaitable<ParserConcurrencyLease> {
    while (self::$active >= self::LIMIT) {
      /* HHAST_IGNORE_ERROR[DontAwaitInALoop] */
      await Tuple\from_async(
        \HH\Asio\usleep(100000), // 10ms - avoid busy loop
        \HH\Asio\later(), // make sure we actually execute pending stuff
      );
    }
    return new self();
  }

  public function __dispose(): void {
    self::$active--;
  }
}
