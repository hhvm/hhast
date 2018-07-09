<?hh // strict
/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private\LSPImpl;

use type Facebook\HHAST\__Private\{
  LintRun,
  LintRunConfig,
  LintRunEventHandler,
  LintRunLSPEventHandler,
};
use namespace HH\Lib\Str;

async function relint_uri_async(
  LintRunEventHandler $handler,
  ?LintRunConfig $config,
  string $uri,
): Awaitable<void> {
  $path = Str\strip_prefix($uri, 'file://');
  $config = $config ?? LintRunConfig::getForPath($path);

  await (new LintRun($config, $handler, vec[$path]))->runAsync();
}
