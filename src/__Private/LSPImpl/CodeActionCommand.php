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
  LintRunLSPCodeActionEventHandler,
};
use namespace Facebook\HHAST\__Private\{LSP, LSPLib};
use namespace HH\Lib\Str;

final class CodeActionCommand extends LSPLib\CodeActionCommand {
  const type TResponse = vec<LSP\CodeAction>;

  public function __construct(
    private LSPLib\Client $client,
    private ?LintRunConfig $config,
  ) {
  }

  <<__Override>>
  public async function executeAsync(
    self::TParams $p,
  ): Awaitable<this::TExecuteResult> {
    $uri = $p['textDocument']['uri'];

    $handler = new LintRunLSPCodeActionEventHandler(
      $this->client,
      $p['context']['diagnostics'],
    );

    await relint_uri_async($handler, $this->config, $uri);

    return self::success($handler->getCodeActions());
  }
}
