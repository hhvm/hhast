/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private\LSPImpl;

use namespace Facebook\HHAST\__Private\{LSP, LSPLib};
use type Facebook\CLILib\ITerminal;
use namespace HH\Lib\Str;

final class Client extends LSPLib\Client {
  private ?Awaitable<void> $pendingStdout;

  public function __construct(private ITerminal $terminal) {}

  /** This is intentionally not an async function; it stores/directly creates
   * waithandles to preserve ordering */
  <<__Override>>
  protected function sendMessageAsync(LSP\Message $message): Awaitable<void> {
    $json = \json_encode($message, \JSON_UNESCAPED_SLASHES);

    $tail = $this->pendingStdout;
    $next = async {
      await $tail;
      await $this->terminal
        ->getStdout()
        ->writeAllAsync(
          Str\format("Content-Length: %d\r\n\r\n%s", Str\length($json), $json),
        );
    };
    $this->pendingStdout = $next;
    return $next;
  }
}
