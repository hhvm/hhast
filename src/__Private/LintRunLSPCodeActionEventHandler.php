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
use namespace Facebook\HHAST\__Private\{LSP, LSPLib};
use namespace HH\Lib\{C, Dict, Str, Vec};

final class LintRunLSPCodeActionEventHandler implements LintRunEventHandler {
  private vec<LSP\CodeAction> $codeActions = vec[];

  public function __construct(
    private LSPLib\Client $client,
    private vec<LSP\Diagnostic> $diagnostics,
  ) {
  }

  public function linterRaisedErrors(
    Linters\BaseLinter $linter,
    LintRunConfig::TFileConfig $_config,
    Traversable<Linters\LintError> $errors,
  ): LintAutoFixResult {
    if (!$linter instanceof Linters\LSPAutoFixingLinter) {
      return LintAutoFixResult::SOME_UNFIXED;
    }

    $linter_class = \get_class($linter);
    foreach ($errors as $error) {
      $d = $this->findDiagnostic($linter, $error);
      if ($d === null) {
        continue;
      }

      $action = $linter->getCodeActionForError($error);
      if ($action === null) {
        continue;
      }
      $action['diagnostics'] = vec[$d];
      $this->codeActions[] = $action;
    }

    return LintAutoFixResult::SOME_UNFIXED;
  }

  private function findDiagnostic(
    Linters\BaseLinter $linter,
    Linters\LintError $error,
  ): ?LSP\Diagnostic {
    $linter = \get_class($linter)
      |> Str\split($$, "\\")
      |> C\lastx($$)
      |> Str\strip_suffix($$, "Linter");
    $pos = $error->getPosition() ?? tuple(0, 0);
    $start = shape(
      'line' => $pos[0] - 1,
      'character' => $pos[1],
    );
    foreach ($this->diagnostics as $d) {
      if (($d['code'] ?? '') !== $linter) {
        continue;
      }
      if ($d['range']['start'] !== $start) {
        continue;
      }
      return $d;
    }
    return null;
  }

  public function finishedFile(string $_path, LintRunResult $_result): void {
  }

  public function finishedRun(LintRunResult $_): void {
  }

  public function getCodeActions(): vec<LSP\CodeAction> {
    return $this->codeActions;
  }
}
