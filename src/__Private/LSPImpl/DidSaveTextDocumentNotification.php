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

final class DidSaveTextDocumentNotification
  extends LSPLib\DidSaveTextDocumentNotification {

  public function __construct(
    private ITerminal $terminal,
    private ?LintRunConfig $config,
  ) {
  }

  public async function executeAsync(self::TParams $p): Awaitable<void> {
    $uri = $p['textDocument']['uri'];
    if (!Str\starts_with($uri, 'file://')) {
      return;
    }
    $path = Str\strip_prefix($uri, 'file://');
    $config = $this->config ?? LintRunConfig::getForPath($path);

    $handler = (new LintRunLSPErrorHandler($this->terminal));
    (new LintRun($config, $handler, vec[$path]))->run();
    $handler->printFinalOutput();
    if ($handler->hadErrors()) {
      return;
    }
    $message = (new LSPLib\PublishDiagnosticsNotification(shape(
      'uri' => $uri,
      'diagnostics' => vec[],
    )))->asMessage();
    $json = \json_encode($message);
    $this->terminal
      ->getStdout()
      ->write(Str\format(
        "Content-Length: %d\r\n\r\n%s",
        Str\length($json),
        $json,
      ));
  }
}
