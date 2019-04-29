/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<e3dd58686234b0f58cb93aae25932208>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class ParameterDeclaration extends EditableNode {

  private EditableNode $_attribute;
  private EditableNode $_visibility;
  private EditableNode $_call_convention;
  private EditableNode $_type;
  private EditableNode $_name;
  private EditableNode $_default_value;

  public function __construct(
    EditableNode $attribute,
    EditableNode $visibility,
    EditableNode $call_convention,
    EditableNode $type,
    EditableNode $name,
    EditableNode $default_value,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_attribute = $attribute;
    $this->_visibility = $visibility;
    $this->_call_convention = $call_convention;
    $this->_type = $type;
    $this->_name = $name;
    $this->_default_value = $default_value;
    parent::__construct('parameter_declaration', $source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
  ): this {
    $offset = $initial_offset;
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
    $call_convention = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['parameter_call_convention'],
      $file,
      $offset,
      $source,
    );
    $offset += $call_convention->getWidth();
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
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      $attribute,
      $visibility,
      $call_convention,
      $type,
      $name,
      $default_value,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'attribute' => $this->_attribute,
      'visibility' => $this->_visibility,
      'call_convention' => $this->_call_convention,
      'type' => $this->_type,
      'name' => $this->_name,
      'default_value' => $this->_default_value,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<EditableNode> $parents = vec[],
  ): this {
    $parents[] = $this;
    $attribute = $rewriter($this->_attribute, $parents);
    $visibility = $rewriter($this->_visibility, $parents);
    $call_convention = $rewriter($this->_call_convention, $parents);
    $type = $rewriter($this->_type, $parents);
    $name = $rewriter($this->_name, $parents);
    $default_value = $rewriter($this->_default_value, $parents);
    if (
      $attribute === $this->_attribute &&
      $visibility === $this->_visibility &&
      $call_convention === $this->_call_convention &&
      $type === $this->_type &&
      $name === $this->_name &&
      $default_value === $this->_default_value
    ) {
      return $this;
    }
    return new static(
      $attribute,
      $visibility,
      $call_convention,
      $type,
      $name,
      $default_value,
    );
  }

  public function getAttributeUNTYPED(): EditableNode {
    return $this->_attribute;
  }

  public function withAttribute(EditableNode $value): this {
    if ($value === $this->_attribute) {
      return $this;
    }
    return new static(
      $value,
      $this->_visibility,
      $this->_call_convention,
      $this->_type,
      $this->_name,
      $this->_default_value,
    );
  }

  public function hasAttribute(): bool {
    return !$this->_attribute->isMissing();
  }

  /**
   * @return AttributeSpecification | null
   */
  public function getAttribute(): ?AttributeSpecification {
    if ($this->_attribute->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(
      AttributeSpecification::class,
      $this->_attribute,
    );
  }

  /**
   * @return AttributeSpecification
   */
  public function getAttributex(): AttributeSpecification {
    return TypeAssert\instance_of(
      AttributeSpecification::class,
      $this->_attribute,
    );
  }

  public function getVisibilityUNTYPED(): EditableNode {
    return $this->_visibility;
  }

  public function withVisibility(EditableNode $value): this {
    if ($value === $this->_visibility) {
      return $this;
    }
    return new static(
      $this->_attribute,
      $value,
      $this->_call_convention,
      $this->_type,
      $this->_name,
      $this->_default_value,
    );
  }

  public function hasVisibility(): bool {
    return !$this->_visibility->isMissing();
  }

  /**
   * @return null | PrivateToken | ProtectedToken | PublicToken
   */
  public function getVisibility(): ?EditableToken {
    if ($this->_visibility->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableToken::class, $this->_visibility);
  }

  /**
   * @return PrivateToken | ProtectedToken | PublicToken
   */
  public function getVisibilityx(): EditableToken {
    return TypeAssert\instance_of(EditableToken::class, $this->_visibility);
  }

  public function getCallConventionUNTYPED(): EditableNode {
    return $this->_call_convention;
  }

  public function withCallConvention(EditableNode $value): this {
    if ($value === $this->_call_convention) {
      return $this;
    }
    return new static(
      $this->_attribute,
      $this->_visibility,
      $value,
      $this->_type,
      $this->_name,
      $this->_default_value,
    );
  }

  public function hasCallConvention(): bool {
    return !$this->_call_convention->isMissing();
  }

  /**
   * @return null | InoutToken
   */
  public function getCallConvention(): ?InoutToken {
    if ($this->_call_convention->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(InoutToken::class, $this->_call_convention);
  }

  /**
   * @return InoutToken
   */
  public function getCallConventionx(): InoutToken {
    return TypeAssert\instance_of(InoutToken::class, $this->_call_convention);
  }

  public function getTypeUNTYPED(): EditableNode {
    return $this->_type;
  }

  public function withType(EditableNode $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return new static(
      $this->_attribute,
      $this->_visibility,
      $this->_call_convention,
      $value,
      $this->_name,
      $this->_default_value,
    );
  }

  public function hasType(): bool {
    return !$this->_type->isMissing();
  }

  /**
   * @return ClassnameTypeSpecifier | ClosureTypeSpecifier |
   * DarrayTypeSpecifier | DictionaryTypeSpecifier | GenericTypeSpecifier |
   * KeysetTypeSpecifier | LikeTypeSpecifier | MapArrayTypeSpecifier | null |
   * NullableTypeSpecifier | ShapeTypeSpecifier | SimpleTypeSpecifier |
   * SoftTypeSpecifier | TupleTypeSpecifier | TypeConstant |
   * VarrayTypeSpecifier | VectorArrayTypeSpecifier | VectorTypeSpecifier
   */
  public function getType(): ?EditableNode {
    if ($this->_type->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableNode::class, $this->_type);
  }

  /**
   * @return ClassnameTypeSpecifier | ClosureTypeSpecifier |
   * DarrayTypeSpecifier | DictionaryTypeSpecifier | GenericTypeSpecifier |
   * KeysetTypeSpecifier | LikeTypeSpecifier | MapArrayTypeSpecifier |
   * NullableTypeSpecifier | ShapeTypeSpecifier | SimpleTypeSpecifier |
   * SoftTypeSpecifier | TupleTypeSpecifier | TypeConstant |
   * VarrayTypeSpecifier | VectorArrayTypeSpecifier | VectorTypeSpecifier
   */
  public function getTypex(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_type);
  }

  public function getNameUNTYPED(): EditableNode {
    return $this->_name;
  }

  public function withName(EditableNode $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new static(
      $this->_attribute,
      $this->_visibility,
      $this->_call_convention,
      $this->_type,
      $value,
      $this->_default_value,
    );
  }

  public function hasName(): bool {
    return !$this->_name->isMissing();
  }

  /**
   * @return DecoratedExpression | null | VariableToken
   */
  public function getName(): ?EditableNode {
    if ($this->_name->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableNode::class, $this->_name);
  }

  /**
   * @return DecoratedExpression | VariableToken
   */
  public function getNamex(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_name);
  }

  public function getDefaultValueUNTYPED(): EditableNode {
    return $this->_default_value;
  }

  public function withDefaultValue(EditableNode $value): this {
    if ($value === $this->_default_value) {
      return $this;
    }
    return new static(
      $this->_attribute,
      $this->_visibility,
      $this->_call_convention,
      $this->_type,
      $this->_name,
      $value,
    );
  }

  public function hasDefaultValue(): bool {
    return !$this->_default_value->isMissing();
  }

  /**
   * @return null | SimpleInitializer
   */
  public function getDefaultValue(): ?SimpleInitializer {
    if ($this->_default_value->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(
      SimpleInitializer::class,
      $this->_default_value,
    );
  }

  /**
   * @return SimpleInitializer
   */
  public function getDefaultValuex(): SimpleInitializer {
    return TypeAssert\instance_of(
      SimpleInitializer::class,
      $this->_default_value,
    );
  }
}
