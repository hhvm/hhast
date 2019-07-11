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
use namespace HH\Lib\{C, Str, Vec};
use namespace Facebook\HHAST;

final class RewriteBehaviorTest extends TestCase {
  public function testTokenIdentity(): void {
    $node = new HHAST\VariableToken(null, null, '$var');

    expect($node->rewrite(($x, $_) ==> $x))
      ->toBeSame($node);
  }

  public function testTriviaIdentity(): void {
    $node = new HHAST\DelimitedComment('foo');

    expect($node->rewrite(($x, $_) ==> $x))
      ->toBeSame($node);
  }

  public function testSyntaxIdentity(): void {
    $node = new HHAST\Script(new HHAST\NodeList(vec[], null));
    expect($node->rewrite(($x, $_) ==> $x))
      ->toBeSame($node);
  }

  public function testListIdentity(): void {
    $node = new HHAST\NodeList(
      vec[
        new HHAST\SingleLineComment('foo'),
        new HHAST\DelimitedComment('bar'),
      ],
    );

    expect($node->rewrite(($x, $_) ==> $x))
      ->toBeSame($node);
  }

  public function testRewritingListChildren(): void {
    $orig = new HHAST\NodeList(
      vec[
        new HHAST\SingleLineComment('foo'),
      ],
    );

    $new = $orig->rewrite(
      ($x, $_) ==> {
        if (!$x instanceof HHAST\SingleLineComment) {
          return $x;
        }
        return new HHAST\DelimitedComment('bar');
      },
    );

    expect($orig)->toNotBeSame($new);
    expect($new->getCode())->toBeSame('bar');
  }

  public function testEditingCommentInList(): void {
    $orig = new HHAST\NodeList(
      vec[
        new HHAST\SingleLineComment('foo'),
      ],
    );

    $new = $orig->rewrite(
      ($x, $_) ==> {
        if (!$x instanceof HHAST\SingleLineComment) {
          return $x;
        }
        return $x->withText('bar');
      },
    );

    expect($orig)->toNotBeSame($new);
    expect($new->getCode())->toBeSame('bar');
  }

  public function testRewriteLeadingComment(): void {
    $orig = new HHAST\VariableToken(
      new HHAST\NodeList(
        vec[
          new HHAST\DelimitedComment('/* foo */'),
          new HHAST\WhiteSpace(' '),
        ],
      ),
      null,
      '$var',
    );

    $new = $orig->rewrite(
      ($node, $_) ==> {
        if (!$node instanceof HHAST\DelimitedComment) {
          return $node;
        }
        return $node->withText('/* bar */');
      },
    );

    expect($orig)->toNotBeSame($new);
    expect($new->getCode())->toBeSame('/* bar */ $var');
  }

  public function testEmptyingList(): void {
    $orig = new HHAST\VariableToken(
      new HHAST\NodeList(
        vec[
          new HHAST\DelimitedComment('/* foo */'),
          new HHAST\WhiteSpace(' '),
        ],
      ),
      null,
      '$var',
    );

    $new = $orig->rewrite(
      ($node, $parents) ==> {
        if (!$node instanceof HHAST\Trivia) {
          return $node;
        }
        return null;
      },
    )
      |> expect($$)->toBeInstanceOf(HHAST\VariableToken::class);


    expect($new->getLeading()->isEmpty())->toBeTrue(
      'Should have empty leading',
    );
  }

  public async function testRewritePreservesCaseOfFixedTextTokens(
  ): Awaitable<void> {
    $code = "<?hh \$x = NuLl;";
    $ast = await HHAST\from_file_async(
      HHAST\File::fromPathAndContents('/dev/null', $code),
    );
    expect($ast->getCode())->toBeSame($code);
  }

  public async function testRewritesNewChildren(): Awaitable<void> {
    $code = "<?hh type T = shape('subshape' => shape('subfield' => string));";
    $orig = await HHAST\from_file_async(
      HHAST\File::fromPathAndContents('/dev/null', $code),
    );
    expect($orig->getCode())->toBeSame($code);

    $new = $orig->rewrite(
      ($shape, $_) ==> {
        if (!$shape instanceof HHAST\ShapeTypeSpecifier) {
          return $shape;
        }

        $fields = $shape->getFieldsx()
          ->getDescendantsOfType(HHAST\FieldSpecifier::class);

        return $shape->withFields(
          new HHAST\NodeList(
            Vec\map(
              $shape->getFieldsx()->getChildren(),
              $item ==> {
                $field = $item->getItem();
                $name = $field->getName();
                $name_t = $name->getDescendantsOfType(
                  HHAST\SingleQuotedStringLiteralToken::class,
                )
                  |> C\first($$);
                if ($name_t === null) {
                  return $item;
                }

                return $field->withName(
                  $name->replace($name_t, $name_t->withText(
                    Str\slice(
                      $name_t->getText(),
                      1,
                      Str\length($name_t->getText()) - 2,
                    )
                      |> Str\format("'%s_new'", $$),
                  ),
                )) |> $item->replace($field, $$);
              },
            ),
          ),
        );

      },
    );

    expect($new->getCode())->toBeSame(
      "<?hh type T = shape('subshape_new' => shape('subfield_new' => string));",
    );
  }
}
