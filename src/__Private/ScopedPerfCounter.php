<?hh // strict
/**
 * Copyright (c) 2017, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional
 * grant of patent rights can be found in the PATENTS file in the same
 * directory.
 *
 */

namespace Facebook\HHAST\__Private;

final class ScopedPerfCounter implements \IDisposable {
  private PerfCounter $counter;

  public function __construct(
    string $name,
  ) {
    $this->counter = new PerfCounter($name);
  }

  public function __dispose(): void {
    $this->counter->end();
  }
}
