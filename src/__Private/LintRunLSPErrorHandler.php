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

  /**
   * Process a set of errors returned by running an individual linter on a
   * single file
   */
  public function processErrors(
    Linters\BaseLinter $linter,
    LintRunConfig::TFileConfig $config,
    Traversable<Linters\LintError> $errors,
  ): void {
    $by_files = Dict\group_by($errors, $error ==> $error->getFile());
    foreach ($by_files as $file => $errors) {
      $this->publishDiagnostics($linter, $file, $errors);
    }
  }

  private function publishDiagnostics(
    Linters\BaseLinter $linter,
    string $file,
    vec<Linters\LintError> $errors,
  ): void {
    $message = (new LSPLib\PublishDiagnosticsNotification(shape(
      'uri' => 'file://'.\realpath($file),
      'diagnostics' => Vec\map(
        $errors,
        $error ==> {
          $position = $error->getPosition() ?? tuple(0, 0);
          $start = shape('line' => $position[0] - 1, 'character' => $position[1]);
          return shape(
            'range' => shape('start' => $start, 'end' => $start),
            'severity' => LSP\DiagnosticSeverity::ERROR,
            'code' => \get_class($linter)
              |> Str\split($$, "\\")
              |> C\lastx($$)
              |> Str\strip_suffix($$, 'Linter'),
            'message' => $error->getDescription(),
            'source' => 'HHAST',
          );
        },
      ),
    )))->asMessage();
    $encoded = \json_encode($message);
    $this->terminal
      ->getStdout()
      ->write(
        Str\format(
          "Content-Length: %d\r\n\r\n%s\r\n",
          Str\length($encoded),
          $encoded,
        ),
      );
  }
}
