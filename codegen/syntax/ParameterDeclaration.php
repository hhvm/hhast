<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<618f012cff04317a31dc55cbd7dfc44d>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class ParameterDeclaration extends EditableSyntax {

  private EditableSyntax $_attribute;
  private EditableSyntax $_visibility;
  private EditableSyntax $_type;
  private EditableSyntax $_name;
  private EditableSyntax $_default_value;

  public function __construct(
    EditableSyntax $attribute,
    EditableSyntax $visibility,
    EditableSyntax $type,
    EditableSyntax $name,
    EditableSyntax $default_value,
  ) {
    parent::__construct('parameter_declaration');
    $this->_attribute = $attribute;
    $this->_visibility = $visibility;
    $this->_type = $type;
    $this->_name = $name;
    $this->_default_value = $default_value;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $attribute = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['parameter_attribute'],
      $position,
      $source,
    );
    $position += $attribute->width();
    $visibility = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['parameter_visibility'],
      $position,
      $source,
    );
    $position += $visibility->width();
    $type = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['parameter_type'],
      $position,
      $source,
    );
    $position += $type->width();
    $name = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['parameter_name'],
      $position,
      $source,
    );
    $position += $name->width();
    $default_value = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['parameter_default_value'],
      $position,
      $source,
    );
    $position += $default_value->width();
    return new self($attribute, $visibility, $type, $name, $default_value);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'attribute' => $this->_attribute;
    yield 'visibility' => $this->_visibility;
    yield 'type' => $this->_type;
    yield 'name' => $this->_name;
    yield 'default_value' => $this->_default_value;
  }

  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $attribute = $this->_attribute->rewrite($rewriter, $parents);
    $visibility = $this->_visibility->rewrite($rewriter, $parents);
    $type = $this->_type->rewrite($rewriter, $parents);
    $name = $this->_name->rewrite($rewriter, $parents);
    $default_value = $this->_default_value->rewrite($rewriter, $parents);
    if (
      $attribute === $this->_attribute &&
      $visibility === $this->_visibility &&
      $type === $this->_type &&
      $name === $this->_name &&
      $default_value === $this->_default_value
    ) {
      return $this;
    }
    return new self($attribute, $visibility, $type, $name, $default_value);
  }

  public function attribute(): ?AttributeSpecification {
    return $this->_attribute->is_missing() ? null : TypeAssert::isInstanceOf(AttributeSpecification::class, $this->_attribute);
  }

  public function attributex(): AttributeSpecification {
    return TypeAssert::isInstanceOf(AttributeSpecification::class, $this->_attribute);
  }

  public function raw_attribute(): EditableSyntax {
    return $this->_attribute;
  }

  public function with_attribute(EditableSyntax $value): this {
    return new self(
      $value,
      $this->_visibility,
      $this->_type,
      $this->_name,
      $this->_default_value,
    );
  }

  public function visibility(): EditableSyntax {
    return $this->visibilityx();
  }

  public function visibilityx(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_visibility);
  }

  public function raw_visibility(): EditableSyntax {
    return $this->_visibility;
  }

  public function with_visibility(EditableSyntax $value): this {
    return new self(
      $this->_attribute,
      $value,
      $this->_type,
      $this->_name,
      $this->_default_value,
    );
  }

  public function type(): EditableSyntax {
    return $this->typex();
  }

  public function typex(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_type);
  }

  public function raw_type(): EditableSyntax {
    return $this->_type;
  }

  public function with_type(EditableSyntax $value): this {
    return new self(
      $this->_attribute,
      $this->_visibility,
      $value,
      $this->_name,
      $this->_default_value,
    );
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
    return new self(
      $this->_attribute,
      $this->_visibility,
      $this->_type,
      $value,
      $this->_default_value,
    );
  }

  public function default_value(): ?SimpleInitializer {
    return $this->_default_value->is_missing() ? null : TypeAssert::isInstanceOf(SimpleInitializer::class, $this->_default_value);
  }

  public function default_valuex(): SimpleInitializer {
    return TypeAssert::isInstanceOf(SimpleInitializer::class, $this->_default_value);
  }

  public function raw_default_value(): EditableSyntax {
    return $this->_default_value;
  }

  public function with_default_value(EditableSyntax $value): this {
    return new self(
      $this->_attribute,
      $this->_visibility,
      $this->_type,
      $this->_name,
      $value,
    );
  }
}
