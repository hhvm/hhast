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

use type Facebook\CLILib\ITerminal;
use namespace Facebook\HHAST\Linters;
use namespace HH\Lib\{C, Dict, Str, Vec};

final class LintRunLSPErrorHandler implements LintRunErrorHandler {
  public function __construct(private ITerminal $terminal) {
  }

  private dict<string, vec<LSP\Diagnostic>> $log = dict[];

  public function hadErrors(): bool {
    return !C\is_empty($this->log);
  }

  public function processErrors(
    Linters\BaseLinter $linter,
    LintRunConfig::TFileConfig $config,
    Traversable<Linters\LintError> $errors,
  ): void {
    $by_files = Dict\group_by($errors, $error ==> $error->getFile());
    foreach ($by_files as $file => $errors) {
      $file = \realpath($file);
      $this->log[$file] =
        Vec\map($errors, $e ==> $this->asDiagnostic($linter, $e))
        |> Vec\concat($this->log[$file] ?? vec[], $$);
    }
  }

  private function asDiagnostic(
    Linters\BaseLinter $linter,
    Linters\LintError $error,
  ): LSP\Diagnostic {
    $position = $error->getPosition() ?? tuple(0, 0);
    $start = shape('line' => $position[0] - 1, 'character' => $position[1]);
    $source = \get_class($linter)
      |> Str\split($$, "\\")
      |> C\lastx($$)
      |> Str\strip_suffix($$, 'Linter');
    return shape(
      'range' => shape('start' => $start, 'end' => $start),
      'severity' => LSP\DiagnosticSeverity::WARNING,
      'message' => $error->getDescription(),
      'code' => $source,
      'source' => 'HHAST:'.$source,
    );
  }

  private function publishDiagnostics(
    string $file,
    vec<LSP\Diagnostic> $diagnostics,
  ): void {
    $message = (new LSPLib\PublishDiagnosticsNotification(shape(
      'uri' => 'file://'.$file,
      'diagnostics' => $diagnostics,
    )))->asMessage();
    $json = \json_encode($message);
    $this->terminal->getStdout()->write(Str\format(
      "Content-Length: %d\r\n\r\n%s",
      Str\length($json),
      $json,
    ));
  }

  public function printFinalOutput(): void {
    foreach ($this->log as $file => $diagnostics) {
      $diagnostics = Vec\sort_by(
        $diagnostics,
        $d ==> $d['range']['start']['line'],
      );
      $this->publishDiagnostics($file, $diagnostics);
    }
  }
}
