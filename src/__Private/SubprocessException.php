<?hh //strict
/**
 * Copyright (c) 2016, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the "hack" directory of this source tree. An additional
 * grant of patent rights can be found in the PATENTS file in the same
 * directory.
 *
 */

namespace Facebook\HHAST\__Private;

final class SubprocessException extends \Exception {
  public function __construct(vec<string> $command, private int $exitCode) {
    parent::__construct(
      \sprintf(
        'Command "%s" failed with exit code %d',
        \implode(' ', $command),
        $exitCode,
      ),
    );
  }

  public function getExitCode(): int {
    return $this->exitCode;
  }
}
