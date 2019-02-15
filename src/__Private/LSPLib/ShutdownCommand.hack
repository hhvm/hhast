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

class ShutdownCommand<TState as ServerState> extends ServerCommand {
  const string METHOD = 'shutdown';
  const type TParams = mixed;
  const type TResponse = mixed;
  const type TErrorCode = int;
  const type TErrorData = mixed;

  const LSP\ServerCapabilities SERVER_CAPABILITIES = shape();

  public function __construct(protected TState $state) {
  }

  <<__Override>>
  public async function executeAsync(
    self::TParams $_,
  ): Awaitable<this::TExecuteResult> {
    $this->state->setStatus(ServerStatus::SHUTTING_DOWN);
    return static::success(null);
  }
}
