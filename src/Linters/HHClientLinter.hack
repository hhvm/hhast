/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */
namespace Facebook\HHAST;

use namespace Facebook\TypeAssert;
use namespace HH\Lib\{C, Str, Vec};

/**
 * A linter as a proxy invoking `hh_client --lint`.
 */
final class HHClientLinter implements Linter {
  use LinterTrait;
  use SuppressibleTrait;

  const type TConfig =
    shape(?'ignore_except' => vec<int>, ?'ignore' => vec<int>);

  const type TErrorCode = int;

  <<__Memoize>>
  private function isErrorCodeConfiguredToIgnore(): (function(this::TErrorCode): bool) {
    $ignore_except = $this->config['ignore_except'] ?? null;
    $ignore = $this->config['ignore'] ?? null;
    if ($ignore is null) {
      if ($ignore_except is null) {
        return $_ ==> false;
      }
      return $error_code ==> !C\contains($ignore_except, $error_code);
    }
    if ($ignore_except is null) {
      return $error_code ==> C\contains($ignore, $error_code);
    }
    throw new \InvalidOperationException(
      "Must not set both of the 'ignore_except' and 'ignore' fields in the configuration of HHClientLinter",
    );
  }

  const type TJSONResult = shape(
    'errors' => vec<HHClientLintError::TJSONError>,
    'version' => string,
  );

  private static function blameCode(
    vec<string> $file_lines,
    HHClientLintError::TJSONError $error,
  ): string {
    $line_number_1base = $error['line'];
    $line_index_0base = $line_number_1base - 1;
    $line_content = $file_lines[$line_index_0base];
    return Str\slice(
      $line_content,
      $error['start'] - 1,
      $error['end'] - $error['start'] + 1,
    );
  }

  public async function getLintErrorsAsync(
  ): Awaitable<vec<HHClientLintError>> {
    $lines = await __Private\ProcessExecutionQueues::HH_CLIENT->waitForAsync(
      vec[
        '--lint',
        $this->getFile()->getPath(),
        '--json',
        '--from',
        'hhast',
      ],
    );
    $hh_client_lint_result = TypeAssert\matches<this::TJSONResult>(
      \json_decode(
        C\firstx($lines),
        /* assoc = */ true,
        /* depth = */ 512,
        \JSON_FB_HACK_ARRAYS,
      ),
    );
    $file_lines = Str\split($this->getFile()->getContents(), "\n");
    return $hh_client_lint_result['errors']
      |> Vec\map(
        $$,
        $error ==> new HHClientLintError(
          $this->file,
          $error,
          $this::blameCode($file_lines, $error),
        ),
      )
      |> Vec\filter($$, $error ==> {
        if ($error->getLintRule()->isSuppressedForFile($this->file)) {
          return false;
        }
        if (
          $this->isErrorCodeConfiguredToIgnore()(
            (int)$error->getLintRule()->getErrorCode(),
          )
        ) {
          return false;
        }
        $range = $error->getRange();
        if ($range is null) {
          return true;
        }
        list(list($line_number, $_), $_) = $range;
        $previous_line_number = $line_number - 1;
        if ($this->isSuppressedForLine($this->file, $previous_line_number)) {
          return false;
        }
        if (
          $error->getLintRule()
            ->isSuppressedForLine($this->file, $previous_line_number)
        ) {
          return false;
        }
        return true;
      });
  }
}
