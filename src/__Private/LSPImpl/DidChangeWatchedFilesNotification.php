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
    $uris = $p['changes']
      |> Vec\filter(
        $$,
        $change ==> $change['type'] !== LSP\FileChangeType::DELETED,
      )
      |> Vec\map($$, $change ==> $change['uri'])
      |> Vec\filter($$, $uri ==> Str\starts_with($uri, 'file://'));
    relint_uris($this->client, $this->config, $uris);
  }
}
