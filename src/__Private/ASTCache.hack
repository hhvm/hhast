/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private;

use type Facebook\HHAST\{File, Script};

final class ASTCache extends InMemoryFileKeyedCache {
  const type TResult = Script;
  const int COMPLETE_LIMIT = 10;

  <<__Memoize>>
  public static function get(): ASTCache {
    return new self();
  }

  <<__Override>>
  protected function fetchUncachedAsync(File $file): Awaitable<Script> {
    return \Facebook\HHAST\from_file_async($file);
  }
}
