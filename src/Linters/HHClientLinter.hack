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
use namespace HH\Lib\{C, Vec};

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
    return Vec\map(
      $hh_client_lint_result['errors'],
      $error ==> new HHClientLintError($this->file, $error),
    );
  }
}
