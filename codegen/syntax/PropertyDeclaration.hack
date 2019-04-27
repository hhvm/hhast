/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<60aa7a3bb9ae37e5b2bc7c379dce9790>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class PropertyDeclaration extends EditableNode {

  private EditableNode $_attribute_spec;
  private EditableNode $_modifiers;
  private EditableNode $_type;
  private EditableNode $_declarators;
  private EditableNode $_semicolon;

  public function __construct(
    EditableNode $attribute_spec,
    EditableNode $modifiers,
    EditableNode $type,
    EditableNode $declarators,
    EditableNode $semicolon,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_attribute_spec = $attribute_spec;
    $this->_modifiers = $modifiers;
    $this->_type = $type;
    $this->_declarators = $declarators;
    $this->_semicolon = $semicolon;
    parent::__construct('property_declaration', $source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
  ): this {
    $offset = $initial_offset;
    $attribute_spec = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['property_attribute_spec'],
      $file,
      $offset,
      $source,
    );
    $offset += $attribute_spec->getWidth();
    $modifiers = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['property_modifiers'],
      $file,
      $offset,
      $source,
    );
    $offset += $modifiers->getWidth();
    $type = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['property_type'],
      $file,
      $offset,
      $source,
    );
    $offset += $type->getWidth();
    $declarators = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['property_declarators'],
      $file,
      $offset,
      $source,
    );
    $offset += $declarators->getWidth();
    $semicolon = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['property_semicolon'],
      $file,
      $offset,
      $source,
    );
    $offset += $semicolon->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      $attribute_spec,
      $modifiers,
      $type,
      $declarators,
      $semicolon,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'attribute_spec' => $this->_attribute_spec,
      'modifiers' => $this->_modifiers,
      'type' => $this->_type,
      'declarators' => $this->_declarators,
      'semicolon' => $this->_semicolon,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    vec<EditableNode> $parents = vec[],
  ): this {
    $parents[] = $this;
    $attribute_spec = $this->_attribute_spec->rewrite($rewriter, $parents);
    $modifiers = $this->_modifiers->rewrite($rewriter, $parents);
    $type = $this->_type->rewrite($rewriter, $parents);
    $declarators = $this->_declarators->rewrite($rewriter, $parents);
    $semicolon = $this->_semicolon->rewrite($rewriter, $parents);
    if (
      $attribute_spec === $this->_attribute_spec &&
      $modifiers === $this->_modifiers &&
      $type === $this->_type &&
      $declarators === $this->_declarators &&
      $semicolon === $this->_semicolon
    ) {
      return $this;
    }
    return new static(
      $attribute_spec,
      $modifiers,
      $type,
      $declarators,
      $semicolon,
    );
  }

  public function getAttributeSpecUNTYPED(): EditableNode {
    return $this->_attribute_spec;
  }

  public function withAttributeSpec(EditableNode $value): this {
    if ($value === $this->_attribute_spec) {
      return $this;
    }
    return new static(
      $value,
      $this->_modifiers,
      $this->_type,
      $this->_declarators,
      $this->_semicolon,
    );
  }

  public function hasAttributeSpec(): bool {
    return !$this->_attribute_spec->isMissing();
  }

  /**
   * @return AttributeSpecification | null
   */
  public function getAttributeSpec(): ?AttributeSpecification {
    if ($this->_attribute_spec->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(
      AttributeSpecification::class,
      $this->_attribute_spec,
    );
  }

  /**
   * @return AttributeSpecification
   */
  public function getAttributeSpecx(): AttributeSpecification {
    return TypeAssert\instance_of(
      AttributeSpecification::class,
      $this->_attribute_spec,
    );
  }

  public function getModifiersUNTYPED(): EditableNode {
    return $this->_modifiers;
  }

  public function withModifiers(EditableNode $value): this {
    if ($value === $this->_modifiers) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $value,
      $this->_type,
      $this->_declarators,
      $this->_semicolon,
    );
  }

  public function hasModifiers(): bool {
    return !$this->_modifiers->isMissing();
  }

  /**
   * @return EditableList<EditableNode> | VarToken
   */
  public function getModifiers(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_modifiers);
  }

  /**
   * @return EditableList<EditableNode> | VarToken
   */
  public function getModifiersx(): EditableNode {
    return $this->getModifiers();
  }

  public function getTypeUNTYPED(): EditableNode {
    return $this->_type;
  }

  public function withType(EditableNode $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_modifiers,
      $value,
      $this->_declarators,
      $this->_semicolon,
    );
  }

  public function hasType(): bool {
    return !$this->_type->isMissing();
  }

  /**
   * @return ClosureTypeSpecifier | DarrayTypeSpecifier |
   * DictionaryTypeSpecifier | GenericTypeSpecifier | LikeTypeSpecifier |
   * MapArrayTypeSpecifier | null | NullableTypeSpecifier | SimpleTypeSpecifier
   * | SoftTypeSpecifier | TupleTypeSpecifier | TypeConstant |
   * VarrayTypeSpecifier | VectorArrayTypeSpecifier | VectorTypeSpecifier
   */
  public function getType(): ?EditableNode {
    if ($this->_type->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableNode::class, $this->_type);
  }

  /**
   * @return ClosureTypeSpecifier | DarrayTypeSpecifier |
   * DictionaryTypeSpecifier | GenericTypeSpecifier | LikeTypeSpecifier |
   * MapArrayTypeSpecifier | NullableTypeSpecifier | SimpleTypeSpecifier |
   * SoftTypeSpecifier | TupleTypeSpecifier | TypeConstant |
   * VarrayTypeSpecifier | VectorArrayTypeSpecifier | VectorTypeSpecifier
   */
  public function getTypex(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_type);
  }

  public function getDeclaratorsUNTYPED(): EditableNode {
    return $this->_declarators;
  }

  public function withDeclarators(EditableNode $value): this {
    if ($value === $this->_declarators) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_modifiers,
      $this->_type,
      $value,
      $this->_semicolon,
    );
  }

  public function hasDeclarators(): bool {
    return !$this->_declarators->isMissing();
  }

  /**
   * @return EditableList<PropertyDeclarator>
   */
  public function getDeclarators(): EditableList<PropertyDeclarator> {
    return TypeAssert\instance_of(EditableList::class, $this->_declarators);
  }

  /**
   * @return EditableList<PropertyDeclarator>
   */
  public function getDeclaratorsx(): EditableList<PropertyDeclarator> {
    return $this->getDeclarators();
  }

  public function getSemicolonUNTYPED(): EditableNode {
    return $this->_semicolon;
  }

  public function withSemicolon(EditableNode $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_modifiers,
      $this->_type,
      $this->_declarators,
      $value,
    );
  }

  public function hasSemicolon(): bool {
    return !$this->_semicolon->isMissing();
  }

  /**
   * @return SemicolonToken
   */
  public function getSemicolon(): SemicolonToken {
    return TypeAssert\instance_of(SemicolonToken::class, $this->_semicolon);
  }

  /**
   * @return SemicolonToken
   */
  public function getSemicolonx(): SemicolonToken {
    return $this->getSemicolon();
  }
}
