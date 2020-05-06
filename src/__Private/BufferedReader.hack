/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private;

use namespace HH\Lib\{IO, OS, Str};

/** Temporary: this should be replaced by somethign in HSL IO */
final class BufferedReader {
  public function __construct(private IO\ReadHandle $handle) {
  }

  public function getHandle(): IO\ReadHandle {
    return $this->handle;
  }

  private bool $eof = false;
  private string $buffer = '';


  public async function readLineAsync(): Awaitable<string> {
    $buf = $this->buffer;
    $idx = Str\search($buf, "\n");
    if ($idx !== null) {
      $this->buffer = Str\slice($buf, $idx + 1);
      return Str\slice($buf, 0, $idx);
    }

    $chunk = '';
    do {
      /* HHAST_IGNORE_ERROR[DontAwaitInALoop] */
      $chunk = await $this->handle->readAsync();
      if ($chunk === '') {
        $this->buffer = $buf;
        $this->eof = true;
        throw new OS\BrokenPipeException(
          OS\Errno::EPIPE,
          'Reached end of file before newline',
        );
      }
      $buf .= $chunk;
    } while (!Str\contains($chunk, "\n"));

    $idx = Str\search($buf, "\n");
    invariant($idx !== null, 'Should not have exited loop without newline');
    $this->buffer = Str\slice($buf, $idx + 1);
    return Str\slice($buf, 0, $idx);
  }

  public async function readFixedSizeAsync(int $size): Awaitable<string> {
    $buf = $this->buffer;
    while (Str\length($buf) < $size) {
      /* HHAST_IGNORE_ERROR[DontAwaitInALoop] */
      $chunk = await $this->handle->readAsync($size - Str\length($buf));
      if ($chunk === '') {
        $this->buffer = $buf;
        $this->eof = true;
        throw new OS\BrokenPipeException(
          OS\Errno::EPIPE,
          'Reached end of file before requested size',
        );
      }
      $buf .= $chunk;
    }
    $this->buffer = Str\slice($buf, $size);
    return Str\slice($buf, 0, $size);
  }

  public function isEndOfFile(): bool {
    return $this->eof;
  }
}
