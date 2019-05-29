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
use namespace HH\Lib\{C, Str};

final class FixtureRewritingTest extends TestCase {
  /** Add a comment just before the try body and just inside
   * the catch body */
  public async function testInsert(): Awaitable<void> {
    $original = await HHAST\from_file_async(
      File::fromPath(__DIR__.'/examples/insert.php.in'),
    );

    $comment = new HHAST\DelimitedComment('/* HELLO WORLD */');

    $tries = $original->getDescendantsOfType(HHAST\TryStatement::class);
    $first_try_body = C\firstx($tries)->getCompoundStatement();

    $rewritten = $original->insertBefore($first_try_body, $comment);

    $catches = $rewritten->getDescendantsOfType(HHAST\CatchClause::class);
    $left_brace = C\firstx($catches)->getBody()->getLeftBracex();
    $rewritten = $rewritten->insertAfter($left_brace, $comment);

    $code = $rewritten->getCode();

    expect($code)->toMatchExpectFile('insert.php.expect');
  }

  public async function testRewriteComments(): Awaitable<void> {
    $rewriter = (
      HHAST\EditableNode $node,
      ?vec<HHAST\EditableNode> $_parents,
    ) ==> {
      if ($node instanceof HHAST\SingleLineComment) {
        return $node->withText('// blah blah blah');
      }
      if ($node instanceof HHAST\DelimitedComment) {
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

  public async function testRemove(): Awaitable<void> {
    $ast = await HHAST\from_file_async(
      HHAST\File::fromPath(__DIR__.'/examples/remove.php.in'),
    );

    // Remove all try statements
    $ast = $ast->removeWhere(
      ($node, $_parents) ==> $node instanceof HHAST\TryStatement,
    );

    // Remove first method
    $methods = $ast->getDescendantsOfType(HHAST\MethodishDeclaration::class);
    $ast = $ast->without(C\firstx($methods));

    expect($ast->getCode())->toMatchExpectFile('remove.php.expect');
  }
}
