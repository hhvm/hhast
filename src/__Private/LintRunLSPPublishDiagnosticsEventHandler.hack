/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private;

use type Facebook\HHAST\{BaseLinter, LintError};

use namespace HH\Lib\{C, Str, Vec};

final class LintRunLSPPublishDiagnosticsEventHandler
  implements LintRunEventHandler {
  public function __construct(
    private LSPLib\Client $client,
    private LSPImpl\ServerState $state,
  ) {
  }

  private dict<string, vec<LintError>> $errors = dict[];

  <<__Memoize>>
  private static function realPath(string $in): string {
    return \realpath($in);
  }

  public async function linterRaisedErrorsAsync(
    BaseLinter $linter,
    LintRunConfig::TFileConfig $_config,
    Traversable<LintError> $errors,
  ): Awaitable<LintAutoFixResult> {
    $file = self::realPath($linter->getFile()->getPath());
    $this->errors[$file] = Vec\concat(
      $this->errors[$file] ?? vec[],
      vec($errors),
    );
    return LintAutoFixResult::SOME_UNFIXED;
  }

  private function asDiagnostic(LintError $error): LSP\Diagnostic {
    $range = $error->getRange();
    $start = $range[0] ?? tuple(0, 0);
    $end = $range[1] ?? $start;

    $start = LSPImpl\position_to_lsp($start);
    $end = LSPImpl\position_to_lsp($end);

    $source = \get_class($error->getLinter())
      |> Str\split($$, '\\')
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
    vec<LintError> $errors,
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
    $path = self::realPath($path);
    $errors = $this->errors[$path] ?? vec[];

    if ($result === LintRunResult::NO_ERRORS) {
      invariant(
        C\is_empty($errors),
        'Linter reports no errors, but we have errors',
      );
    } else {
      invariant(
        !C\is_empty($errors),
        'Linter reports errors, but we have none',
      );
    }

    await $this->publishDiagnosticsAsync($path, $errors);
    unset($this->errors[$path]);
  }

  public async function finishedRunAsync(LintRunResult $_): Awaitable<void> {
  }
}
