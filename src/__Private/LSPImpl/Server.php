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

use type Facebook\HHAST\__Private\{
  LintRunConfig,
  LintRunLSPEventHandler,
  LintRun,
};
use namespace Facebook\HHAST\__Private\{LSP, LSPImpl, LSPLib};
use type Facebook\CLILib\{ExitException, ITerminal, Terminal};
use namespace HH\Lib\{Str, Tuple, Vec};

final class Server extends LSPLib\Server<LSPLib\ServerState> {
  public function __construct(
    private ITerminal $terminal,
    private ?LintRunConfig $config,
    private vec<string> $roots,
  ) {
    parent::__construct(
      new LSPImpl\Client($terminal),
      new LSPLib\ServerState(),
    );
  }

  <<__Override>>
  protected function getSupportedServerCommands(): vec<LSPLib\ServerCommand> {
    return vec[
      new LSPImpl\InitializeCommand($this->state),
      new LSPLib\ShutdownCommand($this->state),
    ];
  }

  <<__Override>>
  protected function getSupportedClientNotifications(
  ): vec<LSPLib\ClientNotification> {
    return vec[
      new LSPImpl\DidChangeWatchedFilesNotification(
        $this->client,
        $this->config,
      ),
      new LSPImpl\DidSaveTextDocumentNotification($this->client, $this->config),
      new LSPImpl\ExitNotification($this->state),
      new LSPImpl\InitializedNotification($this->client, $this->state),
    ];
  }

  public async function mainAsync(): Awaitable<int> {
    try {
      await Tuple\from_async(
        $this->mainLoopAsync(),
        $this->initAsync(),
      );
    } catch (ExitException $e) {
      return $e->getCode();
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
    $id = 0;
    $in_progress = Map {};

    while (!$stdin->isEof()) {
      /* HHAST_IGNORE_ERROR[DontAwaitInALoop] */
      $message = await $this->readMessageAsync();

      $this_id = $id++;
      $in_progress[$this_id] = async {
        await $this->handleMessageAsync($message);
        $in_progress->removeKey($this_id);
      };
    }

    await Vec\from_async(vec($in_progress));
  }

  private async function initAsync(): Awaitable<void> {
    await $this->state->waitForInitAsync();
    if ($this->state->getStatus() !== LSPLib\ServerStatus::INITIALIZED) {
      return;
    }

    $handler = new LintRunLSPEventHandler($this->client);
    await (new LintRun($this->config, $handler, $this->roots))->runAsync();
  }

  private async function readMessageAsync(): Awaitable<string> {
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

    return $body;
  }
}
