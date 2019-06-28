/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<6206bcd396507bf10c2d0ff6e00890de>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class TypeConstDeclaration extends Node implements IClassBodyDeclaration {

  const string SYNTAX_KIND = 'type_const_declaration';

  private Node $_attribute_spec;
  private Node $_abstract;
  private Node $_keyword;
  private Node $_type_keyword;
  private Node $_name;
  private Node $_type_parameters;
  private Node $_type_constraint;
  private Node $_equal;
  private Node $_type_specifier;
  private Node $_semicolon;

  public function __construct(
    Node $attribute_spec,
    Node $abstract,
    Node $keyword,
    Node $type_keyword,
    Node $name,
    Node $type_parameters,
    Node $type_constraint,
    Node $equal,
    Node $type_specifier,
    Node $semicolon,
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
    parent::__construct($source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
    string $_type_hint,
  ): this {
    $offset = $initial_offset;
    $attribute_spec = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['type_const_attribute_spec'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $attribute_spec->getWidth();
    $abstract = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['type_const_abstract'],
      $file,
      $offset,
      $source,
      'AbstractToken',
    );
    $offset += $abstract->getWidth();
    $keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['type_const_keyword'],
      $file,
      $offset,
      $source,
      'ConstToken',
    );
    $offset += $keyword->getWidth();
    $type_keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['type_const_type_keyword'],
      $file,
      $offset,
      $source,
      'TypeToken',
    );
    $offset += $type_keyword->getWidth();
    $name = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['type_const_name'],
      $file,
      $offset,
      $source,
      'NameToken',
    );
    $offset += $name->getWidth();
    $type_parameters = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['type_const_type_parameters'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $type_parameters->getWidth();
    $type_constraint = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['type_const_type_constraint'],
      $file,
      $offset,
      $source,
      'TypeConstraint',
    );
    $offset += $type_constraint->getWidth();
    $equal = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['type_const_equal'],
      $file,
      $offset,
      $source,
      'EqualToken',
    );
    $offset += $equal->getWidth();
    $type_specifier = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['type_const_type_specifier'],
      $file,
      $offset,
      $source,
      'ITypeSpecifier',
    );
    $offset += $type_specifier->getWidth();
    $semicolon = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['type_const_semicolon'],
      $file,
      $offset,
      $source,
      'SemicolonToken',
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
  public function getChildren(): dict<string, Node> {
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
    vec<Node> $parents = vec[],
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

  public function getAttributeSpecUNTYPED(): Node {
    return $this->_attribute_spec;
  }

  public function withAttributeSpec(?Node $value): this {
    if ($value === $this->_attribute_spec) {
      return $this;
    }
    return new static(
      $value ?? Missing(),
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
  public function getAttributeSpec(): ?Node {
    if ($this->_attribute_spec->isMissing()) {
      return null;
    }
    return $this->_attribute_spec;
  }

  /**
   * @return
   */
  public function getAttributeSpecx(): Node {
    return TypeAssert\not_null($this->getAttributeSpec());
  }

  public function getAbstractUNTYPED(): Node {
    return $this->_abstract;
  }

  public function withAbstract(?AbstractToken $value): this {
    if ($value === $this->_abstract) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $value ?? Missing(),
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
    return TypeAssert\not_null($this->getAbstract());
  }

  public function getKeywordUNTYPED(): Node {
    return $this->_keyword;
  }

  public function withKeyword(ConstToken $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_abstract,
      $value ?? Missing(),
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

  public function getTypeKeywordUNTYPED(): Node {
    return $this->_type_keyword;
  }

  public function withTypeKeyword(TypeToken $value): this {
    if ($value === $this->_type_keyword) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_abstract,
      $this->_keyword,
      $value ?? Missing(),
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

  public function getNameUNTYPED(): Node {
    return $this->_name;
  }

  public function withName(NameToken $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_abstract,
      $this->_keyword,
      $this->_type_keyword,
      $value ?? Missing(),
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

  public function getTypeParametersUNTYPED(): Node {
    return $this->_type_parameters;
  }

  public function withTypeParameters(?Node $value): this {
    if ($value === $this->_type_parameters) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_abstract,
      $this->_keyword,
      $this->_type_keyword,
      $this->_name,
      $value ?? Missing(),
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
  public function getTypeParameters(): ?Node {
    if ($this->_type_parameters->isMissing()) {
      return null;
    }
    return $this->_type_parameters;
  }

  /**
   * @return
   */
  public function getTypeParametersx(): Node {
    return TypeAssert\not_null($this->getTypeParameters());
  }

  public function getTypeConstraintUNTYPED(): Node {
    return $this->_type_constraint;
  }

  public function withTypeConstraint(?TypeConstraint $value): this {
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
      $value ?? Missing(),
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
    return TypeAssert\not_null($this->getTypeConstraint());
  }

  public function getEqualUNTYPED(): Node {
    return $this->_equal;
  }

  public function withEqual(?EqualToken $value): this {
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
      $value ?? Missing(),
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
    return TypeAssert\not_null($this->getEqual());
  }

  public function getTypeSpecifierUNTYPED(): Node {
    return $this->_type_specifier;
  }

  public function withTypeSpecifier(?ITypeSpecifier $value): this {
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
      $value ?? Missing(),
      $this->_semicolon,
    );
  }

  public function hasTypeSpecifier(): bool {
    return !$this->_type_specifier->isMissing();
  }

  /**
   * @return ClosureTypeSpecifier | DarrayTypeSpecifier |
   * DictionaryTypeSpecifier | GenericTypeSpecifier | KeysetTypeSpecifier |
   * LikeTypeSpecifier | null | NullableTypeSpecifier | ShapeTypeSpecifier |
   * SimpleTypeSpecifier | TupleTypeSpecifier | TypeConstant |
   * VarrayTypeSpecifier | VectorTypeSpecifier
   */
  public function getTypeSpecifier(): ?ITypeSpecifier {
    if ($this->_type_specifier->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(
      ITypeSpecifier::class,
      $this->_type_specifier,
    );
  }

  /**
   * @return ClosureTypeSpecifier | DarrayTypeSpecifier |
   * DictionaryTypeSpecifier | GenericTypeSpecifier | KeysetTypeSpecifier |
   * LikeTypeSpecifier | NullableTypeSpecifier | ShapeTypeSpecifier |
   * SimpleTypeSpecifier | TupleTypeSpecifier | TypeConstant |
   * VarrayTypeSpecifier | VectorTypeSpecifier
   */
  public function getTypeSpecifierx(): ITypeSpecifier {
    return TypeAssert\not_null($this->getTypeSpecifier());
  }

  public function getSemicolonUNTYPED(): Node {
    return $this->_semicolon;
  }

  public function withSemicolon(SemicolonToken $value): this {
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
      $value ?? Missing(),
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
