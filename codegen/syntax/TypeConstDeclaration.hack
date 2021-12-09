/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<1cedebf428b2723235b776b4b61935e7>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;
/* HHAST_IGNORE_ALL[5607] 5607 is ignored because of false positives when comparing a generic to a typed value */
/* HHAST_IGNORE_ALL[5624] HHAST_IGNORE_ALL[5639] 5624 and 5639 are ignored because they insist on using co(tra)variant generics. Could this break external consumers? */

<<__ConsistentConstruct>>
final class TypeConstDeclaration extends Node implements IClassBodyDeclaration {

  const string SYNTAX_KIND = 'type_const_declaration';

  private ?OldAttributeSpecification $_attribute_spec;
  private ?NodeList<AbstractToken> $_modifiers;
  private ConstToken $_keyword;
  private TypeToken $_type_keyword;
  private NameToken $_name;
  private ?Node $_type_parameters;
  private ?TypeConstraint $_type_constraint;
  private ?EqualToken $_equal;
  private ?ITypeSpecifier $_type_specifier;
  private SemicolonToken $_semicolon;

  public function __construct(
    ?OldAttributeSpecification $attribute_spec,
    ?NodeList<AbstractToken> $modifiers,
    ConstToken $keyword,
    TypeToken $type_keyword,
    NameToken $name,
    ?Node $type_parameters,
    ?TypeConstraint $type_constraint,
    ?EqualToken $equal,
    ?ITypeSpecifier $type_specifier,
    SemicolonToken $semicolon,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_attribute_spec = $attribute_spec;
    $this->_modifiers = $modifiers;
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
    dict<arraykey, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
    string $_type_hint,
  ): this {
    $offset = $initial_offset;
    $attribute_spec = Node::fromJSON(
      ($json['type_const_attribute_spec'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'OldAttributeSpecification',
    );
    $offset += $attribute_spec?->getWidth() ?? 0;
    $modifiers = Node::fromJSON(
      ($json['type_const_modifiers'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'NodeList<AbstractToken>',
    );
    $offset += $modifiers?->getWidth() ?? 0;
    $keyword = Node::fromJSON(
      ($json['type_const_keyword']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'ConstToken',
    );
    $keyword = $keyword as nonnull;
    $offset += $keyword->getWidth();
    $type_keyword = Node::fromJSON(
      ($json['type_const_type_keyword']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'TypeToken',
    );
    $type_keyword = $type_keyword as nonnull;
    $offset += $type_keyword->getWidth();
    $name = Node::fromJSON(
      ($json['type_const_name']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'NameToken',
    );
    $name = $name as nonnull;
    $offset += $name->getWidth();
    $type_parameters = Node::fromJSON(
      ($json['type_const_type_parameters'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $type_parameters?->getWidth() ?? 0;
    $type_constraint = Node::fromJSON(
      ($json['type_const_type_constraint'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'TypeConstraint',
    );
    $offset += $type_constraint?->getWidth() ?? 0;
    $equal = Node::fromJSON(
      ($json['type_const_equal'] ?? dict['kind' => 'missing']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'EqualToken',
    );
    $offset += $equal?->getWidth() ?? 0;
    $type_specifier = Node::fromJSON(
      ($json['type_const_type_specifier'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'ITypeSpecifier',
    );
    $offset += $type_specifier?->getWidth() ?? 0;
    $semicolon = Node::fromJSON(
      ($json['type_const_semicolon']) as dict<_, _>,
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
      /* HH_IGNORE_ERROR[4110] */ $modifiers,
      /* HH_IGNORE_ERROR[4110] */ $keyword,
      /* HH_IGNORE_ERROR[4110] */ $type_keyword,
      /* HH_IGNORE_ERROR[4110] */ $name,
      /* HH_IGNORE_ERROR[4110] */ $type_parameters,
      /* HH_IGNORE_ERROR[4110] */ $type_constraint,
      /* HH_IGNORE_ERROR[4110] */ $equal,
      /* HH_IGNORE_ERROR[4110] */ $type_specifier,
      /* HH_IGNORE_ERROR[4110] */ $semicolon,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'attribute_spec' => $this->_attribute_spec,
      'modifiers' => $this->_modifiers,
      'keyword' => $this->_keyword,
      'type_keyword' => $this->_type_keyword,
      'name' => $this->_name,
      'type_parameters' => $this->_type_parameters,
      'type_constraint' => $this->_type_constraint,
      'equal' => $this->_equal,
      'type_specifier' => $this->_type_specifier,
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
    $modifiers = $this->_modifiers === null
      ? null
      : $rewriter($this->_modifiers, $parents);
    $keyword = $rewriter($this->_keyword, $parents);
    $type_keyword = $rewriter($this->_type_keyword, $parents);
    $name = $rewriter($this->_name, $parents);
    $type_parameters = $this->_type_parameters === null
      ? null
      : $rewriter($this->_type_parameters, $parents);
    $type_constraint = $this->_type_constraint === null
      ? null
      : $rewriter($this->_type_constraint, $parents);
    $equal = $this->_equal === null ? null : $rewriter($this->_equal, $parents);
    $type_specifier = $this->_type_specifier === null
      ? null
      : $rewriter($this->_type_specifier, $parents);
    $semicolon = $rewriter($this->_semicolon, $parents);
    if (
      $attribute_spec === $this->_attribute_spec &&
      $modifiers === $this->_modifiers &&
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
      $attribute_spec as ?OldAttributeSpecification,
      /* HH_FIXME[4110] ?NodeList<AbstractToken> may not be enforceable */ $modifiers,
      $keyword as ConstToken,
      $type_keyword as TypeToken,
      $name as NameToken,
      $type_parameters as ?Node,
      $type_constraint as ?TypeConstraint,
      $equal as ?EqualToken,
      $type_specifier as ?ITypeSpecifier,
      $semicolon as SemicolonToken,
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
      $this->_modifiers,
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

  public function getModifiersUNTYPED(): ?Node {
    return $this->_modifiers;
  }

  public function withModifiers(?NodeList<AbstractToken> $value): this {
    if ($value === $this->_modifiers) {
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

  public function hasModifiers(): bool {
    return $this->_modifiers !== null;
  }

  /**
   * @return NodeList<AbstractToken> | null
   */
  public function getModifiers(): ?NodeList<AbstractToken> {
    return $this->_modifiers;
  }

  /**
   * @return NodeList<AbstractToken>
   */
  public function getModifiersx(): NodeList<AbstractToken> {
    return TypeAssert\not_null($this->getModifiers());
  }

  public function getKeywordUNTYPED(): ?Node {
    return $this->_keyword;
  }

  public function withKeyword(ConstToken $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_modifiers,
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
    return true;
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

  public function getTypeKeywordUNTYPED(): ?Node {
    return $this->_type_keyword;
  }

  public function withTypeKeyword(TypeToken $value): this {
    if ($value === $this->_type_keyword) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_modifiers,
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
    return true;
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

  public function getNameUNTYPED(): ?Node {
    return $this->_name;
  }

  public function withName(NameToken $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_modifiers,
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
    return true;
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

  public function getTypeParametersUNTYPED(): ?Node {
    return $this->_type_parameters;
  }

  public function withTypeParameters(?Node $value): this {
    if ($value === $this->_type_parameters) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_modifiers,
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
    return $this->_type_parameters !== null;
  }

  /**
   * @return null
   */
  public function getTypeParameters(): ?Node {
    return $this->_type_parameters;
  }

  /**
   * @return
   */
  public function getTypeParametersx(): Node {
    return TypeAssert\not_null($this->getTypeParameters());
  }

  public function getTypeConstraintUNTYPED(): ?Node {
    return $this->_type_constraint;
  }

  public function withTypeConstraint(?TypeConstraint $value): this {
    if ($value === $this->_type_constraint) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_modifiers,
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
    return $this->_type_constraint !== null;
  }

  /**
   * @return null | TypeConstraint
   */
  public function getTypeConstraint(): ?TypeConstraint {
    return $this->_type_constraint;
  }

  /**
   * @return TypeConstraint
   */
  public function getTypeConstraintx(): TypeConstraint {
    return TypeAssert\not_null($this->getTypeConstraint());
  }

  public function getEqualUNTYPED(): ?Node {
    return $this->_equal;
  }

  public function withEqual(?EqualToken $value): this {
    if ($value === $this->_equal) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_modifiers,
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
    return $this->_equal !== null;
  }

  /**
   * @return null | EqualToken
   */
  public function getEqual(): ?EqualToken {
    return $this->_equal;
  }

  /**
   * @return EqualToken
   */
  public function getEqualx(): EqualToken {
    return TypeAssert\not_null($this->getEqual());
  }

  public function getTypeSpecifierUNTYPED(): ?Node {
    return $this->_type_specifier;
  }

  public function withTypeSpecifier(?ITypeSpecifier $value): this {
    if ($value === $this->_type_specifier) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_modifiers,
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
    return $this->_type_specifier !== null;
  }

  /**
   * @return ClassnameTypeSpecifier | ClosureTypeSpecifier |
   * DarrayTypeSpecifier | DictionaryTypeSpecifier | GenericTypeSpecifier |
   * KeysetTypeSpecifier | LikeTypeSpecifier | null | NullableTypeSpecifier |
   * ShapeTypeSpecifier | SimpleTypeSpecifier | TupleTypeSpecifier |
   * TypeConstant | VarrayTypeSpecifier | VectorTypeSpecifier
   */
  public function getTypeSpecifier(): ?ITypeSpecifier {
    return $this->_type_specifier;
  }

  /**
   * @return ClassnameTypeSpecifier | ClosureTypeSpecifier |
   * DarrayTypeSpecifier | DictionaryTypeSpecifier | GenericTypeSpecifier |
   * KeysetTypeSpecifier | LikeTypeSpecifier | NullableTypeSpecifier |
   * ShapeTypeSpecifier | SimpleTypeSpecifier | TupleTypeSpecifier |
   * TypeConstant | VarrayTypeSpecifier | VectorTypeSpecifier
   */
  public function getTypeSpecifierx(): ITypeSpecifier {
    return TypeAssert\not_null($this->getTypeSpecifier());
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
      $this->_modifiers,
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
    return true;
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
