<?hh // strict
/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private\LSPLib;

use namespace HH\Lib\C;

class ServerState {
  private ServerStatus $status = ServerStatus::PRE_INIT;

  final public function getStatus(): ServerStatus {
    return $this->status;
  }

  final public function setStatus(ServerStatus $new): void {
    $this->status = $new;
  }

  final public async function waitForInitAsync(): Awaitable<void> {
    $pre_init = keyset[
      ServerStatus::PRE_INIT,
      ServerStatus::INITIALIZING,
    ];
    while (C\contains_key($pre_init, $this->getStatus())) {
      /* HHAST_IGNORE_ERROR[DontAwaitInALoop] */
      await \HH\Asio\usleep(100);
    }
  }
}
