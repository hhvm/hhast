/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private\LSPLib;

abstract class ExitNotification<TState as ServerState>
  extends ClientNotification {

  const string METHOD = 'exit';
  const type TParams = mixed;

  public function __construct(protected TState $state) {
  }

  abstract protected function exitImplAsync(
    int $code,
    string $message,
  ): Awaitable<void>;

  <<__Override>>
  final public async function executeAsync(self::TParams $_): Awaitable<void> {
    $old_status = $this->state->getStatus();
    $this->state->setStatus(ServerStatus::EXITING);
    if ($old_status === ServerStatus::SHUTTING_DOWN) {
      await $this->exitImplAsync(0, 'Requested by client');
      return;
    }

    await $this->exitImplAsync(
      1,
      'Exit requested by client when not already shutting down',
    );
  }
}
