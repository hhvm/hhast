/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private\LSPLib;

class InitializedNotification<TState as ServerState>
  extends ClientNotification {
  const string METHOD = 'initialized';
  const type TParams = mixed;

  public function __construct(protected TState $state) {
  }

  <<__Override>>
  public async function executeAsync(this::TParams $_in): Awaitable<void> {
    $this->state->setStatus(ServerStatus::INITIALIZED);
  }
}
