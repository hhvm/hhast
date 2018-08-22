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
  Asio\AsyncPoll,
  LintRunLSPPublishDiagnosticsEventHandler,
  LintRun,
};
use namespace Facebook\HHAST\__Private\{LSPImpl, LSPLib};
use type Facebook\CLILib\{ExitException, ITerminal};
use namespace HH\Lib\Str;

final class Server extends LSPLib\Server<ServerState> {
  public function __construct(private ITerminal $terminal) {
    parent::__construct(new LSPImpl\Client($terminal), new ServerState());
  }

  <<__Override>>
  protected function getSupportedServerCommands(): vec<LSPLib\ServerCommand> {
    return vec[
      new LSPImpl\InitializeCommand($this->state),
      new LSPLib\ShutdownCommand($this->state),
      new LSPImpl\CodeActionCommand($this->client, $this->state),
      new LSPImpl\ExecuteCommandCommand($this->client),
    ];
  }

  <<__Override>>
  protected function getSupportedClientNotifications(
  ): vec<LSPLib\ClientNotification> {
    return vec[
      new LSPImpl\DidChangeWatchedFilesNotification(
        $this->client,
        $this->state,
      ),
      new LSPImpl\DidChangeTextDocumentNotification($this->client, $this->state),
      new LSPImpl\DidSaveTextDocumentNotification($this->client, $this->state),
      new LSPImpl\DidOpenTextDocumentNotification($this->client, $this->state),
      new LSPImpl\DidCloseTextDocumentNotification($this->client, $this->state),
      new LSPImpl\ExitNotification($this->state),
      new LSPImpl\InitializedNotification($this->client, $this->state),
    ];
  }

  public async function mainAsync(): Awaitable<int> {
    try {
      await $this->mainLoopAsync();
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
    $poll = AsyncPoll::create();
    $poll->add($this->lintProjectAsync());
    $debug = (bool)\getenv('HHAST_LSP_DEBUG') ?? false;
    $verbose = $debug ? $this->terminal->getStderr() : null;
    $poll->add(
      async {
        while (!$stdin->isEof()) {
          $verbose?->write("< [waiting]\n");
          $body = await $this->readMessageAsync();
          $verbose?->write("> [dispatch]\n");
          $poll->add(async {
            $verbose?->write("> [start]\n");
            await $this->handleMessageAsync($body);
            $verbose?->write("> [done]\n");
          });
        }
      },
    );
    foreach ($poll await as $_) {
      // do nothing
    }
  }

  private async function lintProjectAsync(): Awaitable<void> {
    await $this->state->waitForInitAsync();
    if ($this->state->getStatus() !== LSPLib\ServerStatus::INITIALIZED) {
      return;
    }

    if ($this->state->lintMode !== LintMode::WHOLE_PROJECT) {
      return;
    }

    $handler =
      new LintRunLSPPublishDiagnosticsEventHandler($this->client, $this->state);
    await (
      new LintRun(
        $this->state->config,
        $handler,
        $this->state->config?->getRoots() ?? vec[],
      )
    )
      ->runAsync();
  }

  private async function readMessageAsync(): Awaitable<string> {
    return await read_message_async($this->terminal->getStdin());
  }
}
