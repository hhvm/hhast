/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use function Facebook\HHAST\TestLib\expect;

final class HSLMigrationTest extends MigrationTest {
  const type TMigration = HSLMigration;

  public async function testHslMigrationReturnsSameResults(): Awaitable<void> {
    $base_path = __DIR__.'/examples/migrations/hsl.php';
    concurrent {
      $phpstdlib_results = await __Private\execute_async(
        'hhvm',
        '--no-config',
        $base_path.'.in',
      );
      $hsl_results = await __Private\execute_async(
        'hhvm',
        '--no-config',
        $base_path.'.expect',
      );
    }
    expect($hsl_results)->toBeSame(
      $phpstdlib_results,
      'HSL and PHP functions return same results',
    );
  }
}
