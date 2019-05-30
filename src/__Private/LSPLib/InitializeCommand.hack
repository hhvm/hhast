/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private\LSPLib;

use namespace Facebook\HHAST\__Private\LSP;

class InitializeCommand<TState as ServerState> extends ServerCommand {
  const string METHOD = 'initialize';
  const type TParams = LSP\InitializeParams;
  const type TResponse = LSP\InitializeResult;
  const type TErrorCode = LSP\InitializeErrorCode;
  const type TErrorData = LSP\InitializeError;

  const LSP\ServerCapabilities SERVER_CAPABILITIES = shape();

  public function __construct(protected TState $state) {
  }

  <<__Override>>
  public async function executeAsync(
    self::TParams $p,
  ): Awaitable<this::TExecuteResult> {
    $this->state
      ->setStatus(ServerStatus::INITIALIZING)
      ->setClientCapabilities($p['capabilities']);
    return static::success(
      shape('capabilities' => static::SERVER_CAPABILITIES),
    );
  }
}
