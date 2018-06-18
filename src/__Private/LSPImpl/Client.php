<?hh // strict
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
  public function __construct(private ITerminal $terminal) {}

  <<__Override>>
  protected function sendMessage(LSP\Message $message): void {
    $json = \json_encode($message);
    $this->terminal
      ->getStdout()
      ->write(
        Str\format("Content-Length: %d\r\n\r\n%s", Str\length($json), $json),
      );
  }
}
