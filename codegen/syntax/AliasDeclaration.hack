/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<073db91fd5c8f3325722d769d4fc9337>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class AliasDeclaration extends EditableNode implements IHasAttributeSpec {

  const string SYNTAX_KIND = 'alias_declaration';

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
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_attribute_spec = $attribute_spec;
    $this->_keyword = $keyword;
    $this->_name = $name;
    $this->_generic_parameter = $generic_parameter;
    $this->_constraint = $constraint;
    $this->_equal = $equal;
    $this->_type = $type;
    $this->_semicolon = $semicolon;
    parent::__construct($source_ref);
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
      /* UNSAFE_EXPR */ $json['alias_attribute_spec'],
      $file,
      $offset,
      $source,
    );
    $offset += $attribute_spec->getWidth();
    $keyword = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['alias_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $keyword->getWidth();
    $name = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['alias_name'],
      $file,
      $offset,
      $source,
    );
    $offset += $name->getWidth();
    $generic_parameter = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['alias_generic_parameter'],
      $file,
      $offset,
      $source,
    );
    $offset += $generic_parameter->getWidth();
    $constraint = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['alias_constraint'],
      $file,
      $offset,
      $source,
    );
    $offset += $constraint->getWidth();
    $equal = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['alias_equal'],
      $file,
      $offset,
      $source,
    );
    $offset += $equal->getWidth();
    $type = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['alias_type'],
      $file,
      $offset,
      $source,
    );
    $offset += $type->getWidth();
    $semicolon = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['alias_semicolon'],
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
      $keyword,
      $name,
      $generic_parameter,
      $constraint,
      $equal,
      $type,
      $semicolon,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'attribute_spec' => $this->_attribute_spec,
      'keyword' => $this->_keyword,
      'name' => $this->_name,
      'generic_parameter' => $this->_generic_parameter,
      'constraint' => $this->_constraint,
      'equal' => $this->_equal,
      'type' => $this->_type,
      'semicolon' => $this->_semicolon,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<EditableNode> $parents = vec[],
  ): this {
    $parents[] = $this;
    $attribute_spec = $rewriter($this->_attribute_spec, $parents);
    $keyword = $rewriter($this->_keyword, $parents);
    $name = $rewriter($this->_name, $parents);
    $generic_parameter = $rewriter($this->_generic_parameter, $parents);
    $constraint = $rewriter($this->_constraint, $parents);
    $equal = $rewriter($this->_equal, $parents);
    $type = $rewriter($this->_type, $parents);
    $semicolon = $rewriter($this->_semicolon, $parents);
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
    return new static(
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
    return new static(
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
    return TypeAssert\not_null($this->getAttributeSpec());
  }

  public function getKeywordUNTYPED(): EditableNode {
    return $this->_keyword;
  }

  public function withKeyword(EditableNode $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static(
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
   * @return NewtypeToken | TypeToken
   */
  public function getKeyword(): EditableToken {
    return TypeAssert\instance_of(EditableToken::class, $this->_keyword);
  }

  /**
   * @return NewtypeToken | TypeToken
   */
  public function getKeywordx(): EditableToken {
    return $this->getKeyword();
  }

  public function getNameUNTYPED(): EditableNode {
    return $this->_name;
  }

  public function withName(EditableNode $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new static(
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
   * @return NameToken
   */
  public function getName(): NameToken {
    return TypeAssert\instance_of(NameToken::class, $this->_name);
  }

  /**
   * @return NameToken
   */
  public function getNamex(): NameToken {
    return $this->getName();
  }

  public function getGenericParameterUNTYPED(): EditableNode {
    return $this->_generic_parameter;
  }

  public function withGenericParameter(EditableNode $value): this {
    if ($value === $this->_generic_parameter) {
      return $this;
    }
    return new static(
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
   * @return null | TypeParameters
   */
  public function getGenericParameter(): ?TypeParameters {
    if ($this->_generic_parameter->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(
      TypeParameters::class,
      $this->_generic_parameter,
    );
  }

  /**
   * @return TypeParameters
   */
  public function getGenericParameterx(): TypeParameters {
    return TypeAssert\not_null($this->getGenericParameter());
  }

  public function getConstraintUNTYPED(): EditableNode {
    return $this->_constraint;
  }

  public function withConstraint(EditableNode $value): this {
    if ($value === $this->_constraint) {
      return $this;
    }
    return new static(
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
   * @return null | TypeConstraint
   */
  public function getConstraint(): ?TypeConstraint {
    if ($this->_constraint->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(TypeConstraint::class, $this->_constraint);
  }

  /**
   * @return TypeConstraint
   */
  public function getConstraintx(): TypeConstraint {
    return TypeAssert\not_null($this->getConstraint());
  }

  public function getEqualUNTYPED(): EditableNode {
    return $this->_equal;
  }

  public function withEqual(EditableNode $value): this {
    if ($value === $this->_equal) {
      return $this;
    }
    return new static(
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
   * @return EqualToken
   */
  public function getEqual(): EqualToken {
    return TypeAssert\instance_of(EqualToken::class, $this->_equal);
  }

  /**
   * @return EqualToken
   */
  public function getEqualx(): EqualToken {
    return $this->getEqual();
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
   * @return ClosureTypeSpecifier | DictionaryTypeSpecifier |
   * GenericTypeSpecifier | KeysetTypeSpecifier | MapArrayTypeSpecifier |
   * NullableTypeSpecifier | ShapeTypeSpecifier | SimpleTypeSpecifier |
   * TupleTypeSpecifier | VectorArrayTypeSpecifier | VectorTypeSpecifier
   */
  public function getType(): ITypeSpecifier {
    return TypeAssert\instance_of(ITypeSpecifier::class, $this->_type);
  }

  /**
   * @return ClosureTypeSpecifier | DictionaryTypeSpecifier |
   * GenericTypeSpecifier | KeysetTypeSpecifier | MapArrayTypeSpecifier |
   * NullableTypeSpecifier | ShapeTypeSpecifier | SimpleTypeSpecifier |
   * TupleTypeSpecifier | VectorArrayTypeSpecifier | VectorTypeSpecifier
   */
  public function getTypex(): ITypeSpecifier {
    return $this->getType();
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
