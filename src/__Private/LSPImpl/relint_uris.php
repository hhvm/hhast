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
  LintRunLSPErrorHandler,
};
use type Facebook\CLILib\ITerminal;
use namespace Facebook\HHAST\__Private\{LSP, LSPLib};
use namespace HH\Lib\Str;

function relint_uris(
  LSPLib\Client $client,
  ?LintRunConfig $config,
  vec<string> $uris,
): void {
  foreach ($uris as $uri) {
    $path = Str\strip_prefix($uri, 'file://');
    $config = $config ?? LintRunConfig::getForPath($path);

    $handler = (new LintRunLSPErrorHandler($client));
    (new LintRun($config, $handler, vec[$path]))->run();
    $handler->printFinalOutput();
    if ($handler->hadErrors()) {
      continue;
    }
    $message = (new LSPLib\PublishDiagnosticsNotification(shape(
      'uri' => $uri,
      'diagnostics' => vec[],
    )))->asMessage();
    $client->sendNotificationMessage($message);
  }
}
