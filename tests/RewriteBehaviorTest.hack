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
use namespace HH\Lib\{Str, Vec};

final class RewriteBehaviorTest extends TestCase {
  public function testTokenIdentity(): void {
    $node = new VariableToken(null, null, '$var');

    expect($node->rewrite(($x, $_) ==> $x))
      ->toBeSame($node);
  }

  public function testTriviaIdentity(): void {
    $node = new DelimitedComment('foo');

    expect($node->rewrite(($x, $_) ==> $x))
      ->toBeSame($node);
  }

  public function testSyntaxIdentity(): void {
    $node = new Script(new NodeList(vec[], null));
    expect($node->rewrite(($x, $_) ==> $x))
      ->toBeSame($node);
  }

  public function testListIdentity(): void {
    $node = new NodeList(
      vec[
        new SingleLineComment('foo'),
        new DelimitedComment('bar'),
      ],
    );

    expect($node->rewrite(($x, $_) ==> $x))
      ->toBeSame($node);
  }

  public function testRewritingListChildren(): void {
    $orig = new NodeList(
      vec[
        new SingleLineComment('foo'),
      ],
    );

    $new = $orig->rewrite(
      ($x, $_) ==> {
        if (!$x is SingleLineComment) {
          return $x;
        }
        return new DelimitedComment('bar');
      },
    );

    expect($orig)->toNotBeSame($new);
    expect($new->getCode())->toBeSame('bar');
  }

  public function testEditingCommentInList(): void {
    $orig = new NodeList(
      vec[
        new SingleLineComment('foo'),
      ],
    );

    $new = $orig->rewrite(
      ($x, $_) ==> {
        if (!$x is SingleLineComment) {
          return $x;
        }
        return $x->withText('bar');
      },
    );

    expect($orig)->toNotBeSame($new);
    expect($new->getCode())->toBeSame('bar');
  }

  public function testRewriteLeadingComment(): void {
    $orig = new VariableToken(
      new NodeList(
        vec[
          new DelimitedComment('/* foo */'),
          new WhiteSpace(' '),
        ],
      ),
      null,
      '$var',
    );

    $new = $orig->rewrite(
      ($node, $_) ==> {
        if (!$node is DelimitedComment) {
          return $node;
        }
        return $node->withText('/* bar */');
      },
    );

    expect($orig)->toNotBeSame($new);
    expect($new->getCode())->toBeSame('/* bar */ $var');
  }

  public function testEmptyingList(): void {
    $orig = new VariableToken(
      new NodeList(
        vec[
          new DelimitedComment('/* foo */'),
          new WhiteSpace(' '),
        ],
      ),
      null,
      '$var',
    );

    $new = $orig->rewrite(
      ($node, $_parents) ==> {
        if (!$node is Trivia) {
          return $node;
        }
        return null;
      },
    )
      |> expect($$)->toBeInstanceOf(VariableToken::class);

    expect($new->getLeading()->isEmpty())->toBeTrue(
      'Should have empty leading',
    );
  }

  public async function testRewritePreservesCaseOfFixedTextTokens(
  ): Awaitable<void> {
    $code = "<?hh \$x = NuLl;";
    $ast = await from_file_async(File::fromPathAndContents('/dev/null', $code));
    expect($ast->getCode())->toBeSame($code);
  }

  public async function testRewritesNewChildren(): Awaitable<void> {
    $code = "<?hh type T = shape('subshape' => shape('subfield' => string));";
    $orig = await from_file_async(
      File::fromPathAndContents('/dev/null', $code),
    );
    expect($orig->getCode())->toBeSame($code);

    $new = $orig->rewrite(
      ($shape, $_) ==> {
        if (!$shape is ShapeTypeSpecifier) {
          return $shape;
        }

        return $shape->withFields(
          new NodeList(
            Vec\map(
              $shape->getFieldsx()->getChildren(),
              $item ==> {
                $field = $item->getItem();
                $name = $field->getName();
                $name_t = $name->getFirstDescendantByType<
                  SingleQuotedStringLiteralToken,
                >();
                if ($name_t === null) {
                  return $item;
                }

                return $field->withName(
                  $name->replace(
                    $name_t,
                    $name_t->withText(
                      Str\slice(
                        $name_t->getText(),
                        1,
                        Str\length($name_t->getText()) - 2,
                      )
                        |> Str\format("'%s_new'", $$),
                    ),
                  ),
                )
                  |> $item->replace($field, $$);
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
