<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<796b6b85325adfb6e316fc6fe1eaff6a>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class AliasDeclaration extends EditableNode {

  private EditableNode $_attribute_spec;
  private EditableNode $_keyword;
  private EditableNode $_name;
  private EditableNode $_generic_parameter;
  private EditableNode $_constraint;
  private EditableNode $_equal;
  private EditableNode $_type;
  private EditableNode $_semicolon;

  public function __construct(
    EditableNode $attribute_spec,
    EditableNode $keyword,
    EditableNode $name,
    EditableNode $generic_parameter,
    EditableNode $constraint,
    EditableNode $equal,
    EditableNode $type,
    EditableNode $semicolon,
  ) {
    parent::__construct('alias_declaration');
    $this->_attribute_spec = $attribute_spec;
    $this->_keyword = $keyword;
    $this->_name = $name;
    $this->_generic_parameter = $generic_parameter;
    $this->_constraint = $constraint;
    $this->_equal = $equal;
    $this->_type = $type;
    $this->_semicolon = $semicolon;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $attribute_spec = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['alias_attribute_spec'],
      $position,
      $source,
    );
    $position += $attribute_spec->getWidth();
    $keyword = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['alias_keyword'],
      $position,
      $source,
    );
    $position += $keyword->getWidth();
    $name = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['alias_name'],
      $position,
      $source,
    );
    $position += $name->getWidth();
    $generic_parameter = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['alias_generic_parameter'],
      $position,
      $source,
    );
    $position += $generic_parameter->getWidth();
    $constraint = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['alias_constraint'],
      $position,
      $source,
    );
    $position += $constraint->getWidth();
    $equal = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['alias_equal'],
      $position,
      $source,
    );
    $position += $equal->getWidth();
    $type = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['alias_type'],
      $position,
      $source,
    );
    $position += $type->getWidth();
    $semicolon = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['alias_semicolon'],
      $position,
      $source,
    );
    $position += $semicolon->getWidth();
    return new self(
      $attribute_spec,
      $keyword,
      $name,
      $generic_parameter,
      $constraint,
      $equal,
      $type,
      $semicolon,
    );
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableNode> {
    yield 'attribute_spec' => $this->_attribute_spec;
    yield 'keyword' => $this->_keyword;
    yield 'name' => $this->_name;
    yield 'generic_parameter' => $this->_generic_parameter;
    yield 'constraint' => $this->_constraint;
    yield 'equal' => $this->_equal;
    yield 'type' => $this->_type;
    yield 'semicolon' => $this->_semicolon;
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?Traversable<EditableNode> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $attribute_spec = $this->_attribute_spec->rewrite($rewriter, $parents);
    $keyword = $this->_keyword->rewrite($rewriter, $parents);
    $name = $this->_name->rewrite($rewriter, $parents);
    $generic_parameter =
      $this->_generic_parameter->rewrite($rewriter, $parents);
    $constraint = $this->_constraint->rewrite($rewriter, $parents);
    $equal = $this->_equal->rewrite($rewriter, $parents);
    $type = $this->_type->rewrite($rewriter, $parents);
    $semicolon = $this->_semicolon->rewrite($rewriter, $parents);
    if (
      $attribute_spec === $this->_attribute_spec &&
      $keyword === $this->_keyword &&
      $name === $this->_name &&
      $generic_parameter === $this->_generic_parameter &&
      $constraint === $this->_constraint &&
      $equal === $this->_equal &&
      $type === $this->_type &&
      $semicolon === $this->_semicolon
    ) {
      return $this;
    }
    return new self(
      $attribute_spec,
      $keyword,
      $name,
      $generic_parameter,
      $constraint,
      $equal,
      $type,
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
    return new self(
      $value,
      $this->_keyword,
      $this->_name,
      $this->_generic_parameter,
      $this->_constraint,
      $this->_equal,
      $this->_type,
      $this->_semicolon,
    );
  }

  public function hasAttributeSpec(): bool {
    return !$this->_attribute_spec->isMissing();
  }

  /**
   * @returns Missing | AttributeSpecification
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
   * @returns AttributeSpecification
   */
  public function getAttributeSpecx(): AttributeSpecification {
    return TypeAssert\instance_of(
      AttributeSpecification::class,
      $this->_attribute_spec,
    );
  }

  public function getKeywordUNTYPED(): EditableNode {
    return $this->_keyword;
  }

  public function withKeyword(EditableNode $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new self(
      $this->_attribute_spec,
      $value,
      $this->_name,
      $this->_generic_parameter,
      $this->_constraint,
      $this->_equal,
      $this->_type,
      $this->_semicolon,
    );
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  /**
   * @returns TypeToken | NewtypeToken
   */
  public function getKeyword(): EditableToken {
    return TypeAssert\instance_of(EditableToken::class, $this->_keyword);
  }

  public function getNameUNTYPED(): EditableNode {
    return $this->_name;
  }

  public function withName(EditableNode $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new self(
      $this->_attribute_spec,
      $this->_keyword,
      $value,
      $this->_generic_parameter,
      $this->_constraint,
      $this->_equal,
      $this->_type,
      $this->_semicolon,
    );
  }

  public function hasName(): bool {
    return !$this->_name->isMissing();
  }

  /**
   * @returns NameToken | Missing
   */
  public function getName(): ?NameToken {
    if ($this->_name->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(NameToken::class, $this->_name);
  }

  /**
   * @returns NameToken
   */
  public function getNamex(): NameToken {
    return TypeAssert\instance_of(NameToken::class, $this->_name);
  }

  public function getGenericParameterUNTYPED(): EditableNode {
    return $this->_generic_parameter;
  }

  public function withGenericParameter(EditableNode $value): this {
    if ($value === $this->_generic_parameter) {
      return $this;
    }
    return new self(
      $this->_attribute_spec,
      $this->_keyword,
      $this->_name,
      $value,
      $this->_constraint,
      $this->_equal,
      $this->_type,
      $this->_semicolon,
    );
  }

  public function hasGenericParameter(): bool {
    return !$this->_generic_parameter->isMissing();
  }

  /**
   * @returns Missing | TypeParameters
   */
  public function getGenericParameter(): ?TypeParameters {
    if ($this->_generic_parameter->isMissing()) {
      return null;
    }
    return
      TypeAssert\instance_of(TypeParameters::class, $this->_generic_parameter);
  }

  /**
   * @returns TypeParameters
   */
  public function getGenericParameterx(): TypeParameters {
    return
      TypeAssert\instance_of(TypeParameters::class, $this->_generic_parameter);
  }

  public function getConstraintUNTYPED(): EditableNode {
    return $this->_constraint;
  }

  public function withConstraint(EditableNode $value): this {
    if ($value === $this->_constraint) {
      return $this;
    }
    return new self(
      $this->_attribute_spec,
      $this->_keyword,
      $this->_name,
      $this->_generic_parameter,
      $value,
      $this->_equal,
      $this->_type,
      $this->_semicolon,
    );
  }

  public function hasConstraint(): bool {
    return !$this->_constraint->isMissing();
  }

  /**
   * @returns Missing | TypeConstraint
   */
  public function getConstraint(): ?TypeConstraint {
    if ($this->_constraint->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(TypeConstraint::class, $this->_constraint);
  }

  /**
   * @returns TypeConstraint
   */
  public function getConstraintx(): TypeConstraint {
    return TypeAssert\instance_of(TypeConstraint::class, $this->_constraint);
  }

  public function getEqualUNTYPED(): EditableNode {
    return $this->_equal;
  }

  public function withEqual(EditableNode $value): this {
    if ($value === $this->_equal) {
      return $this;
    }
    return new self(
      $this->_attribute_spec,
      $this->_keyword,
      $this->_name,
      $this->_generic_parameter,
      $this->_constraint,
      $value,
      $this->_type,
      $this->_semicolon,
    );
  }

  public function hasEqual(): bool {
    return !$this->_equal->isMissing();
  }

  /**
   * @returns EqualToken | Missing
   */
  public function getEqual(): ?EqualToken {
    if ($this->_equal->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EqualToken::class, $this->_equal);
  }

  /**
   * @returns EqualToken
   */
  public function getEqualx(): EqualToken {
    return TypeAssert\instance_of(EqualToken::class, $this->_equal);
  }

  public function getTypeUNTYPED(): EditableNode {
    return $this->_type;
  }

  public function withType(EditableNode $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return new self(
      $this->_attribute_spec,
      $this->_keyword,
      $this->_name,
      $this->_generic_parameter,
      $this->_constraint,
      $this->_equal,
      $value,
      $this->_semicolon,
    );
  }

  public function hasType(): bool {
    return !$this->_type->isMissing();
  }

  /**
   * @returns SimpleTypeSpecifier | DictionaryTypeSpecifier |
   * ShapeTypeSpecifier | TupleTypeSpecifier | ClosureTypeSpecifier |
   * GenericTypeSpecifier | NullableTypeSpecifier | KeysetTypeSpecifier |
   * VectorArrayTypeSpecifier
   */
  public function getType(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_type);
  }

  public function getSemicolonUNTYPED(): EditableNode {
    return $this->_semicolon;
  }

  public function withSemicolon(EditableNode $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new self(
      $this->_attribute_spec,
      $this->_keyword,
      $this->_name,
      $this->_generic_parameter,
      $this->_constraint,
      $this->_equal,
      $this->_type,
      $value,
    );
  }

  public function hasSemicolon(): bool {
    return !$this->_semicolon->isMissing();
  }

  /**
   * @returns SemicolonToken
   */
  public function getSemicolon(): SemicolonToken {
    return TypeAssert\instance_of(SemicolonToken::class, $this->_semicolon);
  }
}
