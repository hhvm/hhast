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
use namespace Facebook\HHAST;
use namespace HH\Lib\Str;

final class FixtureRewritingTest extends TestCase {
  public async function testRewriteComments(): Awaitable<void> {
    $rewriter = (HHAST\Node $node, ?vec<HHAST\Node> $_parents) ==> {
      if ($node is HHAST\SingleLineComment) {
        return $node->withText('// blah blah blah');
      }
      if ($node is HHAST\DelimitedComment) {
        if (Str\contains($node->getText(), 'Copyright')) {
          return $node;
        }
        return $node->withText('/* blah blah blah */');
      }
      return $node;
    };

    $ast = await HHAST\from_file_async(
      HHAST\File::fromPath(__DIR__.'/examples/rewrite_comments.php.in'),
    );
    $code = $ast->rewrite($rewriter)->getCode();
    expect($code)->toMatchExpectFile('rewrite_comments.php.expect');
  }
}
