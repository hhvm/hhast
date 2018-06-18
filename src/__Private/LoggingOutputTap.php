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

use type Facebook\CLILib\OutputInterface;
use namespace HH\Lib\Str;

final class LoggingOutputTap implements OutputInterface {
  public function __construct(
    private OutputInterface $impl,
    private resource $logfile,
  ) {
  }

  public function isEof(): bool {
    return $this->impl->isEof();
  }

  public function write(string $buf): int {
    $written = $this->impl->write($buf);
    \fwrite($this->logfile, $buf, $written);
    return $written;
  }
}
