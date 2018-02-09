<?hh // strict
/**
 * Copyright (c) 2017, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the "hack" directory of this source tree. An additional
 * grant of patent rights can be found in the PATENTS file in the same
 * directory.
 */

namespace Facebook\HHAST\__Private;

trait CLIWithVerbosityTrait {
  require extends CLIBase;

  protected int $verbosity = 0;

  protected function verbosePrintf(
    int $level,
    \HH\FormatString<\PlainSprintf> $format,
    mixed ...$args
  ): void {
    if ($this->verbosity < $level) {
      return;
    }
    print (\vsprintf($format, $args));
  }

  protected function getVerbosityOption(): CLIOptions\CLIOption {
    return CLIOptions\flag(
      () ==> {
        $this->verbosity++;
      },
      'Increase output verbosity',
      '--verbose',
      '-v',
    );
  }
}
