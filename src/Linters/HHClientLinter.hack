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

  const type TConfig = shape();

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
      $error['start'],
      $error['end'] - $error['start'],
    );
  }

  public async function getLintErrorsAsync(
  ): Awaitable<vec<HHClientLintError>> {
    $lines = await __Private\execute_async(
      'hh_client',
      '--lint',
      $this->getFile()->getPath(),
      '--json',
      '--from',
      'hhast',
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
    return Vec\map(
      $hh_client_lint_result['errors'],
      $error ==> new HHClientLintError(
        $this->file,
        $error,
        $this::blameCode($file_lines, $error),
      ),
    );
  }
}
