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
use namespace HH\Lib\{Str, Tuple, Vec};

final class LSPServer extends LSPLib\Server {
  public function __construct(
    private ITerminal $terminal,
    private ?LintRunConfig $config,
    private vec<string> $roots,
  ) {
    parent::__construct();
  }

  <<__Override>>
  protected function getSupportedCommands(): vec<LSPLib\Command> {
    return vec[
      new LSPImpl\InitializeCommand(),
    ];
  }

  <<__Override>>
  protected function getSupportedClientNotifications(
  ): vec<LSPLib\ClientNotification> {
    $new = vec[
      new LSPImpl\DidSaveTextDocumentNotification(
        $this->terminal,
        $this->config,
      ),
    ];
    return Vec\concat(parent::getSupportedClientNotifications(), $new);
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
      /* HHAST_IGNORE_ERROR[DontAwaitInALoop] */
      await $this->handleOneAsync();
    }
  }

  private async function initAsync(): Awaitable<void> {
    await $this->waitForInitAsync();
    $handler = new LintRunLSPErrorHandler($this->terminal);
    (new LintRun($this->config, $handler, $this->roots))->run();
    $handler->printFinalOutput();
  }

  private async function handleOneAsync(): Awaitable<void> {
    $stdin = $this->terminal->getStdin();
    $length = null;

    // read headers
    while (true) {
      /* HHAST_IGNORE_ERROR[DontAwaitInALoop] */
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
      /* HHAST_IGNORE_ERROR[DontAwaitInALoop] */
      $part = await $stdin->readAsync($length);
      $body .= $part;
      $length -= Str\length($part);
      invariant($length >= 0, 'negative bytes remaining');
    }

    await $this->handleMessageAsync($body);
  }

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
