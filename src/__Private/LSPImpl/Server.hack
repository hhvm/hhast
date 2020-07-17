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
  BufferedReader,
  LintRun,
  LintRunLSPPublishDiagnosticsEventHandler,
};
use namespace Facebook\HHAST\__Private\{LSPImpl, LSPLib};
use type Facebook\CLILib\{ExitException, ITerminal};
use namespace HH\Lib\{Async, Str};

final class Server extends LSPLib\Server<ServerState> {
  private BufferedReader $input;
  public function __construct(private ITerminal $terminal) {
    $this->input = new BufferedReader($terminal->getStdin());
    // The default behavior is to write to STDOUT; as we're talking JSON-RPC
    // on STDIN/OUT, we can't do that. We could directly write to STDERR,
    // but lets make all errors/notices/warnings etc go through the same
    // mechanism
    \set_error_handler(
      (int $severity, string $message, string $file, int $line): noreturn ==> {
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
      $message = Str\format(
        "Uncaught exception: %s:\n%s\n%s\n",
        \get_class($e),
        $e->getMessage(),
        $e->getTraceAsString(),
      );
      $previous = $e->getPrevious();
      if ($previous !== null) {
        $message .= Str\format(
          "Previous exception: %s:\n%s\n%s\n",
          \get_class($previous),
          $previous->getMessage(),
          $previous->getTraceAsString(),
        );
      }
      await $this->terminal
        ->getStderr()
        ->writeAllAsync($message);
      throw $e;
    }
    return 0;
  }

  private async function mainLoopAsync(): Awaitable<void> {
    $poll = Async\Poll::create();
    $poll->add($this->lintProjectAsync());
    $debug = (bool)\getenv('HHAST_LSP_DEBUG') ?? false;
    $verbose = $debug ? $this->terminal->getStderr() : null;
    $poll->add(
      async {
        while (!$this->input->isEndOfFile()) {
          /* HHAST_IGNORE_ERROR[DontAwaitInALoop] */
          await $verbose?->writeAllAsync("< [waiting]\n");
          /* HHAST_IGNORE_ERROR[DontAwaitInALoop] */
          $body = await $this->readMessageAsync();
          /* HHAST_IGNORE_ERROR[DontAwaitInALoop] */
          await $verbose?->writeAllAsync("> [dispatch]\n");
          $poll->add(async {
            await $verbose?->writeAllAsync("> [start]\n");
            await $this->handleMessageAsync($body);
            await $verbose?->writeAllAsync("> [done]\n");
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
    return await read_message_async($this->input);
  }
}
