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
  LintRun,
  LintRunLSPPublishDiagnosticsEventHandler,
};
use namespace Facebook\HHAST\__Private\{LSPImpl, LSPLib};
use type Facebook\CLILib\{ExitException, ITerminal};
use namespace HH\Lib\Str;
use namespace HH\Lib\Experimental\Async;

final class Server extends LSPLib\Server<ServerState> {
  public function __construct(private ITerminal $terminal) {
    // The default behavior is to write to STDOUT; as we're talking JSON-RPC
    // on STDIN/OUT, we can't do that. We could directly write to STDERR,
    // but lets make all errors/notices/warnings etc go through the same
    // mechanism
    \set_error_handler(
      function(int $severity, string $message, string $file, int $line): bool {
        throw new \ErrorException(
          $message, /* code = */
          0,
          $severity,
          $file,
          $line,
        );
      },
    );
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
      new LSPImpl\DidChangeTextDocumentNotification(
        $this->client,
        $this->state,
      ),
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
      await $this->terminal
        ->getStderr()
        ->writeAsync(
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
    $poll = Async\Poll::create();
    $poll->add($this->lintProjectAsync());
    $debug = (bool)\getenv('HHAST_LSP_DEBUG') ?? false;
    $verbose = $debug ? $this->terminal->getStderr() : null;
    $poll->add(
      async {
        while (!$stdin->isEndOfFile()) {
          /* HHAST_IGNORE_ERROR[DontAwaitInALoop] */
          await $verbose?->writeAsync("< [waiting]\n");
          /* HHAST_IGNORE_ERROR[DontAwaitInALoop] */
          $body = await $this->readMessageAsync();
          /* HHAST_IGNORE_ERROR[DontAwaitInALoop] */
          await $verbose?->writeAsync("> [dispatch]\n");
          $poll->add(async {
            await $verbose?->writeAsync("> [start]\n");
            await $this->handleMessageAsync($body);
            await $verbose?->writeAsync("> [done]\n");
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

    $handler = new LintRunLSPPublishDiagnosticsEventHandler(
      $this->client,
      $this->state,
    );
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
