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

abstract class ClientCommand {
  abstract const string METHOD;
  abstract const type TParams;

  public function __construct(
    private arraykey $id,
    private this::TParams $params,
  ) {}

  final public function asMessage(): LSP\RequestMessage {
    $message = shape(
      'jsonrpc' => '2.0',
      'id' => $this->id,
      'method' => static::METHOD,
    );

    $params = $this->params;
    if ($params !== null) {
      $message['params'] = $params;
    }

    return $message;
  }
}
