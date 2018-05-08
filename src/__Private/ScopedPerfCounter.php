<?hh // strict
/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
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
