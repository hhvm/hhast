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


abstract class Client {

  abstract protected function sendMessageAsync(
    LSP\Message $message,
  ): Awaitable<void>;

  final public async function sendRequestMessageAsync(
    LSP\RequestMessage $message,
  ): Awaitable<void> {
    await $this->sendMessageAsync($message);
  }

  final public async function sendResponseMessageAsync(
    LSP\ResponseMessage $message,
  ): Awaitable<void> {
    await $this->sendMessageAsync($message);
  }

  final public async function sendNotificationMessageAsync(
    LSP\NotificationMessage $message,
  ): Awaitable<void> {
    await $this->sendMessageAsync($message);
  }
}
