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
use namespace HH\Lib\{C, Str, Vec};
use namespace Facebook\HHAST;

final class RewriteBehaviorTest extends TestCase {
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

  public function testEmptyingList(): void {
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
      ($node, $parents) ==> {
        if (!$node instanceof HHAST\EditableTrivia) {
          return $node;
        }
        return HHAST\Missing();
      }
    )
      |> expect($$)->toBeInstanceOf(HHAST\VariableToken::class);


    expect($new->leading())
      ->toBeInstanceOf(HHAST\Missing::class);
  }

  public function testRewritesNewChildren(): void {
    $orig = HHAST\from_code(
      "<?hh type T = shape('subshape' => shape('subfield' => string));",
    );

    $new = $orig->rewrite(
      ($shape, $_) ==> {
        if (!$shape instanceof HHAST\ShapeTypeSpecifier) {
          return $shape ;
        }

        $fields = $shape->getFieldsx()->of_class(
          HHAST\FieldSpecifier::class,
        );

        return $shape->withFields(
          new HHAST\EditableList(
            Vec\map(
              $shape->getFieldsx()->children(),
              $field ==> {
                if ($field instanceof HHAST\ListItem) {
                  $field = $field->getItem();
                }
                if (!$field instanceof HHAST\FieldSpecifier) {
                  return $field;
                }

                $name = $field->getName()->of_class(
                  HHAST\SingleQuotedStringLiteralToken::class,
                ) |> C\first($$);
                if ($name === null) {
                  return $field;
                }

                return $field->withName(
                  $name->with_text(
                    Str\slice($name->text(), 1, Str\length($name->text()) - 2)
                    |> sprintf("'%s_new'", $$),
                  ),
                );
              }
            ),
          ),
        );

      },
    );

    expect($new->full_text())->toBeSame(
      "<?hh type T = shape('subshape_new' => shape('subfield_new' => string));",
    );
  }
}
