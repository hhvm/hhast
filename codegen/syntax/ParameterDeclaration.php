<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<3474aa756b80815b34e52c5414722344>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class ParameterDeclaration extends EditableNode {

  private EditableNode $_attribute;
  private EditableNode $_visibility;
  private EditableNode $_type;
  private EditableNode $_name;
  private EditableNode $_default_value;

  public function __construct(
    EditableNode $attribute,
    EditableNode $visibility,
    EditableNode $type,
    EditableNode $name,
    EditableNode $default_value,
  ) {
    parent::__construct('parameter_declaration');
    $this->_attribute = $attribute;
    $this->_visibility = $visibility;
    $this->_type = $type;
    $this->_name = $name;
    $this->_default_value = $default_value;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
  ): this {
    $attribute = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['parameter_attribute'],
      $file,
      $offset,
      $source,
    );
    $offset += $attribute->getWidth();
    $visibility = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['parameter_visibility'],
      $file,
      $offset,
      $source,
    );
    $offset += $visibility->getWidth();
    $type = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['parameter_type'],
      $file,
      $offset,
      $source,
    );
    $offset += $type->getWidth();
    $name = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['parameter_name'],
      $file,
      $offset,
      $source,
    );
    $offset += $name->getWidth();
    $default_value = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['parameter_default_value'],
      $file,
      $offset,
      $source,
    );
    $offset += $default_value->getWidth();
    return new self($attribute, $visibility, $type, $name, $default_value);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableNode> {
    return dict[
      'attribute' => $this->_attribute,
      'visibility' => $this->_visibility,
      'type' => $this->_type,
      'name' => $this->_name,
      'default_value' => $this->_default_value,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?Traversable<EditableNode> $parents = null,
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

  public function getAttributeUNTYPED(): EditableNode {
    return $this->_attribute;
  }

  public function withAttribute(EditableNode $value): this {
    if ($value === $this->_attribute) {
      return $this;
    }
    return new self(
      $value,
      $this->_visibility,
      $this->_type,
      $this->_name,
      $this->_default_value,
    );
  }

  public function hasAttribute(): bool {
    return !$this->_attribute->isMissing();
  }

  /**
   * @returns Missing | AttributeSpecification
   */
  public function getAttribute(): ?AttributeSpecification {
    if ($this->_attribute->isMissing()) {
      return null;
    }
    return
      TypeAssert\instance_of(AttributeSpecification::class, $this->_attribute);
  }

  /**
   * @returns AttributeSpecification
   */
  public function getAttributex(): AttributeSpecification {
    return
      TypeAssert\instance_of(AttributeSpecification::class, $this->_attribute);
  }

  public function getVisibilityUNTYPED(): EditableNode {
    return $this->_visibility;
  }

  public function withVisibility(EditableNode $value): this {
    if ($value === $this->_visibility) {
      return $this;
    }
    return new self(
      $this->_attribute,
      $value,
      $this->_type,
      $this->_name,
      $this->_default_value,
    );
  }

  public function hasVisibility(): bool {
    return !$this->_visibility->isMissing();
  }

  /**
   * @returns Missing | ProtectedToken | PublicToken | PrivateToken
   */
  public function getVisibility(): ?EditableToken {
    if ($this->_visibility->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableToken::class, $this->_visibility);
  }

  /**
   * @returns ProtectedToken | PublicToken | PrivateToken
   */
  public function getVisibilityx(): EditableToken {
    return TypeAssert\instance_of(EditableToken::class, $this->_visibility);
  }

  public function getTypeUNTYPED(): EditableNode {
    return $this->_type;
  }

  public function withType(EditableNode $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return new self(
      $this->_attribute,
      $this->_visibility,
      $value,
      $this->_name,
      $this->_default_value,
    );
  }

  public function hasType(): bool {
    return !$this->_type->isMissing();
  }

  /**
   * @returns Missing | SimpleTypeSpecifier | NullableTypeSpecifier |
   * GenericTypeSpecifier | DictionaryTypeSpecifier | TypeConstant |
   * SoftTypeSpecifier | ClosureTypeSpecifier | TupleTypeSpecifier |
   * ClassnameTypeSpecifier | KeysetTypeSpecifier | ShapeTypeSpecifier |
   * VectorTypeSpecifier | MapArrayTypeSpecifier | VarrayTypeSpecifier |
   * DarrayTypeSpecifier | VectorArrayTypeSpecifier
   */
  public function getType(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_type);
  }

  public function getNameUNTYPED(): EditableNode {
    return $this->_name;
  }

  public function withName(EditableNode $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new self(
      $this->_attribute,
      $this->_visibility,
      $this->_type,
      $value,
      $this->_default_value,
    );
  }

  public function hasName(): bool {
    return !$this->_name->isMissing();
  }

  /**
   * @returns VariableToken | DecoratedExpression | Missing
   */
  public function getName(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_name);
  }

  public function getDefaultValueUNTYPED(): EditableNode {
    return $this->_default_value;
  }

  public function withDefaultValue(EditableNode $value): this {
    if ($value === $this->_default_value) {
      return $this;
    }
    return new self(
      $this->_attribute,
      $this->_visibility,
      $this->_type,
      $this->_name,
      $value,
    );
  }

  public function hasDefaultValue(): bool {
    return !$this->_default_value->isMissing();
  }

  /**
   * @returns Missing | SimpleInitializer
   */
  public function getDefaultValue(): ?SimpleInitializer {
    if ($this->_default_value->isMissing()) {
      return null;
    }
    return
      TypeAssert\instance_of(SimpleInitializer::class, $this->_default_value);
  }

  /**
   * @returns SimpleInitializer
   */
  public function getDefaultValuex(): SimpleInitializer {
    return
      TypeAssert\instance_of(SimpleInitializer::class, $this->_default_value);
  }
}
