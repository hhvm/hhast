/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private;

use namespace Facebook\HHAST\Linters;
use namespace HH\Lib\{C, Str, Vec};

final class LintRunLSPPublishDiagnosticsEventHandler
  implements LintRunEventHandler {
  public function __construct(
    private LSPLib\Client $client,
    private LSPImpl\ServerState $state,
  ) {
  }

  private ?string $file = null;
  private vec<Linters\LintError> $errors = vec[];

  public async function linterRaisedErrorsAsync(
    Linters\BaseLinter $linter,
    LintRunConfig::TFileConfig $_config,
    Traversable<Linters\LintError> $errors,
  ): Awaitable<LintAutoFixResult> {
    $file = \realpath($linter->getFile()->getPath());
    invariant(
      $this->file === null || $this->file === $file,
      "Unexpected file change in lint process",
    );
    $this->file = $file;
    $this->errors = Vec\concat($this->errors ?? vec[], $errors);
    return LintAutoFixResult::SOME_UNFIXED;
  }

  private function asDiagnostic(Linters\LintError $error): LSP\Diagnostic {
    $range = $error->getRange();
    $start = $range[0] ?? tuple(0, 0);
    $end = $range[1] ?? $start;

    $start = LSPImpl\position_to_lsp($start);
    $end = LSPImpl\position_to_lsp($end);

    $source = \get_class($error->getLinter())
      |> Str\split($$, "\\")
      |> C\lastx($$)
      |> Str\strip_suffix($$, 'Linter');
    return shape(
      'range' => shape('start' => $start, 'end' => $end),
      'severity' => LSP\DiagnosticSeverity::WARNING,
      'message' => $error->getDescription(),
      'code' => $source,
      'source' => 'HHAST',
    );
  }

  private async function publishDiagnosticsAsync(
    string $file,
    vec<Linters\LintError> $errors,
  ): Awaitable<void> {
    $uri = 'file://'.$file;
    $this->state->lintErrors[$uri] = $errors;
    $message = (
      new LSPLib\PublishDiagnosticsNotification(shape(
        'uri' => $uri,
        'diagnostics' => Vec\map($errors, $e ==> $this->asDiagnostic($e)),
      ))
    )->asMessage();
    await $this->client->sendNotificationMessageAsync($message);
  }

  public async function finishedFileAsync(
    string $path,
    LintRunResult $result,
  ): Awaitable<void> {
    $path = \realpath($path);
    invariant(
      $this->file === null || $this->file === $path,
      "Unexpected file change",
    );

    $errors = $this->errors;

    if ($result === LintRunResult::NO_ERRORS) {
      invariant(
        C\is_empty($errors),
        "Linter reports no errors, but we have errors",
      );
    } else {
      invariant(
        !C\is_empty($errors),
        "Linter reports errors, but we have none",
      );
    }

    await $this->publishDiagnosticsAsync($path, $errors);
    $this->file = null;
    $this->errors = vec[];
  }

  public async function finishedRunAsync(LintRunResult $_): Awaitable<void> {
  }
}
