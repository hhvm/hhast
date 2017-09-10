<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<5903ca95e9b5039f76f6da1360da83d4>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class ShapeExpression extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_left_paren;
  private EditableSyntax $_fields;
  private EditableSyntax $_right_paren;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $left_paren,
    EditableSyntax $fields,
    EditableSyntax $right_paren,
  ) {
    parent::__construct('shape_expression');
    $this->_keyword = $keyword;
    $this->_left_paren = $left_paren;
    $this->_fields = $fields;
    $this->_right_paren = $right_paren;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['shape_expression_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $left_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['shape_expression_left_paren'],
      $position,
      $source,
    );
    $position += $left_paren->width();
    $fields = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['shape_expression_fields'],
      $position,
      $source,
    );
    $position += $fields->width();
    $right_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['shape_expression_right_paren'],
      $position,
      $source,
    );
    $position += $right_paren->width();
    return new self($keyword, $left_paren, $fields, $right_paren);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'left_paren' => $this->_left_paren;
    yield 'fields' => $this->_fields;
    yield 'right_paren' => $this->_right_paren;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $left_paren = $this->_left_paren->rewrite($rewriter, $child_parents);
    $fields = $this->_fields->rewrite($rewriter, $child_parents);
    $right_paren = $this->_right_paren->rewrite($rewriter, $child_parents);
    if (
      $keyword === $this->_keyword &&
      $left_paren === $this->_left_paren &&
      $fields === $this->_fields &&
      $right_paren === $this->_right_paren
    ) {
      $node = $this;
    } else {
      $node = new self($keyword, $left_paren, $fields, $right_paren);
    }
    return $rewriter($node, $parents);
  }

  public function keyword(): ShapeToken {
    return $this->keywordx();
  }

  public function keywordx(): ShapeToken {
    return TypeAssert::isInstanceOf(ShapeToken::class, $this->_keyword);
  }

  public function raw_keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return
      new self($value, $this->_left_paren, $this->_fields, $this->_right_paren);
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
    return
      new self($this->_keyword, $value, $this->_fields, $this->_right_paren);
  }

  public function fields(): ?EditableList {
    return $this->_fields->is_missing()
      ? null
      : TypeAssert::isInstanceOf(EditableList::class, $this->_fields);
  }

  public function fieldsx(): EditableList {
    return TypeAssert::isInstanceOf(EditableList::class, $this->_fields);
  }

  public function raw_fields(): EditableSyntax {
    return $this->_fields;
  }

  public function with_fields(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $value,
      $this->_right_paren,
    );
  }

  public function right_paren(): RightParenToken {
    return $this->right_parenx();
  }

  public function right_parenx(): RightParenToken {
    return
      TypeAssert::isInstanceOf(RightParenToken::class, $this->_right_paren);
  }

  public function raw_right_paren(): EditableSyntax {
    return $this->_right_paren;
  }

  public function with_right_paren(EditableSyntax $value): this {
    return
      new self($this->_keyword, $this->_left_paren, $this->_fields, $value);
  }
}
