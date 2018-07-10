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
  LintRunConfig,
  LintRunLSPCodeActionEventHandler,
};
use namespace Facebook\HHAST\__Private\{LSP, LSPLib};
use namespace Facebook\HHAST\Linters;
use namespace HH\Lib\{C, Str, Vec};

final class CodeActionCommand extends LSPLib\CodeActionCommand {
  const type TResponse = vec<LSP\CodeAction>;

  public function __construct(
    private LSPLib\Client $client,
    private ?LintRunConfig $config,
    private ServerState $state,
  ) {
  }

  <<__Override>>
  public async function executeAsync(
    self::TParams $p,
  ): Awaitable<this::TExecuteResult> {
    $uri = $p['textDocument']['uri'];

    $file_errors = $this->state->lintErrors[$uri] ?? vec[];

    return $p['context']['diagnostics']
      |> Vec\map(
        $$,
        $d ==> {
          $e = $this->findError($d, $file_errors);
          if ($e === null) {
            return null;
          }

          $linter = $e->getLinter();
          if (!$linter instanceof Linters\LSPAutoFixingLinter) {
            return null;
          }

          $ca = $linter->getCodeActionForError($e);
          if ($ca === null) {
            return null;
          }
          $ca['diagnostics'] = vec[$d];
          return $ca;
        },
      )
      |> Vec\filter_nulls($$)
      |> self::success($$);
  }

  private function findError(
    LSP\Diagnostic $diagnostic,
    vec<Linters\LintError> $errors,
  ): ?Linters\LintError {
    $pos = position_from_lsp($diagnostic['range']['start']);
    foreach ($errors as $error) {
      $code = \get_class($error->getLinter())
        |> Str\split($$, "\\")
        |> C\lastx($$)
        |> Str\strip_suffix($$, 'Linter');
      if ($code !== ($diagnostic['code'] ?? null)) {
        continue;
      }
      if ($error->getPosition() !== $pos) {
        continue;
      }
      return $error;
    }
    return null;
  }
}
