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

use type Facebook\HHAST\__Private\LintRun;
use namespace Facebook\HHAST\__Private\{LSP, LSPLib};
use namespace HH\Lib\Str;

final class DidCloseTextDocumentNotification
  extends LSPLib\DidCloseTextDocumentNotification {

  public function __construct(
    private LSPLib\Client $client,
    private ServerState $state,
  ) {
  }

  <<__Override>>
  public async function executeAsync(self::TParams $p): Awaitable<void> {
    $uri = $p['textDocument']['uri'];
    if (!Str\starts_with($uri, 'file://')) {
      return;
    }

    unset($this->state->openFiles[$uri]);

    if ($this->state->lintMode !== LintMode::OPEN_FILES) {
      return;
    }

    (
      new LSPLib\PublishDiagnosticsNotification(shape(
        'uri' => $uri,
        'diagnostics' => vec[],
      ))
    )->asMessage()
      |> $this->client->sendNotificationMessage($$);
  }
}
