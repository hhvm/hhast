/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private\LSPImpl;

use namespace Facebook\HHAST\__Private\{LSP, LSPLib};
use type Facebook\HHAST\{AutoFixingLinter, LintError};
use namespace HH\Lib\{C, Vec};

final class CodeActionCommand extends LSPLib\CodeActionCommand {
  const type TResponse = vec<mixed>;

  public function __construct(
    private LSPLib\Client $client,
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

          $lint_rule = $e->getLintRule();
          if (!$lint_rule is AutoFixingLinter<_>) {
            return null;
          }

          try {
            $ca = $lint_rule->getCodeActionForError(
              /* HH_FIXME[4110] unsafe generic */ $e,
            );
          } catch (\Exception $_) {
            // usually some form of parse error, especially with as-you-type.
            // Don't crash the LSP server.
            return null;
          }
          if ($ca === null) {
            return null;
          }
          $ca['diagnostics'] = vec[$d];

          // Atom doesn't support CodeAction responses:
          // https://github.com/atom/atom-languageclient/issues/226
          $command = $ca['command'] ?? null;
          $edit = $ca['edit'] ?? null;
          invariant(
            //             vvvv $edit can be null or a shape with zero fields
            !($command && (bool)$edit),
            "Can't currently support both a command and an edit for editor ".
            'compatibility',
          );

          // If we're on a full-featured editor, return the code action
          // directly to avoid a pointless round-trip.
          $caps = $this->state->getClientCapabilities();
          if (
            (
              $caps['textDocument']['codeAction']['codeActionLiteralSupport'] ??
              null
            ) !==
              null
          ) {
            return $ca;
          }

          // Otherwise, return a command, making one if neccessary
          if ($command) {
            return $command;
          }
          invariant($edit !== null, 'Need a command or an edit');
          return shape(
            'title' => $ca['title'],
            'command' => ExecuteCommandCommand::HHAST_ApplyWorkspaceEdit,
            'arguments' => vec[$edit],
          );
        },
      )
      |> Vec\filter_nulls($$)
      |> self::success($$);
  }

  private function findError(
    LSP\Diagnostic $diagnostic,
    vec<LintError> $errors,
  ): ?LintError {
    $code = $diagnostic['code'] ?? null;
    $pos = position_from_lsp($diagnostic['range']['start']);
    return C\find(
      $errors,
      $error ==> $error->getLintRule()->getErrorCode() === $code &&
        ($error->getRange()[0] ?? null) === $pos,
    );
  }
}
