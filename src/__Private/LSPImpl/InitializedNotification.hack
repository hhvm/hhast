/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private\LSPImpl;

use namespace Facebook\HHAST\__Private\LSPLib;

final class InitializedNotification
  extends LSPLib\InitializedNotification<LSPLib\ServerState> {

  public function __construct(
    private LSPLib\Client $client,
    LSPLib\ServerState $state,
  ) {
    parent::__construct($state);
  }

  <<__Override>>
  public async function executeAsync(self::TParams $p): Awaitable<void> {
    $message = (
      new LSPLib\RegisterCapabilityCommand(
        __CLASS__,
        shape(
          'registrations' => vec[
            shape(
              'id' => 'relint on watched file change',
              'method' => LSPLib\DidChangeWatchedFilesNotification::METHOD,
              'registerOptions' => shape(
                'watchers' => vec[
                  shape('globPattern' => '**/*.php'),
                  shape('globPattern' => '**/*.hck'),
                  shape('globPattern' => '**/*.hack'),
                  shape('globPattern' => '**/*.hh'),
                ],
              ),
            ),
          ],
        ),
      )
    )->asMessage();
    await $this->client->sendRequestMessageAsync($message);
    await parent::executeAsync($p);
  }
}
