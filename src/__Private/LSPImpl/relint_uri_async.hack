/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private\LSPImpl;

use type Facebook\HHAST\__Private\{LintRun, LintRunConfig, LintRunEventHandler};
use type Facebook\HHAST\Linters\File;
use namespace HH\Lib\Str;

async function relint_uri_async(
  LintRunEventHandler $handler,
  ?LintRunConfig $config,
  string $uri,
  ?string $content = null,
): Awaitable<void> {
  $path = Str\strip_prefix($uri, 'file://');
  $config = $config ?? LintRunConfig::getForPath($path);

  $lint_run = new LintRun($config, $handler, vec[$path]);
  if ($content !== null) {
    $lint_run = $lint_run->withFile(File::fromPathAndContents($path, $content));
  }
  await $lint_run->runAsync();
}
