/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private\LSPImpl;

use type Facebook\CLILib\ExitException;
use namespace Facebook\HHAST\__Private\LSPLib;

final class ExitNotification
  extends LSPLib\ExitNotification<LSPLib\ServerState> {

  <<__Override>>
  protected async function exitImplAsync(
    int $code,
    string $message,
  ): Awaitable<void> {
    throw new ExitException($code, $message);
  }
}
