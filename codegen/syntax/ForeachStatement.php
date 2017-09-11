<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<5064c89349d50c360e27e7fbc13169b7>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class ForeachStatement extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_left_paren;
  private EditableSyntax $_collection;
  private EditableSyntax $_await_keyword;
  private EditableSyntax $_as;
  private EditableSyntax $_key;
  private EditableSyntax $_arrow;
  private EditableSyntax $_value;
  private EditableSyntax $_right_paren;
  private EditableSyntax $_body;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $left_paren,
    EditableSyntax $collection,
    EditableSyntax $await_keyword,
    EditableSyntax $as,
    EditableSyntax $key,
    EditableSyntax $arrow,
    EditableSyntax $value,
    EditableSyntax $right_paren,
    EditableSyntax $body,
  ) {
    parent::__construct('foreach_statement');
    $this->_keyword = $keyword;
    $this->_left_paren = $left_paren;
    $this->_collection = $collection;
    $this->_await_keyword = $await_keyword;
    $this->_as = $as;
    $this->_key = $key;
    $this->_arrow = $arrow;
    $this->_value = $value;
    $this->_right_paren = $right_paren;
    $this->_body = $body;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['foreach_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $left_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['foreach_left_paren'],
      $position,
      $source,
    );
    $position += $left_paren->width();
    $collection = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['foreach_collection'],
      $position,
      $source,
    );
    $position += $collection->width();
    $await_keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['foreach_await_keyword'],
      $position,
      $source,
    );
    $position += $await_keyword->width();
    $as = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['foreach_as'],
      $position,
      $source,
    );
    $position += $as->width();
    $key = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['foreach_key'],
      $position,
      $source,
    );
    $position += $key->width();
    $arrow = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['foreach_arrow'],
      $position,
      $source,
    );
    $position += $arrow->width();
    $value = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['foreach_value'],
      $position,
      $source,
    );
    $position += $value->width();
    $right_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['foreach_right_paren'],
      $position,
      $source,
    );
    $position += $right_paren->width();
    $body = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['foreach_body'],
      $position,
      $source,
    );
    $position += $body->width();
    return new self(
      $keyword,
      $left_paren,
      $collection,
      $await_keyword,
      $as,
      $key,
      $arrow,
      $value,
      $right_paren,
      $body,
    );
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'left_paren' => $this->_left_paren;
    yield 'collection' => $this->_collection;
    yield 'await_keyword' => $this->_await_keyword;
    yield 'as' => $this->_as;
    yield 'key' => $this->_key;
    yield 'arrow' => $this->_arrow;
    yield 'value' => $this->_value;
    yield 'right_paren' => $this->_right_paren;
    yield 'body' => $this->_body;
  }

  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $parents);
    $left_paren = $this->_left_paren->rewrite($rewriter, $parents);
    $collection = $this->_collection->rewrite($rewriter, $parents);
    $await_keyword = $this->_await_keyword->rewrite($rewriter, $parents);
    $as = $this->_as->rewrite($rewriter, $parents);
    $key = $this->_key->rewrite($rewriter, $parents);
    $arrow = $this->_arrow->rewrite($rewriter, $parents);
    $value = $this->_value->rewrite($rewriter, $parents);
    $right_paren = $this->_right_paren->rewrite($rewriter, $parents);
    $body = $this->_body->rewrite($rewriter, $parents);
    if (
      $keyword === $this->_keyword &&
      $left_paren === $this->_left_paren &&
      $collection === $this->_collection &&
      $await_keyword === $this->_await_keyword &&
      $as === $this->_as &&
      $key === $this->_key &&
      $arrow === $this->_arrow &&
      $value === $this->_value &&
      $right_paren === $this->_right_paren &&
      $body === $this->_body
    ) {
      return $this;
    }
    return new self(
      $keyword,
      $left_paren,
      $collection,
      $await_keyword,
      $as,
      $key,
      $arrow,
      $value,
      $right_paren,
      $body,
    );
  }

  public function keyword(): ForeachToken {
    return $this->keywordx();
  }

  public function keywordx(): ForeachToken {
    return TypeAssert::isInstanceOf(ForeachToken::class, $this->_keyword);
  }

  public function raw_keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new self(
      $value,
      $this->_left_paren,
      $this->_collection,
      $this->_await_keyword,
      $this->_as,
      $this->_key,
      $this->_arrow,
      $this->_value,
      $this->_right_paren,
      $this->_body,
    );
  }

  public function left_paren(): LeftParenToken {
    return $this->left_parenx();
  }

  public function left_parenx(): LeftParenToken {
    return TypeAssert::isInstanceOf(LeftParenToken::class, $this->_left_paren);
  }

  public function raw_left_paren(): EditableSyntax {
    return $this->_left_paren;
  }

  public function with_left_paren(EditableSyntax $value): this {
    if ($value === $this->_left_paren) {
      return $this;
    }
    return new self(
      $this->_keyword,
      $value,
      $this->_collection,
      $this->_await_keyword,
      $this->_as,
      $this->_key,
      $this->_arrow,
      $this->_value,
      $this->_right_paren,
      $this->_body,
    );
  }

  public function collection(): EditableSyntax {
    return $this->collectionx();
  }

  public function collectionx(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_collection);
  }

  public function raw_collection(): EditableSyntax {
    return $this->_collection;
  }

  public function with_collection(EditableSyntax $value): this {
    if ($value === $this->_collection) {
      return $this;
    }
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $value,
      $this->_await_keyword,
      $this->_as,
      $this->_key,
      $this->_arrow,
      $this->_value,
      $this->_right_paren,
      $this->_body,
    );
  }

  public function await_keyword(): ?AwaitToken {
    return $this->_await_keyword->is_missing() ? null : TypeAssert::isInstanceOf(AwaitToken::class, $this->_await_keyword);
  }

  public function await_keywordx(): AwaitToken {
    return TypeAssert::isInstanceOf(AwaitToken::class, $this->_await_keyword);
  }

  public function raw_await_keyword(): EditableSyntax {
    return $this->_await_keyword;
  }

  public function with_await_keyword(EditableSyntax $value): this {
    if ($value === $this->_await_keyword) {
      return $this;
    }
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $this->_collection,
      $value,
      $this->_as,
      $this->_key,
      $this->_arrow,
      $this->_value,
      $this->_right_paren,
      $this->_body,
    );
  }

  public function as(): AsToken {
    return $this->asx();
  }

  public function asx(): AsToken {
    return TypeAssert::isInstanceOf(AsToken::class, $this->_as);
  }

  public function raw_as(): EditableSyntax {
    return $this->_as;
  }

  public function with_as(EditableSyntax $value): this {
    if ($value === $this->_as) {
      return $this;
    }
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $this->_collection,
      $this->_await_keyword,
      $value,
      $this->_key,
      $this->_arrow,
      $this->_value,
      $this->_right_paren,
      $this->_body,
    );
  }

  public function key(): EditableSyntax {
    return $this->keyx();
  }

  public function keyx(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_key);
  }

  public function raw_key(): EditableSyntax {
    return $this->_key;
  }

  public function with_key(EditableSyntax $value): this {
    if ($value === $this->_key) {
      return $this;
    }
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $this->_collection,
      $this->_await_keyword,
      $this->_as,
      $value,
      $this->_arrow,
      $this->_value,
      $this->_right_paren,
      $this->_body,
    );
  }

  public function arrow(): ?EqualGreaterThanToken {
    return $this->_arrow->is_missing() ? null : TypeAssert::isInstanceOf(EqualGreaterThanToken::class, $this->_arrow);
  }

  public function arrowx(): EqualGreaterThanToken {
    return TypeAssert::isInstanceOf(EqualGreaterThanToken::class, $this->_arrow);
  }

  public function raw_arrow(): EditableSyntax {
    return $this->_arrow;
  }

  public function with_arrow(EditableSyntax $value): this {
    if ($value === $this->_arrow) {
      return $this;
    }
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $this->_collection,
      $this->_await_keyword,
      $this->_as,
      $this->_key,
      $value,
      $this->_value,
      $this->_right_paren,
      $this->_body,
    );
  }

  public function value(): EditableSyntax {
    return $this->valuex();
  }

  public function valuex(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_value);
  }

  public function raw_value(): EditableSyntax {
    return $this->_value;
  }

  public function with_value(EditableSyntax $value): this {
    if ($value === $this->_value) {
      return $this;
    }
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $this->_collection,
      $this->_await_keyword,
      $this->_as,
      $this->_key,
      $this->_arrow,
      $value,
      $this->_right_paren,
      $this->_body,
    );
  }

  public function right_paren(): RightParenToken {
    return $this->right_parenx();
  }

  public function right_parenx(): RightParenToken {
    return TypeAssert::isInstanceOf(RightParenToken::class, $this->_right_paren);
  }

  public function raw_right_paren(): EditableSyntax {
    return $this->_right_paren;
  }

  public function with_right_paren(EditableSyntax $value): this {
    if ($value === $this->_right_paren) {
      return $this;
    }
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $this->_collection,
      $this->_await_keyword,
      $this->_as,
      $this->_key,
      $this->_arrow,
      $this->_value,
      $value,
      $this->_body,
    );
  }

  public function body(): EditableSyntax {
    return $this->bodyx();
  }

  public function bodyx(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_body);
  }

  public function raw_body(): EditableSyntax {
    return $this->_body;
  }

  public function with_body(EditableSyntax $value): this {
    if ($value === $this->_body) {
      return $this;
    }
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $this->_collection,
      $this->_await_keyword,
      $this->_as,
      $this->_key,
      $this->_arrow,
      $this->_value,
      $this->_right_paren,
      $value,
    );
  }
}
