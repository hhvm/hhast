<?hh // strict
/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */


namespace Facebook\HHAST;

use function Facebook\FBExpect\expect;
use namespace Facebook\HHAST\__Private\LSP;
use namespace HH\Lib\Str;

final class LSPServerTest extends TestCase {
  use LinterCLITestTrait;

  public function testImmediateExit(): void {
    list($cli, $in, $out, $err) = $this->getCLI('--mode', 'lsp');

    shape(
      'jsonrpc' => '2.0',
      'method' => 'exit',
      'params' => shape(),
    )
    |> $this->messageToRPC($$)
    |> $in->appendToBuffer($$);

    $in->close();

    $exit_code = \HH\Asio\join($cli->mainAsync());
    expect($exit_code)->toBeSame(1);
    expect($err->getBuffer())->toBeSame('');
  }

  public function testExitAfterShutdown(): void {
    list($cli, $in, $out, $err) = $this->getCLI('--mode', 'lsp');

    shape(
      'jsonrpc' => '2.0',
      'id' => __LINE__,
      'method' => 'shutdown',
      'params' => shape(),
    )
    |> $this->messageToRPC($$)
    |> $in->appendToBuffer($$);

    shape(
      'jsonrpc' => '2.0',
      'method' => 'exit',
      'params' => shape(),
    )
    |> $this->messageToRPC($$)
    |> $in->appendToBuffer($$);

    $in->close();

    $exit_code = \HH\Asio\join($cli->mainAsync());
    expect($exit_code)->toBeSame(0);
    expect($err->getBuffer())->toBeSame('');
  }

  private function messageToRPC(LSP\Message $data): string {
    $json = \json_encode($data);
    return Str\format("Content-Length: %d\r\n\r\n%s", Str\length($json), $json);
  }
}
