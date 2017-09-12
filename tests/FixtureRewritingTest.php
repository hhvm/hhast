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

final class FixtureRewritingTest extends TestCase {
  /** Add a comment just before the try body and just inside
   * the catch body */
  public function testInsert(): void {
    $original = HHAST\from_file(
      __DIR__.'/fixtures/insert.php.in',
    );

    $comment = new HHAST\DelimitedComment('/* HELLO WORLD */');

    $tries = $original->of_class(HHAST\TryStatement::class);
    $first_try_body = C\firstx($tries)->getCompoundStatement();

    $rewritten = $original->insert_before($comment, $first_try_body);

    $catches = $rewritten->of_class(HHAST\CatchClause::class);
    $left_brace = C\firstx($catches)->getBody()->getLeftBracex();
    $rewritten = $rewritten->insert_after($comment, $left_brace);

    $code = $rewritten->full_text();

    $this->assertMatches($code, 'insert.php.expect');
  }

  public function testRewriteComments(): void {
    $rewriter = (HHAST\EditableSyntax $node, $_parents) ==> {
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

    $code = HHAST\from_file(
      __DIR__.'/fixtures/rewrite_comments.php.in',
    )
      ->rewrite($rewriter)
      ->full_text();
    $this->assertMatches($code, 'rewrite_comments.php.expect');
  }

  public function testRemove(): void {
    $ast = HHAST\from_file(__DIR__.'/fixtures/remove.php.in');

    // Remove all try statements
    $ast = $ast->remove_where(
      ($node, $_parents) ==> $node instanceof HHAST\TryStatement,
    );

    // Remove first method
    $methods = $ast->of_class(HHAST\MethodishDeclaration::class);
    $ast = $ast->without(C\firstx($methods));

    $this->assertMatches(
      $ast->full_text(),
      'remove.php.expect',
    );
  }
}
