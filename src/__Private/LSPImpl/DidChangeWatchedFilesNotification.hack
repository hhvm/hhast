/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private\LSPImpl;

use type Facebook\HHAST\__Private\LintRunLSPPublishDiagnosticsEventHandler;
use namespace Facebook\HHAST\__Private\{LSP, LSPLib};
use namespace HH\Lib\{C, Str, Vec};

final class DidChangeWatchedFilesNotification
  extends LSPLib\DidChangeWatchedFilesNotification {

  public function __construct(
    private LSPLib\Client $client,
    private ServerState $state,
  ) {
  }

  <<__Override>>
  public async function executeAsync(self::TParams $p): Awaitable<void> {
    $changes_to_file_uris = (vec<LSP\FileEvent> $events) ==> $events
      |> Vec\map($$, $e ==> $e['uri'])
      |> Vec\filter($$, $uri ==> Str\starts_with($uri, 'file://'));

    $to_purge = $p['changes']
      |> Vec\filter(
        $$,
        $change ==> $change['type'] === LSP\FileChangeType::DELETED,
      )
      |> $changes_to_file_uris($$);

    await Vec\map_async(
      $to_purge,
      async $uri ==> await $this->client
        ->sendNotificationMessageAsync(
          (
            new LSPLib\PublishDiagnosticsNotification(shape(
              'uri' => $uri,
              'diagnostics' => vec[],
            ))
          )->asMessage(),
        ),
    );

    $to_relint = $p['changes']
      |> Vec\filter(
        $$,
        $change ==> $change['type'] !== LSP\FileChangeType::DELETED,
      )
      |> $changes_to_file_uris($$);

    if ($this->state->lintMode === LintMode::OPEN_FILES) {
      $to_relint = Vec\filter(
        $to_relint,
        $uri ==> C\contains($this->state->openFiles, $uri),
      );
    }

    await relint_uris_async(
      new LintRunLSPPublishDiagnosticsEventHandler($this->client, $this->state),
      $this->state->config,
      $to_relint,
    );
  }
}
