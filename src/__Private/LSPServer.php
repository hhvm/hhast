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

use type Facebook\CLILib\{ITerminal, Terminal};
use namespace HH\Lib\{Tuple, Str};

final class LSPServer extends LSPLib\Server {
  const keyset<classname<LSPLib\Command>>
    COMMANDS = keyset[
      LSPImpl\InitializeCommand::class,
    ];
  private ITerminal $terminal;

  public function __construct(
    ITerminal $terminal,
    private ?LintRunConfig $config,
    private vec<string> $roots,
  ) {
    $this->terminal = new Terminal(
      new LoggingInputTap(
        $terminal->getStdin(),
        \fopen('/tmp/lsp_in', 'r+'),
      ),
      new LoggingOutputTap(
        $terminal->getStdout(),
        \fopen('/tmp/lsp_out', 'r+'),
      ),
      new LoggingOutputTap(
        $terminal->getStderr(),
        \fopen('/tmp/lsp_err', 'r+'),
      )
    );
    parent::__construct();
  }

  public async function mainAsync(): Awaitable<int> {
    try {
      await Tuple\from_async(
        async {
          await $this->mainLoopAsync();
        },
        async {
          await $this->initAsync();
        },
      );
    } catch (\Throwable $e) {
      $this->terminal
        ->getStderr()
        ->write(
          Str\format(
            "Uncaught exception: %s:\n%s\n%s\n",
            \get_class($e),
            $e->getMessage(),
            $e->getTraceAsString(),
          ),
        );
      throw $e;
    }
    return 0;
  }

  private async function mainLoopAsync(): Awaitable<void> {
    $stdin = $this->terminal->getStdin();
    while (!$stdin->isEof()) {
      await $this->handleOneAsync();
    }
  }

  private async function initAsync(): Awaitable<void> {
    await $this->waitForInitAsync();
    (
      new LintRun(
        $this->config,
        new LintRunLSPErrorHandler($this->terminal),
        $this->roots,
      )
    )->run();
  }

  private async function handleOneAsync(): Awaitable<void> {
    $stdin = $this->terminal->getStdin();
    $length = null;

    // read headers
    while (true) {
      $line = await $stdin->readLineAsync();
      $line = Str\trim($line);
      if ($line === '') {
        break;
      }
      if (!Str\starts_with($line, 'Content-Length')) {
        continue;
      }
      $length = $line
        |> Str\strip_prefix($$, 'Content-Length:')
        |> Str\trim($$)
        |> Str\to_int($$);
    }
    invariant($length !== null, "Expected a content-length header");

    // read body
    $body = '';
    while ($length > 0 && !$stdin->isEof()) {
      $part = await $stdin->readAsync($length);
      $body .= $part;
      $length -= Str\length($part);
      invariant($length >= 0, 'negative bytes remaining');
    }

    await $this->handleMessageAsync($body);
  }

  protected function sendMessage(LSP\Message $message): void {
    $json = \json_encode($message);
    $this->terminal->getStderr()->write("Sending JSON: ".$json."\n");
    $this->terminal
      ->getStdout()
      ->write(Str\format(
        "Content-Length: %d\r\n\r\n%s",
        Str\length($json),
        $json,
      ));
  }
}
