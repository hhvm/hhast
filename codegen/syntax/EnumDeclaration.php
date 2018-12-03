<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<85dbc279f341f783da0c7a1ab3fb9e7d>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class EnumDeclaration extends EditableNode {

  private EditableNode $_attribute_spec;
  private EditableNode $_keyword;
  private EditableNode $_name;
  private EditableNode $_colon;
  private EditableNode $_base;
  private EditableNode $_type;
  private EditableNode $_left_brace;
  private EditableNode $_enumerators;
  private EditableNode $_right_brace;

  public function __construct(
    EditableNode $attribute_spec,
    EditableNode $keyword,
    EditableNode $name,
    EditableNode $colon,
    EditableNode $base,
    EditableNode $type,
    EditableNode $left_brace,
    EditableNode $enumerators,
    EditableNode $right_brace,
  ) {
    parent::__construct('enum_declaration');
    $this->_attribute_spec = $attribute_spec;
    $this->_keyword = $keyword;
    $this->_name = $name;
    $this->_colon = $colon;
    $this->_base = $base;
    $this->_type = $type;
    $this->_left_brace = $left_brace;
    $this->_enumerators = $enumerators;
    $this->_right_brace = $right_brace;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
  ): this {
    $attribute_spec = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['enum_attribute_spec'],
      $file,
      $offset,
      $source,
    );
    $offset += $attribute_spec->getWidth();
    $keyword = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['enum_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $keyword->getWidth();
    $name = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['enum_name'],
      $file,
      $offset,
      $source,
    );
    $offset += $name->getWidth();
    $colon = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['enum_colon'],
      $file,
      $offset,
      $source,
    );
    $offset += $colon->getWidth();
    $base = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['enum_base'],
      $file,
      $offset,
      $source,
    );
    $offset += $base->getWidth();
    $type = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['enum_type'],
      $file,
      $offset,
      $source,
    );
    $offset += $type->getWidth();
    $left_brace = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['enum_left_brace'],
      $file,
      $offset,
      $source,
    );
    $offset += $left_brace->getWidth();
    $enumerators = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['enum_enumerators'],
      $file,
      $offset,
      $source,
    );
    $offset += $enumerators->getWidth();
    $right_brace = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['enum_right_brace'],
      $file,
      $offset,
      $source,
    );
    $offset += $right_brace->getWidth();
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

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
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
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?vec<EditableNode> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $attribute_spec = $this->_attribute_spec->rewrite($rewriter, $parents);
    $keyword = $this->_keyword->rewrite($rewriter, $parents);
    $name = $this->_name->rewrite($rewriter, $parents);
    $colon = $this->_colon->rewrite($rewriter, $parents);
    $base = $this->_base->rewrite($rewriter, $parents);
    $type = $this->_type->rewrite($rewriter, $parents);
    $left_brace = $this->_left_brace->rewrite($rewriter, $parents);
    $enumerators = $this->_enumerators->rewrite($rewriter, $parents);
    $right_brace = $this->_right_brace->rewrite($rewriter, $parents);
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
    return new static(
      $this->_attribute_spec,
      $value,
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

  public function getColonUNTYPED(): EditableNode {
    return $this->_colon;
  }

  public function withColon(EditableNode $value): this {
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

  public function getBaseUNTYPED(): EditableNode {
    return $this->_base;
  }

  public function withBase(EditableNode $value): this {
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
  public function getBase(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_base);
  }

  /**
   * @return ClassnameTypeSpecifier | GenericTypeSpecifier | SimpleTypeSpecifier
   */
  public function getBasex(): EditableNode {
    return $this->getBase();
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
      $this->_colon,
      $this->_base,
      $value,
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
    return TypeAssert\instance_of(TypeConstraint::class, $this->_type);
  }

  public function getLeftBraceUNTYPED(): EditableNode {
    return $this->_left_brace;
  }

  public function withLeftBrace(EditableNode $value): this {
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
      $value,
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

  public function getEnumeratorsUNTYPED(): EditableNode {
    return $this->_enumerators;
  }

  public function withEnumerators(EditableNode $value): this {
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
      $value,
      $this->_right_brace,
    );
  }

  public function hasEnumerators(): bool {
    return !$this->_enumerators->isMissing();
  }

  /**
   * @return EditableList<EditableNode> | null
   */
  public function getEnumerators(): ?EditableList<EditableNode> {
    if ($this->_enumerators->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableList::class, $this->_enumerators);
  }

  /**
   * @return EditableList<EditableNode>
   */
  public function getEnumeratorsx(): EditableList<EditableNode> {
    return TypeAssert\instance_of(EditableList::class, $this->_enumerators);
  }

  public function getRightBraceUNTYPED(): EditableNode {
    return $this->_right_brace;
  }

  public function withRightBrace(EditableNode $value): this {
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
      $value,
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
