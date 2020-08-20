/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<388a418e0cccc3558e0695320e3330a4>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class AliasDeclaration extends Node implements IHasAttributeSpec {

  const string SYNTAX_KIND = 'alias_declaration';

  private ?OldAttributeSpecification $_attribute_spec;
  private Token $_keyword;
  private NameToken $_name;
  private ?TypeParameters $_generic_parameter;
  private ?TypeConstraint $_constraint;
  private EqualToken $_equal;
  private ITypeSpecifier $_type;
  private SemicolonToken $_semicolon;

  public function __construct(
    ?OldAttributeSpecification $attribute_spec,
    Token $keyword,
    NameToken $name,
    ?TypeParameters $generic_parameter,
    ?TypeConstraint $constraint,
    EqualToken $equal,
    ITypeSpecifier $type,
    SemicolonToken $semicolon,
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
    string $_type_hint,
  ): this {
    $offset = $initial_offset;
    $attribute_spec = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['alias_attribute_spec'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'OldAttributeSpecification',
    );
    $offset += $attribute_spec?->getWidth() ?? 0;
    $keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['alias_keyword'],
      $file,
      $offset,
      $source,
      'Token',
    );
    $keyword = $keyword as nonnull;
    $offset += $keyword->getWidth();
    $name = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['alias_name'],
      $file,
      $offset,
      $source,
      'NameToken',
    );
    $name = $name as nonnull;
    $offset += $name->getWidth();
    $generic_parameter = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['alias_generic_parameter'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'TypeParameters',
    );
    $offset += $generic_parameter?->getWidth() ?? 0;
    $constraint = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['alias_constraint'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'TypeConstraint',
    );
    $offset += $constraint?->getWidth() ?? 0;
    $equal = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['alias_equal'],
      $file,
      $offset,
      $source,
      'EqualToken',
    );
    $equal = $equal as nonnull;
    $offset += $equal->getWidth();
    $type = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['alias_type'],
      $file,
      $offset,
      $source,
      'ITypeSpecifier',
    );
    $type = $type as nonnull;
    $offset += $type->getWidth();
    $semicolon = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['alias_semicolon'],
      $file,
      $offset,
      $source,
      'SemicolonToken',
    );
    $semicolon = $semicolon as nonnull;
    $offset += $semicolon->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $attribute_spec,
      /* HH_IGNORE_ERROR[4110] */ $keyword,
      /* HH_IGNORE_ERROR[4110] */ $name,
      /* HH_IGNORE_ERROR[4110] */ $generic_parameter,
      /* HH_IGNORE_ERROR[4110] */ $constraint,
      /* HH_IGNORE_ERROR[4110] */ $equal,
      /* HH_IGNORE_ERROR[4110] */ $type,
      /* HH_IGNORE_ERROR[4110] */ $semicolon,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'attribute_spec' => $this->_attribute_spec,
      'keyword' => $this->_keyword,
      'name' => $this->_name,
      'generic_parameter' => $this->_generic_parameter,
      'constraint' => $this->_constraint,
      'equal' => $this->_equal,
      'type' => $this->_type,
      'semicolon' => $this->_semicolon,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $attribute_spec = $this->_attribute_spec === null
      ? null
      : $rewriter($this->_attribute_spec, $parents);
    $keyword = $rewriter($this->_keyword, $parents);
    $name = $rewriter($this->_name, $parents);
    $generic_parameter = $this->_generic_parameter === null
      ? null
      : $rewriter($this->_generic_parameter, $parents);
    $constraint = $this->_constraint === null
      ? null
      : $rewriter($this->_constraint, $parents);
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
      /* HH_FIXME[4110] use `as` */ $attribute_spec,
      /* HH_FIXME[4110] use `as` */ $keyword,
      /* HH_FIXME[4110] use `as` */ $name,
      /* HH_FIXME[4110] use `as` */ $generic_parameter,
      /* HH_FIXME[4110] use `as` */ $constraint,
      /* HH_FIXME[4110] use `as` */ $equal,
      /* HH_FIXME[4110] use `as` */ $type,
      /* HH_FIXME[4110] use `as` */ $semicolon,
    );
  }

  public function getAttributeSpecUNTYPED(): ?Node {
    return $this->_attribute_spec;
  }

  public function withAttributeSpec(?OldAttributeSpecification $value): this {
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
    return $this->_attribute_spec !== null;
  }

  /**
   * @return null | OldAttributeSpecification
   */
  public function getAttributeSpec(): ?OldAttributeSpecification {
    return $this->_attribute_spec;
  }

  /**
   * @return OldAttributeSpecification
   */
  public function getAttributeSpecx(): OldAttributeSpecification {
    return TypeAssert\not_null($this->getAttributeSpec());
  }

  public function getKeywordUNTYPED(): ?Node {
    return $this->_keyword;
  }

  public function withKeyword(Token $value): this {
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
    return $this->_keyword !== null;
  }

  /**
   * @return NewtypeToken | TypeToken
   */
  public function getKeyword(): Token {
    return TypeAssert\instance_of(Token::class, $this->_keyword);
  }

  /**
   * @return NewtypeToken | TypeToken
   */
  public function getKeywordx(): Token {
    return $this->getKeyword();
  }

  public function getNameUNTYPED(): ?Node {
    return $this->_name;
  }

  public function withName(NameToken $value): this {
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
    return $this->_name !== null;
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

  public function getGenericParameterUNTYPED(): ?Node {
    return $this->_generic_parameter;
  }

  public function withGenericParameter(?TypeParameters $value): this {
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
    return $this->_generic_parameter !== null;
  }

  /**
   * @return null | TypeParameters
   */
  public function getGenericParameter(): ?TypeParameters {
    return $this->_generic_parameter;
  }

  /**
   * @return TypeParameters
   */
  public function getGenericParameterx(): TypeParameters {
    return TypeAssert\not_null($this->getGenericParameter());
  }

  public function getConstraintUNTYPED(): ?Node {
    return $this->_constraint;
  }

  public function withConstraint(?TypeConstraint $value): this {
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
    return $this->_constraint !== null;
  }

  /**
   * @return null | TypeConstraint
   */
  public function getConstraint(): ?TypeConstraint {
    return $this->_constraint;
  }

  /**
   * @return TypeConstraint
   */
  public function getConstraintx(): TypeConstraint {
    return TypeAssert\not_null($this->getConstraint());
  }

  public function getEqualUNTYPED(): ?Node {
    return $this->_equal;
  }

  public function withEqual(EqualToken $value): this {
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
    return $this->_equal !== null;
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

  public function getTypeUNTYPED(): ?Node {
    return $this->_type;
  }

  public function withType(ITypeSpecifier $value): this {
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
    return $this->_type !== null;
  }

  /**
   * @return ClosureTypeSpecifier | DarrayTypeSpecifier |
   * DictionaryTypeSpecifier | GenericTypeSpecifier | KeysetTypeSpecifier |
   * NullableTypeSpecifier | ShapeTypeSpecifier | SimpleTypeSpecifier |
   * TupleTypeSpecifier | VectorTypeSpecifier
   */
  public function getType(): ITypeSpecifier {
    return TypeAssert\instance_of(ITypeSpecifier::class, $this->_type);
  }

  /**
   * @return ClosureTypeSpecifier | DarrayTypeSpecifier |
   * DictionaryTypeSpecifier | GenericTypeSpecifier | KeysetTypeSpecifier |
   * NullableTypeSpecifier | ShapeTypeSpecifier | SimpleTypeSpecifier |
   * TupleTypeSpecifier | VectorTypeSpecifier
   */
  public function getTypex(): ITypeSpecifier {
    return $this->getType();
  }

  public function getSemicolonUNTYPED(): ?Node {
    return $this->_semicolon;
  }

  public function withSemicolon(SemicolonToken $value): this {
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
    return $this->_semicolon !== null;
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
