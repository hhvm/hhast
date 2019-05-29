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
  const type TMigration = Migrations\HSLMigration;

  public function testHslMigrationReturnsSameResults(): void {
    $base_path = __DIR__.'/fixtures/migrations/hsl.php';
    $handle = \HH\Lib\Tuple\from_async(
      __Private\execute_async('hhvm', '--no-config', $base_path.'.in'),
      __Private\execute_async(
        'hhvm',
        '--no-config',
        $base_path.'.expect',
      ),
    );
    list($phpstdlib_results, $hsl_results) = \HH\Asio\join($handle);
    expect($hsl_results)->toBeSame(
      $phpstdlib_results,
      'HSL and PHP functions return same results',
    );
  }
}
