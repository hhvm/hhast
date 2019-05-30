/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private\LSPImpl;

use type Facebook\HHAST\__Private\{LintRunConfig, LintRunEventHandler};
use namespace HH\Lib\Vec;

async function relint_uris_async(
  LintRunEventHandler $handler,
  ?LintRunConfig $config,
  vec<string> $uris,
): Awaitable<void> {
  await Vec\map_async(
    $uris,
    async $uri ==> await relint_uri_async($handler, $config, $uri),
  );
}
