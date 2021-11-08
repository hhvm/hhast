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
use namespace Facebook\HHAST\__Private\LSPLib;
use namespace HH\Lib\Str;

final class DidSaveTextDocumentNotification
  extends LSPLib\DidSaveTextDocumentNotification {

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

    await relint_uri_async(
      new LintRunLSPPublishDiagnosticsEventHandler($this->client, $this->state),
      $this->state->config,
      $uri,
    );
  }
}
