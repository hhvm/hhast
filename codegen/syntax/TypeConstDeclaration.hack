/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<37bdb7485a9f1d71415c04794a9c41c8>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class TypeConstDeclaration extends EditableNode {

  private EditableNode $_attribute_spec;
  private EditableNode $_abstract;
  private EditableNode $_keyword;
  private EditableNode $_type_keyword;
  private EditableNode $_name;
  private EditableNode $_type_parameters;
  private EditableNode $_type_constraint;
  private EditableNode $_equal;
  private EditableNode $_type_specifier;
  private EditableNode $_semicolon;

  public function __construct(
    EditableNode $attribute_spec,
    EditableNode $abstract,
    EditableNode $keyword,
    EditableNode $type_keyword,
    EditableNode $name,
    EditableNode $type_parameters,
    EditableNode $type_constraint,
    EditableNode $equal,
    EditableNode $type_specifier,
    EditableNode $semicolon,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_attribute_spec = $attribute_spec;
    $this->_abstract = $abstract;
    $this->_keyword = $keyword;
    $this->_type_keyword = $type_keyword;
    $this->_name = $name;
    $this->_type_parameters = $type_parameters;
    $this->_type_constraint = $type_constraint;
    $this->_equal = $equal;
    $this->_type_specifier = $type_specifier;
    $this->_semicolon = $semicolon;
    parent::__construct('type_const_declaration', $source_ref);
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
      /* UNSAFE_EXPR */ $json['type_const_attribute_spec'],
      $file,
      $offset,
      $source,
    );
    $offset += $attribute_spec->getWidth();
    $abstract = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['type_const_abstract'],
      $file,
      $offset,
      $source,
    );
    $offset += $abstract->getWidth();
    $keyword = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['type_const_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $keyword->getWidth();
    $type_keyword = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['type_const_type_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $type_keyword->getWidth();
    $name = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['type_const_name'],
      $file,
      $offset,
      $source,
    );
    $offset += $name->getWidth();
    $type_parameters = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['type_const_type_parameters'],
      $file,
      $offset,
      $source,
    );
    $offset += $type_parameters->getWidth();
    $type_constraint = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['type_const_type_constraint'],
      $file,
      $offset,
      $source,
    );
    $offset += $type_constraint->getWidth();
    $equal = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['type_const_equal'],
      $file,
      $offset,
      $source,
    );
    $offset += $equal->getWidth();
    $type_specifier = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['type_const_type_specifier'],
      $file,
      $offset,
      $source,
    );
    $offset += $type_specifier->getWidth();
    $semicolon = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['type_const_semicolon'],
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
      $abstract,
      $keyword,
      $type_keyword,
      $name,
      $type_parameters,
      $type_constraint,
      $equal,
      $type_specifier,
      $semicolon,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'attribute_spec' => $this->_attribute_spec,
      'abstract' => $this->_abstract,
      'keyword' => $this->_keyword,
      'type_keyword' => $this->_type_keyword,
      'name' => $this->_name,
      'type_parameters' => $this->_type_parameters,
      'type_constraint' => $this->_type_constraint,
      'equal' => $this->_equal,
      'type_specifier' => $this->_type_specifier,
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
    $abstract = $rewriter($this->_abstract, $parents);
    $keyword = $rewriter($this->_keyword, $parents);
    $type_keyword = $rewriter($this->_type_keyword, $parents);
    $name = $rewriter($this->_name, $parents);
    $type_parameters = $rewriter($this->_type_parameters, $parents);
    $type_constraint = $rewriter($this->_type_constraint, $parents);
    $equal = $rewriter($this->_equal, $parents);
    $type_specifier = $rewriter($this->_type_specifier, $parents);
    $semicolon = $rewriter($this->_semicolon, $parents);
    if (
      $attribute_spec === $this->_attribute_spec &&
      $abstract === $this->_abstract &&
      $keyword === $this->_keyword &&
      $type_keyword === $this->_type_keyword &&
      $name === $this->_name &&
      $type_parameters === $this->_type_parameters &&
      $type_constraint === $this->_type_constraint &&
      $equal === $this->_equal &&
      $type_specifier === $this->_type_specifier &&
      $semicolon === $this->_semicolon
    ) {
      return $this;
    }
    return new static(
      $attribute_spec,
      $abstract,
      $keyword,
      $type_keyword,
      $name,
      $type_parameters,
      $type_constraint,
      $equal,
      $type_specifier,
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
      $this->_abstract,
      $this->_keyword,
      $this->_type_keyword,
      $this->_name,
      $this->_type_parameters,
      $this->_type_constraint,
      $this->_equal,
      $this->_type_specifier,
      $this->_semicolon,
    );
  }

  public function hasAttributeSpec(): bool {
    return !$this->_attribute_spec->isMissing();
  }

  /**
   * @return null
   */
  public function getAttributeSpec(): ?EditableNode {
    if ($this->_attribute_spec->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableNode::class, $this->_attribute_spec);
  }

  /**
   * @return
   */
  public function getAttributeSpecx(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_attribute_spec);
  }

  public function getAbstractUNTYPED(): EditableNode {
    return $this->_abstract;
  }

  public function withAbstract(EditableNode $value): this {
    if ($value === $this->_abstract) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $value,
      $this->_keyword,
      $this->_type_keyword,
      $this->_name,
      $this->_type_parameters,
      $this->_type_constraint,
      $this->_equal,
      $this->_type_specifier,
      $this->_semicolon,
    );
  }

  public function hasAbstract(): bool {
    return !$this->_abstract->isMissing();
  }

  /**
   * @return null | AbstractToken
   */
  public function getAbstract(): ?AbstractToken {
    if ($this->_abstract->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(AbstractToken::class, $this->_abstract);
  }

  /**
   * @return AbstractToken
   */
  public function getAbstractx(): AbstractToken {
    return TypeAssert\instance_of(AbstractToken::class, $this->_abstract);
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
      $this->_abstract,
      $value,
      $this->_type_keyword,
      $this->_name,
      $this->_type_parameters,
      $this->_type_constraint,
      $this->_equal,
      $this->_type_specifier,
      $this->_semicolon,
    );
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  /**
   * @return ConstToken
   */
  public function getKeyword(): ConstToken {
    return TypeAssert\instance_of(ConstToken::class, $this->_keyword);
  }

  /**
   * @return ConstToken
   */
  public function getKeywordx(): ConstToken {
    return $this->getKeyword();
  }

  public function getTypeKeywordUNTYPED(): EditableNode {
    return $this->_type_keyword;
  }

  public function withTypeKeyword(EditableNode $value): this {
    if ($value === $this->_type_keyword) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_abstract,
      $this->_keyword,
      $value,
      $this->_name,
      $this->_type_parameters,
      $this->_type_constraint,
      $this->_equal,
      $this->_type_specifier,
      $this->_semicolon,
    );
  }

  public function hasTypeKeyword(): bool {
    return !$this->_type_keyword->isMissing();
  }

  /**
   * @return TypeToken
   */
  public function getTypeKeyword(): TypeToken {
    return TypeAssert\instance_of(TypeToken::class, $this->_type_keyword);
  }

  /**
   * @return TypeToken
   */
  public function getTypeKeywordx(): TypeToken {
    return $this->getTypeKeyword();
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
      $this->_abstract,
      $this->_keyword,
      $this->_type_keyword,
      $value,
      $this->_type_parameters,
      $this->_type_constraint,
      $this->_equal,
      $this->_type_specifier,
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

  public function getTypeParametersUNTYPED(): EditableNode {
    return $this->_type_parameters;
  }

  public function withTypeParameters(EditableNode $value): this {
    if ($value === $this->_type_parameters) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_abstract,
      $this->_keyword,
      $this->_type_keyword,
      $this->_name,
      $value,
      $this->_type_constraint,
      $this->_equal,
      $this->_type_specifier,
      $this->_semicolon,
    );
  }

  public function hasTypeParameters(): bool {
    return !$this->_type_parameters->isMissing();
  }

  /**
   * @return null
   */
  public function getTypeParameters(): ?EditableNode {
    if ($this->_type_parameters->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableNode::class, $this->_type_parameters);
  }

  /**
   * @return
   */
  public function getTypeParametersx(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_type_parameters);
  }

  public function getTypeConstraintUNTYPED(): EditableNode {
    return $this->_type_constraint;
  }

  public function withTypeConstraint(EditableNode $value): this {
    if ($value === $this->_type_constraint) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_abstract,
      $this->_keyword,
      $this->_type_keyword,
      $this->_name,
      $this->_type_parameters,
      $value,
      $this->_equal,
      $this->_type_specifier,
      $this->_semicolon,
    );
  }

  public function hasTypeConstraint(): bool {
    return !$this->_type_constraint->isMissing();
  }

  /**
   * @return null | TypeConstraint
   */
  public function getTypeConstraint(): ?TypeConstraint {
    if ($this->_type_constraint->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(
      TypeConstraint::class,
      $this->_type_constraint,
    );
  }

  /**
   * @return TypeConstraint
   */
  public function getTypeConstraintx(): TypeConstraint {
    return TypeAssert\instance_of(
      TypeConstraint::class,
      $this->_type_constraint,
    );
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
      $this->_abstract,
      $this->_keyword,
      $this->_type_keyword,
      $this->_name,
      $this->_type_parameters,
      $this->_type_constraint,
      $value,
      $this->_type_specifier,
      $this->_semicolon,
    );
  }

  public function hasEqual(): bool {
    return !$this->_equal->isMissing();
  }

  /**
   * @return null | EqualToken
   */
  public function getEqual(): ?EqualToken {
    if ($this->_equal->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EqualToken::class, $this->_equal);
  }

  /**
   * @return EqualToken
   */
  public function getEqualx(): EqualToken {
    return TypeAssert\instance_of(EqualToken::class, $this->_equal);
  }

  public function getTypeSpecifierUNTYPED(): EditableNode {
    return $this->_type_specifier;
  }

  public function withTypeSpecifier(EditableNode $value): this {
    if ($value === $this->_type_specifier) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_abstract,
      $this->_keyword,
      $this->_type_keyword,
      $this->_name,
      $this->_type_parameters,
      $this->_type_constraint,
      $this->_equal,
      $value,
      $this->_semicolon,
    );
  }

  public function hasTypeSpecifier(): bool {
    return !$this->_type_specifier->isMissing();
  }

  /**
   * @return ClosureTypeSpecifier | DictionaryTypeSpecifier |
   * GenericTypeSpecifier | KeysetTypeSpecifier | LikeTypeSpecifier | null |
   * NullableTypeSpecifier | ShapeTypeSpecifier | SimpleTypeSpecifier |
   * TupleTypeSpecifier | TypeConstant | VectorTypeSpecifier
   */
  public function getTypeSpecifier(): ?EditableNode {
    if ($this->_type_specifier->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableNode::class, $this->_type_specifier);
  }

  /**
   * @return ClosureTypeSpecifier | DictionaryTypeSpecifier |
   * GenericTypeSpecifier | KeysetTypeSpecifier | LikeTypeSpecifier |
   * NullableTypeSpecifier | ShapeTypeSpecifier | SimpleTypeSpecifier |
   * TupleTypeSpecifier | TypeConstant | VectorTypeSpecifier
   */
  public function getTypeSpecifierx(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_type_specifier);
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
      $this->_abstract,
      $this->_keyword,
      $this->_type_keyword,
      $this->_name,
      $this->_type_parameters,
      $this->_type_constraint,
      $this->_equal,
      $this->_type_specifier,
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
