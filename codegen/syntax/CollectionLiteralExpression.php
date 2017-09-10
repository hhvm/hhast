<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<1749a9277613b2c2cc7c5b70dcae3b29>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class CollectionLiteralExpression extends EditableSyntax {

  private EditableSyntax $_name;
  private EditableSyntax $_left_brace;
  private EditableSyntax $_initializers;
  private EditableSyntax $_right_brace;

  public function __construct(
    EditableSyntax $name,
    EditableSyntax $left_brace,
    EditableSyntax $initializers,
    EditableSyntax $right_brace,
  ) {
    parent::__construct('collection_literal_expression');
    $this->_name = $name;
    $this->_left_brace = $left_brace;
    $this->_initializers = $initializers;
    $this->_right_brace = $right_brace;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $name = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['collection_literal_name'],
      $position,
      $source,
    );
    $position += $name->width();
    $left_brace = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['collection_literal_left_brace'],
      $position,
      $source,
    );
    $position += $left_brace->width();
    $initializers = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['collection_literal_initializers'],
      $position,
      $source,
    );
    $position += $initializers->width();
    $right_brace = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['collection_literal_right_brace'],
      $position,
      $source,
    );
    $position += $right_brace->width();
    return new self($name, $left_brace, $initializers, $right_brace);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'name' => $this->_name;
    yield 'left_brace' => $this->_left_brace;
    yield 'initializers' => $this->_initializers;
    yield 'right_brace' => $this->_right_brace;
  }

  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $name = $this->_name->rewrite($rewriter, $parents);
    $left_brace = $this->_left_brace->rewrite($rewriter, $parents);
    $initializers = $this->_initializers->rewrite($rewriter, $parents);
    $right_brace = $this->_right_brace->rewrite($rewriter, $parents);
    if (
      $name === $this->_name &&
      $left_brace === $this->_left_brace &&
      $initializers === $this->_initializers &&
      $right_brace === $this->_right_brace
    ) {
      return $this;
    }
    return new self($name, $left_brace, $initializers, $right_brace);
  }

  public function name(): EditableSyntax {
    return $this->namex();
  }

  public function namex(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_name);
  }

  public function raw_name(): EditableSyntax {
    return $this->_name;
  }

  public function with_name(EditableSyntax $value): this {
    return new self($value, $this->_left_brace, $this->_initializers, $this->_right_brace);
  }

  public function left_brace(): LeftBraceToken {
    return $this->left_bracex();
  }

  public function left_bracex(): LeftBraceToken {
    return TypeAssert::isInstanceOf(LeftBraceToken::class, $this->_left_brace);
  }

  public function raw_left_brace(): EditableSyntax {
    return $this->_left_brace;
  }

  public function with_left_brace(EditableSyntax $value): this {
    return new self($this->_name, $value, $this->_initializers, $this->_right_brace);
  }

  public function initializers(): ?EditableList {
    return $this->_initializers->is_missing() ? null : TypeAssert::isInstanceOf(EditableList::class, $this->_initializers);
  }

  public function initializersx(): EditableList {
    return TypeAssert::isInstanceOf(EditableList::class, $this->_initializers);
  }

  public function raw_initializers(): EditableSyntax {
    return $this->_initializers;
  }

  public function with_initializers(EditableSyntax $value): this {
    return new self($this->_name, $this->_left_brace, $value, $this->_right_brace);
  }

  public function right_brace(): ?RightBraceToken {
    return $this->_right_brace->is_missing() ? null : TypeAssert::isInstanceOf(RightBraceToken::class, $this->_right_brace);
  }

  public function right_bracex(): RightBraceToken {
    return TypeAssert::isInstanceOf(RightBraceToken::class, $this->_right_brace);
  }

  public function raw_right_brace(): EditableSyntax {
    return $this->_right_brace;
  }

  public function with_right_brace(EditableSyntax $value): this {
    return new self($this->_name, $this->_left_brace, $this->_initializers, $value);
  }
}
