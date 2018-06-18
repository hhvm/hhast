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

use type Facebook\CLILib\InputInterface;
use namespace HH\Lib\Str;

final class LoggingInputTap implements InputInterface {
  public function __construct(
    private InputInterface $impl,
    private resource $logfile,
  ) {
  }

  public function isEof(): bool {
    return $this->impl->isEof();
  }

  public async function readAsync(?int $max_bytes = null): Awaitable<string> {
    $result = await $this->impl->readAsync($max_bytes);
    \fwrite($this->logfile, $result);
    return $result;
  }

  public async function readLineAsync(
    ?int $max_bytes = null,
  ): Awaitable<string> {
    $result = await $this->impl->readLineAsync($max_bytes);
    \fwrite($this->logfile, $result);
    return $result;
  }
}
