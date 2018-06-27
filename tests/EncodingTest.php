<?hh // strict
/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use function Facebook\FBExpect\expect;
use namespace HH\Lib\Str;

/**
 * Test that we can parse files in unusual charsets */
final class EncodingTest extends TestCase {
  public function testEucJp(): void {
    $ast = from_file(__DIR__.'/fixtures/eucjp2sjis.php');
    $str = $ast->getDescendantsOfType(DoubleQuotedStringLiteralToken::class)[0];
    expect($str->getText() |> Str\split($$, "\n") |> $$[1])->toBeSame('日本語テキストとEnglish Text');
  }
}
