<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<55d0deeae0cd7df7ab14fb3aa819b27b>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class TupleExpression extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_left_paren;
  private EditableSyntax $_items;
  private EditableSyntax $_right_paren;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $left_paren,
    EditableSyntax $items,
    EditableSyntax $right_paren,
  ) {
    parent::__construct('tuple_expression');
    $this->_keyword = $keyword;
    $this->_left_paren = $left_paren;
    $this->_items = $items;
    $this->_right_paren = $right_paren;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['tuple_expression_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $left_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['tuple_expression_left_paren'],
      $position,
      $source,
    );
    $position += $left_paren->width();
    $items = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['tuple_expression_items'],
      $position,
      $source,
    );
    $position += $items->width();
    $right_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['tuple_expression_right_paren'],
      $position,
      $source,
    );
    $position += $right_paren->width();
    return new self($keyword, $left_paren, $items, $right_paren);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'left_paren' => $this->_left_paren;
    yield 'items' => $this->_items;
    yield 'right_paren' => $this->_right_paren;
  }

  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $parents);
    $left_paren = $this->_left_paren->rewrite($rewriter, $parents);
    $items = $this->_items->rewrite($rewriter, $parents);
    $right_paren = $this->_right_paren->rewrite($rewriter, $parents);
    if (
      $keyword === $this->_keyword &&
      $left_paren === $this->_left_paren &&
      $items === $this->_items &&
      $right_paren === $this->_right_paren
    ) {
      return $this;
    }
    return new self($keyword, $left_paren, $items, $right_paren);
  }

  public function raw_keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new self($value, $this->_left_paren, $this->_items, $this->_right_paren);
  }

  public function keyword(): TupleToken {
    return TypeAssert::isInstanceOf(TupleToken::class, $this->_keyword);
  }

  public function raw_left_paren(): EditableSyntax {
    return $this->_left_paren;
  }

  public function with_left_paren(EditableSyntax $value): this {
    if ($value === $this->_left_paren) {
      return $this;
    }
    return new self($this->_keyword, $value, $this->_items, $this->_right_paren);
  }

  public function left_paren(): LeftParenToken {
    return TypeAssert::isInstanceOf(LeftParenToken::class, $this->_left_paren);
  }

  public function raw_items(): EditableSyntax {
    return $this->_items;
  }

  public function with_items(EditableSyntax $value): this {
    if ($value === $this->_items) {
      return $this;
    }
    return new self($this->_keyword, $this->_left_paren, $value, $this->_right_paren);
  }

  public function items(): EditableList {
    return TypeAssert::isInstanceOf(EditableList::class, $this->_items);
  }

  public function raw_right_paren(): EditableSyntax {
    return $this->_right_paren;
  }

  public function with_right_paren(EditableSyntax $value): this {
    if ($value === $this->_right_paren) {
      return $this;
    }
    return new self($this->_keyword, $this->_left_paren, $this->_items, $value);
  }

  public function right_paren(): RightParenToken {
    return TypeAssert::isInstanceOf(RightParenToken::class, $this->_right_paren);
  }
}
