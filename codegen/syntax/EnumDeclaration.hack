/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<194693a524b90d5d00f80feff66c9e73>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;
/* HHAST_IGNORE_ALL[5607] 5607 is ignored because of false positives when comparing a generic to a typed value */
/* HHAST_IGNORE_ALL[5624] HHAST_IGNORE_ALL[5639] 5624 and 5639 are ignored because they insist on using co(tra)variant generics. Could this break external consumers? */

<<__ConsistentConstruct>>
final class EnumDeclaration extends Node implements IHasAttributeSpec {

  const string SYNTAX_KIND = 'enum_declaration';

  private ?OldAttributeSpecification $_attribute_spec;
  private ?NodeList<PublicToken> $_modifiers;
  private EnumToken $_keyword;
  private NameToken $_name;
  private ColonToken $_colon;
  private ITypeSpecifier $_base;
  private ?TypeConstraint $_type;
  private LeftBraceToken $_left_brace;
  private ?NodeList<EnumUse> $_use_clauses;
  private ?NodeList<Enumerator> $_enumerators;
  private RightBraceToken $_right_brace;

  public function __construct(
    ?OldAttributeSpecification $attribute_spec,
    ?NodeList<PublicToken> $modifiers,
    EnumToken $keyword,
    NameToken $name,
    ColonToken $colon,
    ITypeSpecifier $base,
    ?TypeConstraint $type,
    LeftBraceToken $left_brace,
    ?NodeList<EnumUse> $use_clauses,
    ?NodeList<Enumerator> $enumerators,
    RightBraceToken $right_brace,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_attribute_spec = $attribute_spec;
    $this->_modifiers = $modifiers;
    $this->_keyword = $keyword;
    $this->_name = $name;
    $this->_colon = $colon;
    $this->_base = $base;
    $this->_type = $type;
    $this->_left_brace = $left_brace;
    $this->_use_clauses = $use_clauses;
    $this->_enumerators = $enumerators;
    $this->_right_brace = $right_brace;
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
      ($json['enum_attribute_spec'] ?? dict['kind' => 'missing']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'OldAttributeSpecification',
    );
    $offset += $attribute_spec?->getWidth() ?? 0;
    $modifiers = Node::fromJSON(
      ($json['enum_modifiers'] ?? dict['kind' => 'missing']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'NodeList<PublicToken>',
    );
    $offset += $modifiers?->getWidth() ?? 0;
    $keyword = Node::fromJSON(
      ($json['enum_keyword']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'EnumToken',
    );
    $keyword = $keyword as nonnull;
    $offset += $keyword->getWidth();
    $name = Node::fromJSON(
      ($json['enum_name']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'NameToken',
    );
    $name = $name as nonnull;
    $offset += $name->getWidth();
    $colon = Node::fromJSON(
      ($json['enum_colon']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'ColonToken',
    );
    $colon = $colon as nonnull;
    $offset += $colon->getWidth();
    $base = Node::fromJSON(
      ($json['enum_base']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'ITypeSpecifier',
    );
    $base = $base as nonnull;
    $offset += $base->getWidth();
    $type = Node::fromJSON(
      ($json['enum_type'] ?? dict['kind' => 'missing']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'TypeConstraint',
    );
    $offset += $type?->getWidth() ?? 0;
    $left_brace = Node::fromJSON(
      ($json['enum_left_brace']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'LeftBraceToken',
    );
    $left_brace = $left_brace as nonnull;
    $offset += $left_brace->getWidth();
    $use_clauses = Node::fromJSON(
      ($json['enum_use_clauses'] ?? dict['kind' => 'missing']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'NodeList<EnumUse>',
    );
    $offset += $use_clauses?->getWidth() ?? 0;
    $enumerators = Node::fromJSON(
      ($json['enum_enumerators'] ?? dict['kind' => 'missing']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'NodeList<Enumerator>',
    );
    $offset += $enumerators?->getWidth() ?? 0;
    $right_brace = Node::fromJSON(
      ($json['enum_right_brace']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'RightBraceToken',
    );
    $right_brace = $right_brace as nonnull;
    $offset += $right_brace->getWidth();
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
      /* HH_IGNORE_ERROR[4110] */ $name,
      /* HH_IGNORE_ERROR[4110] */ $colon,
      /* HH_IGNORE_ERROR[4110] */ $base,
      /* HH_IGNORE_ERROR[4110] */ $type,
      /* HH_IGNORE_ERROR[4110] */ $left_brace,
      /* HH_IGNORE_ERROR[4110] */ $use_clauses,
      /* HH_IGNORE_ERROR[4110] */ $enumerators,
      /* HH_IGNORE_ERROR[4110] */ $right_brace,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'attribute_spec' => $this->_attribute_spec,
      'modifiers' => $this->_modifiers,
      'keyword' => $this->_keyword,
      'name' => $this->_name,
      'colon' => $this->_colon,
      'base' => $this->_base,
      'type' => $this->_type,
      'left_brace' => $this->_left_brace,
      'use_clauses' => $this->_use_clauses,
      'enumerators' => $this->_enumerators,
      'right_brace' => $this->_right_brace,
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
    $name = $rewriter($this->_name, $parents);
    $colon = $rewriter($this->_colon, $parents);
    $base = $rewriter($this->_base, $parents);
    $type = $this->_type === null ? null : $rewriter($this->_type, $parents);
    $left_brace = $rewriter($this->_left_brace, $parents);
    $use_clauses = $this->_use_clauses === null
      ? null
      : $rewriter($this->_use_clauses, $parents);
    $enumerators = $this->_enumerators === null
      ? null
      : $rewriter($this->_enumerators, $parents);
    $right_brace = $rewriter($this->_right_brace, $parents);
    if (
      $attribute_spec === $this->_attribute_spec &&
      $modifiers === $this->_modifiers &&
      $keyword === $this->_keyword &&
      $name === $this->_name &&
      $colon === $this->_colon &&
      $base === $this->_base &&
      $type === $this->_type &&
      $left_brace === $this->_left_brace &&
      $use_clauses === $this->_use_clauses &&
      $enumerators === $this->_enumerators &&
      $right_brace === $this->_right_brace
    ) {
      return $this;
    }
    return new static(
      $attribute_spec as ?OldAttributeSpecification,
      /* HH_FIXME[4110] ?NodeList<PublicToken> may not be enforceable */ $modifiers,
      $keyword as EnumToken,
      $name as NameToken,
      $colon as ColonToken,
      $base as ITypeSpecifier,
      $type as ?TypeConstraint,
      $left_brace as LeftBraceToken,
      /* HH_FIXME[4110] ?NodeList<EnumUse> may not be enforceable */ $use_clauses,
      /* HH_FIXME[4110] ?NodeList<Enumerator> may not be enforceable */ $enumerators,
      $right_brace as RightBraceToken,
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
      $this->_name,
      $this->_colon,
      $this->_base,
      $this->_type,
      $this->_left_brace,
      $this->_use_clauses,
      $this->_enumerators,
      $this->_right_brace,
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

  public function withModifiers(?NodeList<PublicToken> $value): this {
    if ($value === $this->_modifiers) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $value,
      $this->_keyword,
      $this->_name,
      $this->_colon,
      $this->_base,
      $this->_type,
      $this->_left_brace,
      $this->_use_clauses,
      $this->_enumerators,
      $this->_right_brace,
    );
  }

  public function hasModifiers(): bool {
    return $this->_modifiers !== null;
  }

  /**
   * @return NodeList<PublicToken> | null
   */
  public function getModifiers(): ?NodeList<PublicToken> {
    return $this->_modifiers;
  }

  /**
   * @return NodeList<PublicToken>
   */
  public function getModifiersx(): NodeList<PublicToken> {
    return TypeAssert\not_null($this->getModifiers());
  }

  public function getKeywordUNTYPED(): ?Node {
    return $this->_keyword;
  }

  public function withKeyword(EnumToken $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_modifiers,
      $value,
      $this->_name,
      $this->_colon,
      $this->_base,
      $this->_type,
      $this->_left_brace,
      $this->_use_clauses,
      $this->_enumerators,
      $this->_right_brace,
    );
  }

  public function hasKeyword(): bool {
    return true;
  }

  /**
   * @return EnumToken
   */
  public function getKeyword(): EnumToken {
    return TypeAssert\instance_of(EnumToken::class, $this->_keyword);
  }

  /**
   * @return EnumToken
   */
  public function getKeywordx(): EnumToken {
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
      $this->_modifiers,
      $this->_keyword,
      $value,
      $this->_colon,
      $this->_base,
      $this->_type,
      $this->_left_brace,
      $this->_use_clauses,
      $this->_enumerators,
      $this->_right_brace,
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

  public function getColonUNTYPED(): ?Node {
    return $this->_colon;
  }

  public function withColon(ColonToken $value): this {
    if ($value === $this->_colon) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_modifiers,
      $this->_keyword,
      $this->_name,
      $value,
      $this->_base,
      $this->_type,
      $this->_left_brace,
      $this->_use_clauses,
      $this->_enumerators,
      $this->_right_brace,
    );
  }

  public function hasColon(): bool {
    return true;
  }

  /**
   * @return ColonToken
   */
  public function getColon(): ColonToken {
    return TypeAssert\instance_of(ColonToken::class, $this->_colon);
  }

  /**
   * @return ColonToken
   */
  public function getColonx(): ColonToken {
    return $this->getColon();
  }

  public function getBaseUNTYPED(): ?Node {
    return $this->_base;
  }

  public function withBase(ITypeSpecifier $value): this {
    if ($value === $this->_base) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_modifiers,
      $this->_keyword,
      $this->_name,
      $this->_colon,
      $value,
      $this->_type,
      $this->_left_brace,
      $this->_use_clauses,
      $this->_enumerators,
      $this->_right_brace,
    );
  }

  public function hasBase(): bool {
    return true;
  }

  /**
   * @return ClassnameTypeSpecifier | ClosureTypeSpecifier |
   * DictionaryTypeSpecifier | GenericTypeSpecifier | KeysetTypeSpecifier |
   * NullableTypeSpecifier | SimpleTypeSpecifier | VectorTypeSpecifier
   */
  public function getBase(): ITypeSpecifier {
    return TypeAssert\instance_of(ITypeSpecifier::class, $this->_base);
  }

  /**
   * @return ClassnameTypeSpecifier | ClosureTypeSpecifier |
   * DictionaryTypeSpecifier | GenericTypeSpecifier | KeysetTypeSpecifier |
   * NullableTypeSpecifier | SimpleTypeSpecifier | VectorTypeSpecifier
   */
  public function getBasex(): ITypeSpecifier {
    return $this->getBase();
  }

  public function getTypeUNTYPED(): ?Node {
    return $this->_type;
  }

  public function withType(?TypeConstraint $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_modifiers,
      $this->_keyword,
      $this->_name,
      $this->_colon,
      $this->_base,
      $value,
      $this->_left_brace,
      $this->_use_clauses,
      $this->_enumerators,
      $this->_right_brace,
    );
  }

  public function hasType(): bool {
    return $this->_type !== null;
  }

  /**
   * @return null | TypeConstraint
   */
  public function getType(): ?TypeConstraint {
    return $this->_type;
  }

  /**
   * @return TypeConstraint
   */
  public function getTypex(): TypeConstraint {
    return TypeAssert\not_null($this->getType());
  }

  public function getLeftBraceUNTYPED(): ?Node {
    return $this->_left_brace;
  }

  public function withLeftBrace(LeftBraceToken $value): this {
    if ($value === $this->_left_brace) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_modifiers,
      $this->_keyword,
      $this->_name,
      $this->_colon,
      $this->_base,
      $this->_type,
      $value,
      $this->_use_clauses,
      $this->_enumerators,
      $this->_right_brace,
    );
  }

  public function hasLeftBrace(): bool {
    return true;
  }

  /**
   * @return LeftBraceToken
   */
  public function getLeftBrace(): LeftBraceToken {
    return TypeAssert\instance_of(LeftBraceToken::class, $this->_left_brace);
  }

  /**
   * @return LeftBraceToken
   */
  public function getLeftBracex(): LeftBraceToken {
    return $this->getLeftBrace();
  }

  public function getUseClausesUNTYPED(): ?Node {
    return $this->_use_clauses;
  }

  public function withUseClauses(?NodeList<EnumUse> $value): this {
    if ($value === $this->_use_clauses) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_modifiers,
      $this->_keyword,
      $this->_name,
      $this->_colon,
      $this->_base,
      $this->_type,
      $this->_left_brace,
      $value,
      $this->_enumerators,
      $this->_right_brace,
    );
  }

  public function hasUseClauses(): bool {
    return $this->_use_clauses !== null;
  }

  /**
   * @return NodeList<EnumUse> | null
   */
  public function getUseClauses(): ?NodeList<EnumUse> {
    return $this->_use_clauses;
  }

  /**
   * @return NodeList<EnumUse>
   */
  public function getUseClausesx(): NodeList<EnumUse> {
    return TypeAssert\not_null($this->getUseClauses());
  }

  public function getEnumeratorsUNTYPED(): ?Node {
    return $this->_enumerators;
  }

  public function withEnumerators(?NodeList<Enumerator> $value): this {
    if ($value === $this->_enumerators) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_modifiers,
      $this->_keyword,
      $this->_name,
      $this->_colon,
      $this->_base,
      $this->_type,
      $this->_left_brace,
      $this->_use_clauses,
      $value,
      $this->_right_brace,
    );
  }

  public function hasEnumerators(): bool {
    return $this->_enumerators !== null;
  }

  /**
   * @return NodeList<Enumerator> | null
   */
  public function getEnumerators(): ?NodeList<Enumerator> {
    return $this->_enumerators;
  }

  /**
   * @return NodeList<Enumerator>
   */
  public function getEnumeratorsx(): NodeList<Enumerator> {
    return TypeAssert\not_null($this->getEnumerators());
  }

  public function getRightBraceUNTYPED(): ?Node {
    return $this->_right_brace;
  }

  public function withRightBrace(RightBraceToken $value): this {
    if ($value === $this->_right_brace) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_modifiers,
      $this->_keyword,
      $this->_name,
      $this->_colon,
      $this->_base,
      $this->_type,
      $this->_left_brace,
      $this->_use_clauses,
      $this->_enumerators,
      $value,
    );
  }

  public function hasRightBrace(): bool {
    return true;
  }

  /**
   * @return RightBraceToken
   */
  public function getRightBrace(): RightBraceToken {
    return TypeAssert\instance_of(RightBraceToken::class, $this->_right_brace);
  }

  /**
   * @return RightBraceToken
   */
  public function getRightBracex(): RightBraceToken {
    return $this->getRightBrace();
  }
}
