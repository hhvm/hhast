<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<e8e5b9a4db603bc05fa5d6a1ccbe8ce9>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class TupleTypeSpecifier extends EditableSyntax {

  private EditableSyntax $_left_paren;
  private EditableSyntax $_types;
  private EditableSyntax $_right_paren;

  public function __construct(
    EditableSyntax $left_paren,
    EditableSyntax $types,
    EditableSyntax $right_paren,
  ) {
    parent::__construct('tuple_type_specifier');
    $this->_left_paren = $left_paren;
    $this->_types = $types;
    $this->_right_paren = $right_paren;
  }

  <<__Override>>
  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $left_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['tuple_left_paren'],
      $position,
      $source,
    );
    $position += $left_paren->width();
    $types = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['tuple_types'],
      $position,
      $source,
    );
    $position += $types->width();
    $right_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['tuple_right_paren'],
      $position,
      $source,
    );
    $position += $right_paren->width();
    return new self($left_paren, $types, $right_paren);
  }

  <<__Override>>
  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'left_paren' => $this->_left_paren;
    yield 'types' => $this->_types;
    yield 'right_paren' => $this->_right_paren;
  }

  <<__Override>>
  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $left_paren = $this->_left_paren->rewrite($rewriter, $parents);
    $types = $this->_types->rewrite($rewriter, $parents);
    $right_paren = $this->_right_paren->rewrite($rewriter, $parents);
    if (
      $left_paren === $this->_left_paren &&
      $types === $this->_types &&
      $right_paren === $this->_right_paren
    ) {
      return $this;
    }
    return new self($left_paren, $types, $right_paren);
  }

  public function getLeftParenUNTYPED(): EditableSyntax {
    return $this->_left_paren;
  }

  public function withLeftParen(EditableSyntax $value): this {
    if ($value === $this->_left_paren) {
      return $this;
    }
    return new self($value, $this->_types, $this->_right_paren);
  }

  public function hasLeftParen(): bool {
    return !$this->_left_paren->is_missing();
  }

  public function getLeftParen(): LeftParenToken {
    return TypeAssert::isInstanceOf(LeftParenToken::class, $this->_left_paren);
  }

  public function getTypesUNTYPED(): EditableSyntax {
    return $this->_types;
  }

  public function withTypes(EditableSyntax $value): this {
    if ($value === $this->_types) {
      return $this;
    }
    return new self($this->_left_paren, $value, $this->_right_paren);
  }

  public function hasTypes(): bool {
    return !$this->_types->is_missing();
  }

  public function getTypes(): EditableList {
    return TypeAssert::isInstanceOf(EditableList::class, $this->_types);
  }

  public function getRightParenUNTYPED(): EditableSyntax {
    return $this->_right_paren;
  }

  public function withRightParen(EditableSyntax $value): this {
    if ($value === $this->_right_paren) {
      return $this;
    }
    return new self($this->_left_paren, $this->_types, $value);
  }

  public function hasRightParen(): bool {
    return !$this->_right_paren->is_missing();
  }

  public function getRightParen(): RightParenToken {
    return TypeAssert::isInstanceOf(RightParenToken::class, $this->_right_paren);
  }
}
