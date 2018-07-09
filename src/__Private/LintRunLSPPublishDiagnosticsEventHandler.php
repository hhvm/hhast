<?hh // strict
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
use namespace Facebook\HHAST\__Private\LSPLib;
use namespace HH\Lib\{C, Dict, Str, Vec};

final class LintRunLSPPublishDiagnosticsEventHandler
  implements LintRunEventHandler {
  public function __construct(private LSPLib\Client $client) {
  }

  private ?string $file = null;
  private vec<LSP\Diagnostic> $errors = vec[];

  public function linterRaisedErrors(
    Linters\BaseLinter $linter,
    LintRunConfig::TFileConfig $config,
    Traversable<Linters\LintError> $errors,
  ): LintAutoFixResult {
    $file = \realpath($linter->getFile());
    invariant(
      $this->file === null || $this->file === $file,
      "Unexpected file change in lint process",
    );
    $this->file = $file;
    $this->errors = Vec\concat(
      $this->errors ?? vec[],
      Vec\map($errors, $e ==> $this->asDiagnostic($linter, $e)),
    );
    return LintAutoFixResult::SOME_UNFIXED;
  }

  private function asDiagnostic(
    Linters\BaseLinter $linter,
    Linters\LintError $error,
  ): LSP\Diagnostic {
    $range = $error->getRange();
    $start = $range[0] ?? tuple(0, 0);
    $end = $range[1] ?? $start;

    $start = shape('line' => $start[0] - 1, 'character' => $start[1]);
    $end = shape('line' => $end[0] - 1, 'character' => $end[1]);

    $source = \get_class($linter)
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

  private function publishDiagnostics(
    string $file,
    vec<LSP\Diagnostic> $diagnostics,
  ): void {
    $message = (
      new LSPLib\PublishDiagnosticsNotification(shape(
        'uri' => 'file://'.$file,
        'diagnostics' => $diagnostics,
      ))
    )->asMessage();
    $this->client->sendNotificationMessage($message);
  }

  public function finishedFile(string $path, LintRunResult $result): void {
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

    $this->publishDiagnostics($path, $errors);
    $this->file = null;
    $this->errors = vec[];
  }

  public function finishedRun(LintRunResult $_): void {
  }
}
