/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private;

use type Facebook\CLILib\CLIBase;
use namespace Facebook\CLILib\CLIOptions;

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
    print(\vsprintf($format, $args));
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
