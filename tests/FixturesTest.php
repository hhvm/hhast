<?hh // strict

/**
 * Copyright (c) 2016, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional
 * grant of patent rights can be found in the PATENTS file in the same
 * directory.
 *
 */

namespace Facebook\HHAST;

use function Facebook\FBExpect\expect;
use namespace Facebook\HHAST;
use namespace HH\Lib\{C, Str};

final class FixturesTest extends \PHPUnit\Framework\TestCase {
  public function testInsert(): void {
    $original = HHAST\from_file(
      __DIR__.'/fixtures/insert.php.in',
    );

    $comment = new HHAST\DelimitedComment('/* HELLO WORLD */');

    $tries = $original->of_class(HHAST\TryStatement::class);
    $first_try_body = C\firstx($tries)->compound_statement();

    $rewritten = $original->insert_before($comment, $first_try_body);

    $catches = $rewritten->of_class(HHAST\CatchClause::class);
    /* HH_IGNORE_ERROR[4053] body() is insufficiently typed */
    $left_brace = C\firstx($catches)->body()->left_brace();
    $rewritten = $rewritten->insert_after($comment, $left_brace);

    $code = $rewritten->full_text();

    $this->assertMatches($code, 'insert.php.expect');
  }

  private function assertMatches(
    string $code,
    string $expect_file,
  ): void {
    $expect_file = __DIR__.'/fixtures/'.$expect_file;
    file_put_contents(
      Str\strip_suffix($expect_file, '.expect').'.out',
      $code,
    );
    if (!file_exists($expect_file)) {
      print($code);
      $this->markTestIncomplete($expect_file.' does not exist');
    }
    expect($code)->toBeSame(file_get_contents($expect_file));
  }
}
