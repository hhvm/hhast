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

abstract class ServerNotification {
  abstract const string METHOD;
  abstract const type TParams;

  public function __construct(private this::TParams $params) {}

  public function asMessage(): LSP\NotificationMessage {
    $message = shape(
      'jsonrpc' => '2.0',
      'method' => static::METHOD,
    );

    $params = $this->params;
    if ($params !== null) {
      $message['params'] = $params;
    }

    return $message;
  }
}
