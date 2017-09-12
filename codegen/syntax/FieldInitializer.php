<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<83bd2766335f9e7b92a13efc83470062>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class FieldInitializer extends EditableSyntax {

  private EditableSyntax $_name;
  private EditableSyntax $_arrow;
  private EditableSyntax $_value;

  public function __construct(
    EditableSyntax $name,
    EditableSyntax $arrow,
    EditableSyntax $value,
  ) {
    parent::__construct('field_initializer');
    $this->_name = $name;
    $this->_arrow = $arrow;
    $this->_value = $value;
  }

  <<__Override>>
  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $name = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['field_initializer_name'],
      $position,
      $source,
    );
    $position += $name->getWidth();
    $arrow = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['field_initializer_arrow'],
      $position,
      $source,
    );
    $position += $arrow->getWidth();
    $value = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['field_initializer_value'],
      $position,
      $source,
    );
    $position += $value->getWidth();
    return new self($name, $arrow, $value);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'name' => $this->_name;
    yield 'arrow' => $this->_arrow;
    yield 'value' => $this->_value;
  }

  <<__Override>>
  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $name = $this->_name->rewrite($rewriter, $parents);
    $arrow = $this->_arrow->rewrite($rewriter, $parents);
    $value = $this->_value->rewrite($rewriter, $parents);
    if (
      $name === $this->_name &&
      $arrow === $this->_arrow &&
      $value === $this->_value
    ) {
      return $this;
    }
    return new self($name, $arrow, $value);
  }

  public function getNameUNTYPED(): EditableSyntax {
    return $this->_name;
  }

  public function withName(EditableSyntax $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new self($value, $this->_arrow, $this->_value);
  }

  public function hasName(): bool {
    return !$this->_name->isMissing();
  }

  public function getName(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_name);
  }

  public function getArrowUNTYPED(): EditableSyntax {
    return $this->_arrow;
  }

  public function withArrow(EditableSyntax $value): this {
    if ($value === $this->_arrow) {
      return $this;
    }
    return new self($this->_name, $value, $this->_value);
  }

  public function hasArrow(): bool {
    return !$this->_arrow->isMissing();
  }

  public function getArrow(): EqualGreaterThanToken {
    return TypeAssert::isInstanceOf(EqualGreaterThanToken::class, $this->_arrow);
  }

  public function getValueUNTYPED(): EditableSyntax {
    return $this->_value;
  }

  public function withValue(EditableSyntax $value): this {
    if ($value === $this->_value) {
      return $this;
    }
    return new self($this->_name, $this->_arrow, $value);
  }

  public function hasValue(): bool {
    return !$this->_value->isMissing();
  }

  public function getValue(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_value);
  }
}
