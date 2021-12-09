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
use namespace HH\Lib\C;

class ServerState {
  private ServerStatus $status = ServerStatus::PRE_INIT;
  private ?LSP\ClientCapabilities $clientCapabilities = null;

  final public function getStatus(): ServerStatus {
    return $this->status;
  }

  final public function setStatus(ServerStatus $new): this {
    $this->status = $new;
    return $this;
  }

  final public function setClientCapabilities(
    LSP\ClientCapabilities $caps,
  ): this {
    invariant(
      $this->clientCapabilities === null,
      "Shouldn't set client capabilities more than once",
    );
    $this->clientCapabilities = $caps;
    return $this;
  }

  final public function getClientCapabilities(): ?LSP\ClientCapabilities {
    return $this->clientCapabilities;
  }

  final public async function waitForInitAsync(): Awaitable<void> {
    $pre_init = keyset[
      ServerStatus::PRE_INIT,
      ServerStatus::INITIALIZING,
    ];
    while (C\contains_key($pre_init, $this->getStatus())) {
      /* HHAST_IGNORE_ERROR[DontAwaitInALoop] */
      await \HH\Asio\usleep(100 * 1000);
    }
  }
}
