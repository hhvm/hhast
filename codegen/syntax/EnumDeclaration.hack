/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<3d9577e9f7b20abe5fa51e3cee675091>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class EnumDeclaration extends Node implements IHasAttributeSpec {

  const string SYNTAX_KIND = 'enum_declaration';

  private Node $_attribute_spec;
  private Node $_keyword;
  private Node $_name;
  private Node $_colon;
  private Node $_base;
  private Node $_type;
  private Node $_left_brace;
  private Node $_enumerators;
  private Node $_right_brace;

  public function __construct(
    Node $attribute_spec,
    Node $keyword,
    Node $name,
    Node $colon,
    Node $base,
    Node $type,
    Node $left_brace,
    Node $enumerators,
    Node $right_brace,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_attribute_spec = $attribute_spec;
    $this->_keyword = $keyword;
    $this->_name = $name;
    $this->_colon = $colon;
    $this->_base = $base;
    $this->_type = $type;
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
      /* HH_FIXME[4110] */ $json['enum_attribute_spec'],
      $file,
      $offset,
      $source,
      'AttributeSpecification',
    );
    $offset += $attribute_spec->getWidth();
    $keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['enum_keyword'],
      $file,
      $offset,
      $source,
      'EnumToken',
    );
    $offset += $keyword->getWidth();
    $name = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['enum_name'],
      $file,
      $offset,
      $source,
      'NameToken',
    );
    $offset += $name->getWidth();
    $colon = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['enum_colon'],
      $file,
      $offset,
      $source,
      'ColonToken',
    );
    $offset += $colon->getWidth();
    $base = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['enum_base'],
      $file,
      $offset,
      $source,
      'ITypeSpecifier',
    );
    $offset += $base->getWidth();
    $type = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['enum_type'],
      $file,
      $offset,
      $source,
      'TypeConstraint',
    );
    $offset += $type->getWidth();
    $left_brace = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['enum_left_brace'],
      $file,
      $offset,
      $source,
      'LeftBraceToken',
    );
    $offset += $left_brace->getWidth();
    $enumerators = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['enum_enumerators'],
      $file,
      $offset,
      $source,
      'NodeList<Enumerator>',
    );
    $offset += $enumerators->getWidth();
    $right_brace = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['enum_right_brace'],
      $file,
      $offset,
      $source,
      'RightBraceToken',
    );
    $offset += $right_brace->getWidth();
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
      $colon,
      $base,
      $type,
      $left_brace,
      $enumerators,
      $right_brace,
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
      'left_brace' => $this->_left_brace,
      'enumerators' => $this->_enumerators,
      'right_brace' => $this->_right_brace,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $attribute_spec = $rewriter($this->_attribute_spec, $parents);
    $keyword = $rewriter($this->_keyword, $parents);
    $name = $rewriter($this->_name, $parents);
    $colon = $rewriter($this->_colon, $parents);
    $base = $rewriter($this->_base, $parents);
    $type = $rewriter($this->_type, $parents);
    $left_brace = $rewriter($this->_left_brace, $parents);
    $enumerators = $rewriter($this->_enumerators, $parents);
    $right_brace = $rewriter($this->_right_brace, $parents);
    if (
      $attribute_spec === $this->_attribute_spec &&
      $keyword === $this->_keyword &&
      $name === $this->_name &&
      $colon === $this->_colon &&
      $base === $this->_base &&
      $type === $this->_type &&
      $left_brace === $this->_left_brace &&
      $enumerators === $this->_enumerators &&
      $right_brace === $this->_right_brace
    ) {
      return $this;
    }
    return new static(
      $attribute_spec,
      $keyword,
      $name,
      $colon,
      $base,
      $type,
      $left_brace,
      $enumerators,
      $right_brace,
    );
  }

  public function getAttributeSpecUNTYPED(): Node {
    return $this->_attribute_spec;
  }

  public function withAttributeSpec(?AttributeSpecification $value): this {
    if ($value === $this->_attribute_spec) {
      return $this;
    }
    return new static(
      $value ?? Missing(),
      $this->_keyword,
      $this->_name,
      $this->_colon,
      $this->_base,
      $this->_type,
      $this->_left_brace,
      $this->_enumerators,
      $this->_right_brace,
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

  public function getKeywordUNTYPED(): Node {
    return $this->_keyword;
  }

  public function withKeyword(EnumToken $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $value ?? Missing(),
      $this->_name,
      $this->_colon,
      $this->_base,
      $this->_type,
      $this->_left_brace,
      $this->_enumerators,
      $this->_right_brace,
    );
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
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

  public function getNameUNTYPED(): Node {
    return $this->_name;
  }

  public function withName(NameToken $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_keyword,
      $value ?? Missing(),
      $this->_colon,
      $this->_base,
      $this->_type,
      $this->_left_brace,
      $this->_enumerators,
      $this->_right_brace,
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

  public function getColonUNTYPED(): Node {
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
      $value ?? Missing(),
      $this->_base,
      $this->_type,
      $this->_left_brace,
      $this->_enumerators,
      $this->_right_brace,
    );
  }

  public function hasColon(): bool {
    return !$this->_colon->isMissing();
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

  public function getBaseUNTYPED(): Node {
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
      $value ?? Missing(),
      $this->_type,
      $this->_left_brace,
      $this->_enumerators,
      $this->_right_brace,
    );
  }

  public function hasBase(): bool {
    return !$this->_base->isMissing();
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

  public function getTypeUNTYPED(): Node {
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
      $value ?? Missing(),
      $this->_left_brace,
      $this->_enumerators,
      $this->_right_brace,
    );
  }

  public function hasType(): bool {
    return !$this->_type->isMissing();
  }

  /**
   * @return null | TypeConstraint
   */
  public function getType(): ?TypeConstraint {
    if ($this->_type->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(TypeConstraint::class, $this->_type);
  }

  /**
   * @return TypeConstraint
   */
  public function getTypex(): TypeConstraint {
    return TypeAssert\not_null($this->getType());
  }

  public function getLeftBraceUNTYPED(): Node {
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
      $value ?? Missing(),
      $this->_enumerators,
      $this->_right_brace,
    );
  }

  public function hasLeftBrace(): bool {
    return !$this->_left_brace->isMissing();
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

  public function getEnumeratorsUNTYPED(): Node {
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
      $this->_left_brace,
      $value ?? Missing(),
      $this->_right_brace,
    );
  }

  public function hasEnumerators(): bool {
    return !$this->_enumerators->isMissing();
  }

  /**
   * @return NodeList<Enumerator> | null
   */
  public function getEnumerators(): ?NodeList<Enumerator> {
    if ($this->_enumerators->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(NodeList::class, $this->_enumerators);
  }

  /**
   * @return NodeList<Enumerator>
   */
  public function getEnumeratorsx(): NodeList<Enumerator> {
    return TypeAssert\not_null($this->getEnumerators());
  }

  public function getRightBraceUNTYPED(): Node {
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
      $this->_left_brace,
      $this->_enumerators,
      $value ?? Missing(),
    );
  }

  public function hasRightBrace(): bool {
    return !$this->_right_brace->isMissing();
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
