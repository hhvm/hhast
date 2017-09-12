<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<9abb26cc77938680302a405bda6ab4d0>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class SimpleInitializer extends EditableSyntax {

  private EditableSyntax $_equal;
  private EditableSyntax $_value;

  public function __construct(EditableSyntax $equal, EditableSyntax $value) {
    parent::__construct('simple_initializer');
    $this->_equal = $equal;
    $this->_value = $value;
  }

  <<__Override>>
  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $equal = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['simple_initializer_equal'],
      $position,
      $source,
    );
    $position += $equal->getWidth();
    $value = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['simple_initializer_value'],
      $position,
      $source,
    );
    $position += $value->getWidth();
    return new self($equal, $value);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'equal' => $this->_equal;
    yield 'value' => $this->_value;
  }

  <<__Override>>
  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $equal = $this->_equal->rewrite($rewriter, $parents);
    $value = $this->_value->rewrite($rewriter, $parents);
    if (
      $equal === $this->_equal &&
      $value === $this->_value
    ) {
      return $this;
    }
    return new self($equal, $value);
  }

  public function getEqualUNTYPED(): EditableSyntax {
    return $this->_equal;
  }

  public function withEqual(EditableSyntax $value): this {
    if ($value === $this->_equal) {
      return $this;
    }
    return new self($value, $this->_value);
  }

  public function hasEqual(): bool {
    return !$this->_equal->isMissing();
  }

  public function getEqual(): EqualToken {
    return TypeAssert::isInstanceOf(EqualToken::class, $this->_equal);
  }

  public function getValueUNTYPED(): EditableSyntax {
    return $this->_value;
  }

  public function withValue(EditableSyntax $value): this {
    if ($value === $this->_value) {
      return $this;
    }
    return new self($this->_equal, $value);
  }

  public function hasValue(): bool {
    return !$this->_value->isMissing();
  }

  public function getValue(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_value);
  }
}
