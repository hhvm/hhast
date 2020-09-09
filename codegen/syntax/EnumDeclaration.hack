/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<c0788529ace9d47959ae38d39de8ef92>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class EnumDeclaration extends Node implements IHasAttributeSpec {

  const string SYNTAX_KIND = 'enum_declaration';

  private ?OldAttributeSpecification $_attribute_spec;
  private EnumToken $_keyword;
  private NameToken $_name;
  private ColonToken $_colon;
  private ITypeSpecifier $_base;
  private ?TypeConstraint $_type;
  private ?Node $_includes_keyword;
  private ?Node $_includes_list;
  private LeftBraceToken $_left_brace;
  private ?NodeList<Enumerator> $_enumerators;
  private RightBraceToken $_right_brace;

  public function __construct(
    ?OldAttributeSpecification $attribute_spec,
    EnumToken $keyword,
    NameToken $name,
    ColonToken $colon,
    ITypeSpecifier $base,
    ?TypeConstraint $type,
    ?Node $includes_keyword,
    ?Node $includes_list,
    LeftBraceToken $left_brace,
    ?NodeList<Enumerator> $enumerators,
    RightBraceToken $right_brace,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_attribute_spec = $attribute_spec;
    $this->_keyword = $keyword;
    $this->_name = $name;
    $this->_colon = $colon;
    $this->_base = $base;
    $this->_type = $type;
    $this->_includes_keyword = $includes_keyword;
    $this->_includes_list = $includes_list;
    $this->_left_brace = $left_brace;
    $this->_enumerators = $enumerators;
    $this->_right_brace = $right_brace;
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
      /* HH_FIXME[4110] */ $json['enum_attribute_spec'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'OldAttributeSpecification',
    );
    $offset += $attribute_spec?->getWidth() ?? 0;
    $keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['enum_keyword'],
      $file,
      $offset,
      $source,
      'EnumToken',
    );
    $keyword = $keyword as nonnull;
    $offset += $keyword->getWidth();
    $name = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['enum_name'],
      $file,
      $offset,
      $source,
      'NameToken',
    );
    $name = $name as nonnull;
    $offset += $name->getWidth();
    $colon = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['enum_colon'],
      $file,
      $offset,
      $source,
      'ColonToken',
    );
    $colon = $colon as nonnull;
    $offset += $colon->getWidth();
    $base = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['enum_base'],
      $file,
      $offset,
      $source,
      'ITypeSpecifier',
    );
    $base = $base as nonnull;
    $offset += $base->getWidth();
    $type = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['enum_type'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'TypeConstraint',
    );
    $offset += $type?->getWidth() ?? 0;
    $includes_keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['enum_includes_keyword'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $includes_keyword?->getWidth() ?? 0;
    $includes_list = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['enum_includes_list'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $includes_list?->getWidth() ?? 0;
    $left_brace = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['enum_left_brace'],
      $file,
      $offset,
      $source,
      'LeftBraceToken',
    );
    $left_brace = $left_brace as nonnull;
    $offset += $left_brace->getWidth();
    $enumerators = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['enum_enumerators'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'NodeList<Enumerator>',
    );
    $offset += $enumerators?->getWidth() ?? 0;
    $right_brace = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['enum_right_brace'],
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
      /* HH_IGNORE_ERROR[4110] */ $keyword,
      /* HH_IGNORE_ERROR[4110] */ $name,
      /* HH_IGNORE_ERROR[4110] */ $colon,
      /* HH_IGNORE_ERROR[4110] */ $base,
      /* HH_IGNORE_ERROR[4110] */ $type,
      /* HH_IGNORE_ERROR[4110] */ $includes_keyword,
      /* HH_IGNORE_ERROR[4110] */ $includes_list,
      /* HH_IGNORE_ERROR[4110] */ $left_brace,
      /* HH_IGNORE_ERROR[4110] */ $enumerators,
      /* HH_IGNORE_ERROR[4110] */ $right_brace,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'attribute_spec' => $this->_attribute_spec,
      'keyword' => $this->_keyword,
      'name' => $this->_name,
      'colon' => $this->_colon,
      'base' => $this->_base,
      'type' => $this->_type,
      'includes_keyword' => $this->_includes_keyword,
      'includes_list' => $this->_includes_list,
      'left_brace' => $this->_left_brace,
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
    $keyword = $rewriter($this->_keyword, $parents);
    $name = $rewriter($this->_name, $parents);
    $colon = $rewriter($this->_colon, $parents);
    $base = $rewriter($this->_base, $parents);
    $type = $this->_type === null ? null : $rewriter($this->_type, $parents);
    $includes_keyword = $this->_includes_keyword === null
      ? null
      : $rewriter($this->_includes_keyword, $parents);
    $includes_list = $this->_includes_list === null
      ? null
      : $rewriter($this->_includes_list, $parents);
    $left_brace = $rewriter($this->_left_brace, $parents);
    $enumerators = $this->_enumerators === null
      ? null
      : $rewriter($this->_enumerators, $parents);
    $right_brace = $rewriter($this->_right_brace, $parents);
    if (
      $attribute_spec === $this->_attribute_spec &&
      $keyword === $this->_keyword &&
      $name === $this->_name &&
      $colon === $this->_colon &&
      $base === $this->_base &&
      $type === $this->_type &&
      $includes_keyword === $this->_includes_keyword &&
      $includes_list === $this->_includes_list &&
      $left_brace === $this->_left_brace &&
      $enumerators === $this->_enumerators &&
      $right_brace === $this->_right_brace
    ) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $attribute_spec,
      /* HH_FIXME[4110] use `as` */ $keyword,
      /* HH_FIXME[4110] use `as` */ $name,
      /* HH_FIXME[4110] use `as` */ $colon,
      /* HH_FIXME[4110] use `as` */ $base,
      /* HH_FIXME[4110] use `as` */ $type,
      /* HH_FIXME[4110] use `as` */ $includes_keyword,
      /* HH_FIXME[4110] use `as` */ $includes_list,
      /* HH_FIXME[4110] use `as` */ $left_brace,
      /* HH_FIXME[4110] use `as` */ $enumerators,
      /* HH_FIXME[4110] use `as` */ $right_brace,
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
      $this->_colon,
      $this->_base,
      $this->_type,
      $this->_includes_keyword,
      $this->_includes_list,
      $this->_left_brace,
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

  public function getKeywordUNTYPED(): ?Node {
    return $this->_keyword;
  }

  public function withKeyword(EnumToken $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $value,
      $this->_name,
      $this->_colon,
      $this->_base,
      $this->_type,
      $this->_includes_keyword,
      $this->_includes_list,
      $this->_left_brace,
      $this->_enumerators,
      $this->_right_brace,
    );
  }

  public function hasKeyword(): bool {
    return $this->_keyword !== null;
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
      $this->_keyword,
      $value,
      $this->_colon,
      $this->_base,
      $this->_type,
      $this->_includes_keyword,
      $this->_includes_list,
      $this->_left_brace,
      $this->_enumerators,
      $this->_right_brace,
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

  public function getColonUNTYPED(): ?Node {
    return $this->_colon;
  }

  public function withColon(ColonToken $value): this {
    if ($value === $this->_colon) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_keyword,
      $this->_name,
      $value,
      $this->_base,
      $this->_type,
      $this->_includes_keyword,
      $this->_includes_list,
      $this->_left_brace,
      $this->_enumerators,
      $this->_right_brace,
    );
  }

  public function hasColon(): bool {
    return $this->_colon !== null;
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
      $this->_keyword,
      $this->_name,
      $this->_colon,
      $value,
      $this->_type,
      $this->_includes_keyword,
      $this->_includes_list,
      $this->_left_brace,
      $this->_enumerators,
      $this->_right_brace,
    );
  }

  public function hasBase(): bool {
    return $this->_base !== null;
  }

  /**
   * @return ClassnameTypeSpecifier | GenericTypeSpecifier | SimpleTypeSpecifier
   */
  public function getBase(): ITypeSpecifier {
    return TypeAssert\instance_of(ITypeSpecifier::class, $this->_base);
  }

  /**
   * @return ClassnameTypeSpecifier | GenericTypeSpecifier | SimpleTypeSpecifier
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
      $this->_keyword,
      $this->_name,
      $this->_colon,
      $this->_base,
      $value,
      $this->_includes_keyword,
      $this->_includes_list,
      $this->_left_brace,
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

  public function getIncludesKeywordUNTYPED(): ?Node {
    return $this->_includes_keyword;
  }

  public function withIncludesKeyword(?Node $value): this {
    if ($value === $this->_includes_keyword) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_keyword,
      $this->_name,
      $this->_colon,
      $this->_base,
      $this->_type,
      $value,
      $this->_includes_list,
      $this->_left_brace,
      $this->_enumerators,
      $this->_right_brace,
    );
  }

  public function hasIncludesKeyword(): bool {
    return $this->_includes_keyword !== null;
  }

  /**
   * @return null
   */
  public function getIncludesKeyword(): ?Node {
    return $this->_includes_keyword;
  }

  /**
   * @return
   */
  public function getIncludesKeywordx(): Node {
    return TypeAssert\not_null($this->getIncludesKeyword());
  }

  public function getIncludesListUNTYPED(): ?Node {
    return $this->_includes_list;
  }

  public function withIncludesList(?Node $value): this {
    if ($value === $this->_includes_list) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_keyword,
      $this->_name,
      $this->_colon,
      $this->_base,
      $this->_type,
      $this->_includes_keyword,
      $value,
      $this->_left_brace,
      $this->_enumerators,
      $this->_right_brace,
    );
  }

  public function hasIncludesList(): bool {
    return $this->_includes_list !== null;
  }

  /**
   * @return null
   */
  public function getIncludesList(): ?Node {
    return $this->_includes_list;
  }

  /**
   * @return
   */
  public function getIncludesListx(): Node {
    return TypeAssert\not_null($this->getIncludesList());
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
      $this->_keyword,
      $this->_name,
      $this->_colon,
      $this->_base,
      $this->_type,
      $this->_includes_keyword,
      $this->_includes_list,
      $value,
      $this->_enumerators,
      $this->_right_brace,
    );
  }

  public function hasLeftBrace(): bool {
    return $this->_left_brace !== null;
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

  public function getEnumeratorsUNTYPED(): ?Node {
    return $this->_enumerators;
  }

  public function withEnumerators(?NodeList<Enumerator> $value): this {
    if ($value === $this->_enumerators) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_keyword,
      $this->_name,
      $this->_colon,
      $this->_base,
      $this->_type,
      $this->_includes_keyword,
      $this->_includes_list,
      $this->_left_brace,
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
      $this->_keyword,
      $this->_name,
      $this->_colon,
      $this->_base,
      $this->_type,
      $this->_includes_keyword,
      $this->_includes_list,
      $this->_left_brace,
      $this->_enumerators,
      $value,
    );
  }

  public function hasRightBrace(): bool {
    return $this->_right_brace !== null;
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
