/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private;

use namespace HH\Lib\{C, Dict};
use type Facebook\HHAST\File;

abstract class InMemoryFileKeyedCache {
  abstract const type TResult;
  abstract const int COMPLETE_LIMIT;
  private dict<string, Awaitable<this::TResult>> $inFlight = dict[];
  private dict<string, int> $refCount = dict[];
  private dict<string, Awaitable<this::TResult>> $complete = dict[];

  abstract protected function fetchUncachedAsync(
    File $file,
  ): Awaitable<this::TResult>;

  final public function fetchAsync(File $file): Awaitable<this::TResult> {
    $hash = $file->getHash();
    if (C\contains_key($this->complete, $hash)) {
      return $this->complete[$hash];
    }
    $this->refCount[$hash] ??= 0;
    $this->refCount[$hash]++;
    $this->inFlight[$hash] ??= $this->fetchUncachedAsync($file);
    return async {
      try {
        return await $this->inFlight[$hash];
      } finally {
        $this->refCount[$hash]--;
        if ($this->refCount[$hash] === 0) {
          $this->complete[$hash] = $this->inFlight[$hash];
          unset($this->refCount[$hash]);
          unset($this->inFlight[$hash]);
          $count = C\count($this->complete);
          if ($count > static::COMPLETE_LIMIT) {
            $this->complete = Dict\drop(
              $this->complete,
              $count - static::COMPLETE_LIMIT,
            );
          }
        }
      }
    };
  }
}
