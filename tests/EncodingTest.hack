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
  public async function testEucJp(): Awaitable<void> {
    // Make sure that we can handle EUC-JP in output from `hh_parse`
    $ast = await from_file_async(
      File::fromPath(__DIR__.'/examples/eucjp2sjis.php'),
    );
    $str = $ast->getFirstDescendantByType<SingleQuotedStringLiteralToken>()
      as nonnull;

    // Make sure that we get the same binary string back, not converted...
    $second_line = $str->getText()
      |> Str\split($$, "\n")
      |> $$[1];
    expect($second_line)->toNotBeSame(
      '日本語テキストとEnglish Text',
      'Got UTF-8 string, expected EUC-JP',
    );

    // Test the actual content
    $as_utf8 = \iconv('EUC-JP', 'UTF-8', $second_line);
    expect($as_utf8)->toBeSame('日本語テキストとEnglish Text');
  }
}
