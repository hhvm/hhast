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
  LintRun,
  LintRunConfig,
  LintRunLSPErrorHandler,
};
use type Facebook\CLILib\ITerminal;
use namespace Facebook\HHAST\__Private\{LSP, LSPLib};
use namespace HH\Lib\{Str, Vec};

final class DidChangeWatchedFilesNotification
  extends LSPLib\DidChangeWatchedFilesNotification {

  public function __construct(
    private LSPLib\Client $client,
    private ?LintRunConfig $config,
  ) {
  }

  <<__Override>>
  public async function executeAsync(self::TParams $p): Awaitable<void> {
    $changes_to_file_uris = (vec<LSP\FileEvent> $events) ==> $events
      |> Vec\map($$, $e ==> $e['uri'])
      |> Vec\filter($$, $uri ==> Str\starts_with($uri, 'file://'));

    $to_relint = $p['changes']
      |> Vec\filter(
        $$,
        $change ==> $change['type'] !== LSP\FileChangeType::DELETED,
      )
      |> $changes_to_file_uris($$);

    await relint_uris_async($this->client, $this->config, $to_relint);

    $to_purge = $p['changes']
      |> Vec\filter(
        $$,
        $change ==> $change['type'] === LSP\FileChangeType::DELETED,
      )
      |> $changes_to_file_uris($$);

    foreach ($to_purge as $uri) {
      (new LSPLib\PublishDiagnosticsNotification(shape(
        'uri' => $uri,
        'diagnostics' => vec[],
      )))->asMessage() |> $this->client->sendNotificationMessage($$);
    }
  }
}
