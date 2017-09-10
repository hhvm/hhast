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
use namespace HH\Lib\{C, Str};
use namespace Facebook\HHAST;

final class RewritingTest extends TestCase {
  public function testTokenIdentity(): void {
    $node = new HHAST\VariableToken(
      HHAST\Missing(),
      HHAST\Missing(),
      '$var',
    );

    expect($node->rewrite(($x, $_) ==> $x))
      ->toBeSame($node);
  }

  public function testTriviaIdentity(): void {
    $node = new HHAST\DelimitedComment('foo');

    expect($node->rewrite(($x, $_) ==> $x))
      ->toBeSame($node);
  }

  public function testSyntaxIdentity(): void {
    $node = new HHAST\TypeConstant(
      HHAST\Missing(),
      HHAST\Missing(),
      HHAST\Missing(),
    );

    expect($node->rewrite(($x, $_) ==> $x))
      ->toBeSame($node);
  }

  public function testListIdentity(): void {
    $node = new HHAST\EditableList(
      vec[
        new HHAST\SingleLineComment('foo'),
        new HHAST\DelimitedComment('bar'),
      ],
    );

    expect($node->rewrite(($x, $_) ==> $x))
      ->toBeSame($node);
  }

  public function testRewritingListChildren(): void {
    $orig = new HHAST\EditableList(
      vec[
        new HHAST\SingleLineComment('foo'),
      ]
    );

    $new = $orig->rewrite(
      ($x, $_) ==> {
        if (!$x instanceof HHAST\SingleLineComment) {
          return $x;
        }
        return new HHAST\DelimitedComment('bar');
      }
    );

    expect($orig)->toNotBeSame($new);
    expect($new->full_text())->toBeSame('bar');
  }

  public function testEditingCommentInList(): void {
    $orig = new HHAST\EditableList(
      vec[
        new HHAST\SingleLineComment('foo'),
      ]
    );

    $new = $orig->rewrite(
      ($x, $_) ==> {
        if (!$x instanceof HHAST\SingleLineComment) {
          return $x;
        }
        return $x->with_text('bar');
      }
    );

    expect($orig)->toNotBeSame($new);
    expect($new->full_text())->toBeSame('bar');
  }

  public function testRewriteLeadingComment(): void {
    $orig = new HHAST\VariableToken(
      new HHAST\EditableList(
        vec[
          new HHAST\DelimitedComment('/* foo */'),
          new HHAST\WhiteSpace(' '),
        ],
      ),
      HHAST\Missing(),
      '$var',
    );

    $new = $orig->rewrite(
      ($node, $_) ==> {
        if (!$node instanceof HHAST\DelimitedComment) {
          return $node;
        }
        return $node->with_text('/* bar */');
      }
    );

    expect($orig)->toNotBeSame($new);
    expect($new->full_text())->toBeSame('/* bar */ $var');
  }
}
