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

use namespace Facebook\HHAST\__Private\LSP;


abstract class Client {

  abstract protected function sendMessage(LSP\Message $message): void;

  final public function sendRequestMessage(LSP\RequestMessage $message): void {
    $this->sendMessage($message);
  }

  final public function sendResponseMessage(
    LSP\ResponseMessage $message,
  ): void {
    $this->sendMessage($message);
  }

  final public function sendNotificationMessage(
    LSP\NotificationMessage $message,
  ): void {
    $this->sendMessage($message);
  }
}
