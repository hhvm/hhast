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

  const type TConfig = shape(
    ?'ignore' => vec<int>,
    ?'ignore_except' => vec<int>,
    ?'ignoreExcept' => vec<int>,
    ?'lintMarkerAllowList' => vec<this::TErrorCode>,
    ...
  );

  const type TErrorCode = int;

  /**
   * The error code that are always ignored
   */
  const keyset<int> ALWAYS_IGNORE_ERRORS = keyset[
    0 /* InternalError, indicating a bug in the OCaml linter, not a real lint error */,
    5583 /* DontAwaitInALoop, which should have been covered by DontAwaitInALoopLinter */,
  ];

  /**
   * The error code that are ignored by default when both `ignore_except` and
   * `ignore` are `null`
   */
  const keyset<int> DEFAULT_IGNORE_ERRORS = keyset[
    5639 /* potential co(tra)variant marker, which is highly opinionated */,
  ];

  private function mayErrorCodeBeSuppressedWithComments(
    this::TErrorCode $code,
  ): bool {
    return $this->config is null ||
      !Shapes::keyExists($this->config, 'lintMarkerAllowList') ||
      C\contains($this->config['lintMarkerAllowList'], $code);
  }

  <<__Memoize>>
  private function isErrorCodeConfiguredToIgnore(): (function(
    this::TErrorCode,
  ): bool) {
    $ignore_except =
      $this->config['ignore_except'] ?? $this->config['ignoreExcept'] ?? null;
    $ignore = $this->config['ignore'] ?? null;
    if ($ignore is null) {
      if ($ignore_except is null) {
        return $error_code ==>
          C\contains(self::DEFAULT_IGNORE_ERRORS, $error_code);
      }
      return $error_code ==> !C\contains($ignore_except, $error_code);
    }
    if ($ignore_except is null) {
      return $error_code ==> C\contains($ignore, $error_code);
    }
    throw new \InvalidOperationException(
      "Must not set both of the 'ignoreExcept' and 'ignore' fields in the configuration of HHClientLinter",
    );
  }

  const type TJSONResult = shape(
    'errors' => vec<HHClientLintError::TJSONError>,
    'version' => string,
    ...
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
      |> Vec\map($$, $error ==> {
        $error_code = (int)$error->getLintRule()->getErrorCode();
        if ($error->getLintRule()->isSuppressedForFile($this->file)) {
          if ($this->mayErrorCodeBeSuppressedWithComments($error_code)) {
            return null;
          }
          return $error->prefixDescription(Str\format(
            "You may not use a comment to suppress %s(%d) errors.\n".
            "See lintFixmeAllowList in linterConfigs in hhast-lint.json.\n",
            $this->getLinterName(),
            $error_code,
          ));
        }
        if (C\contains(self::ALWAYS_IGNORE_ERRORS, $error_code)) {
          return null;
        }
        if ($this->isErrorCodeConfiguredToIgnore()($error_code)) {
          return null;
        }
        $range = $error->getRange();
        list(list($line_number, $_), $_) = $range;
        $previous_line_number = $line_number - 1;

        $is_suppressed =
          $this->isSuppressedForLine($this->file, $previous_line_number) ||
          $error->getLintRule()
            ->isSuppressedForLine($this->file, $previous_line_number);

        if (!$is_suppressed) {
          return $error;
        } else if (!$this->mayErrorCodeBeSuppressedWithComments($error_code)) {
          return $error->prefixDescription(Str\format(
            "You may not use a comment to suppress %s(%d) errors.\n".
            'See lintFixmeAllowList in linterConfigs in hhast-lint.json.',
            $this->getLinterName(),
            $error_code,
          ));
        }
        return null;
      })
      |> Vec\filter_nulls($$);
  }
}
