<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<63295e31913c0755aa5a873498963b8e>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class ElementInitializer extends EditableSyntax {

  private EditableSyntax $_key;
  private EditableSyntax $_arrow;
  private EditableSyntax $_value;

  public function __construct(
    EditableSyntax $key,
    EditableSyntax $arrow,
    EditableSyntax $value,
  ) {
    parent::__construct('element_initializer');
    $this->_key = $key;
    $this->_arrow = $arrow;
    $this->_value = $value;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $key = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['element_key'],
      $position,
      $source,
    );
    $position += $key->width();
    $arrow = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['element_arrow'],
      $position,
      $source,
    );
    $position += $arrow->width();
    $value = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['element_value'],
      $position,
      $source,
    );
    $position += $value->width();
    return new self($key, $arrow, $value);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'key' => $this->_key;
    yield 'arrow' => $this->_arrow;
    yield 'value' => $this->_value;
  }

  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $key = $this->_key->rewrite($rewriter, $parents);
    $arrow = $this->_arrow->rewrite($rewriter, $parents);
    $value = $this->_value->rewrite($rewriter, $parents);
    if (
      $key === $this->_key &&
      $arrow === $this->_arrow &&
      $value === $this->_value
    ) {
      return $this;
    }
    return new self($key, $arrow, $value);
  }

  public function raw_key(): EditableSyntax {
    return $this->_key;
  }

  public function with_key(EditableSyntax $value): this {
    if ($value === $this->_key) {
      return $this;
    }
    return new self($value, $this->_arrow, $this->_value);
  }

  public function hasKey(): bool {
    return !$this->_key->is_missing();
  }

  public function key(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_key);
  }

  public function raw_arrow(): EditableSyntax {
    return $this->_arrow;
  }

  public function with_arrow(EditableSyntax $value): this {
    if ($value === $this->_arrow) {
      return $this;
    }
    return new self($this->_key, $value, $this->_value);
  }

  public function hasArrow(): bool {
    return !$this->_arrow->is_missing();
  }

  public function arrow(): EqualGreaterThanToken {
    return TypeAssert::isInstanceOf(EqualGreaterThanToken::class, $this->_arrow);
  }

  public function raw_value(): EditableSyntax {
    return $this->_value;
  }

  public function with_value(EditableSyntax $value): this {
    if ($value === $this->_value) {
      return $this;
    }
    return new self($this->_key, $this->_arrow, $value);
  }

  public function hasValue(): bool {
    return !$this->_value->is_missing();
  }

  public function value(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_value);
  }
}
