/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<775bb4871801a3ab2ee7943bac91172d>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;
/* HHAST_IGNORE_ALL[5607] 5607 is ignored because of false positives when comparing a generic to a typed value */
/* HHAST_IGNORE_ALL[5624] HHAST_IGNORE_ALL[5639] 5624 and 5639 are ignored because they insist on using co(tra)variant generics. Could this break external consumers? */

<<__ConsistentConstruct>>
final class EnumClassDeclaration extends Node {

  const string SYNTAX_KIND = 'enum_class_declaration';

  private ?OldAttributeSpecification $_attribute_spec;
  private ?Node $_modifiers;
  private EnumToken $_enum_keyword;
  private ClassToken $_class_keyword;
  private NameToken $_name;
  private ColonToken $_colon;
  private ISimpleCreationSpecifier $_base;
  private ?ExtendsToken $_extends;
  private ?NodeList<ListItem<SimpleTypeSpecifier>> $_extends_list;
  private LeftBraceToken $_left_brace;
  private ?NodeList<EnumClassEnumerator> $_elements;
  private RightBraceToken $_right_brace;

  public function __construct(
    ?OldAttributeSpecification $attribute_spec,
    ?Node $modifiers,
    EnumToken $enum_keyword,
    ClassToken $class_keyword,
    NameToken $name,
    ColonToken $colon,
    ISimpleCreationSpecifier $base,
    ?ExtendsToken $extends,
    ?NodeList<ListItem<SimpleTypeSpecifier>> $extends_list,
    LeftBraceToken $left_brace,
    ?NodeList<EnumClassEnumerator> $elements,
    RightBraceToken $right_brace,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_attribute_spec = $attribute_spec;
    $this->_modifiers = $modifiers;
    $this->_enum_keyword = $enum_keyword;
    $this->_class_keyword = $class_keyword;
    $this->_name = $name;
    $this->_colon = $colon;
    $this->_base = $base;
    $this->_extends = $extends;
    $this->_extends_list = $extends_list;
    $this->_left_brace = $left_brace;
    $this->_elements = $elements;
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
      ($json['enum_class_attribute_spec'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'OldAttributeSpecification',
    );
    $offset += $attribute_spec?->getWidth() ?? 0;
    $modifiers = Node::fromJSON(
      ($json['enum_class_modifiers'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $modifiers?->getWidth() ?? 0;
    $enum_keyword = Node::fromJSON(
      ($json['enum_class_enum_keyword']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'EnumToken',
    );
    $enum_keyword = $enum_keyword as nonnull;
    $offset += $enum_keyword->getWidth();
    $class_keyword = Node::fromJSON(
      ($json['enum_class_class_keyword']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'ClassToken',
    );
    $class_keyword = $class_keyword as nonnull;
    $offset += $class_keyword->getWidth();
    $name = Node::fromJSON(
      ($json['enum_class_name']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'NameToken',
    );
    $name = $name as nonnull;
    $offset += $name->getWidth();
    $colon = Node::fromJSON(
      ($json['enum_class_colon']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'ColonToken',
    );
    $colon = $colon as nonnull;
    $offset += $colon->getWidth();
    $base = Node::fromJSON(
      ($json['enum_class_base']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'ISimpleCreationSpecifier',
    );
    $base = $base as nonnull;
    $offset += $base->getWidth();
    $extends = Node::fromJSON(
      ($json['enum_class_extends'] ?? dict['kind' => 'missing']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'ExtendsToken',
    );
    $offset += $extends?->getWidth() ?? 0;
    $extends_list = Node::fromJSON(
      ($json['enum_class_extends_list'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'NodeList<ListItem<SimpleTypeSpecifier>>',
    );
    $offset += $extends_list?->getWidth() ?? 0;
    $left_brace = Node::fromJSON(
      ($json['enum_class_left_brace']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'LeftBraceToken',
    );
    $left_brace = $left_brace as nonnull;
    $offset += $left_brace->getWidth();
    $elements = Node::fromJSON(
      ($json['enum_class_elements'] ?? dict['kind' => 'missing']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'NodeList<EnumClassEnumerator>',
    );
    $offset += $elements?->getWidth() ?? 0;
    $right_brace = Node::fromJSON(
      ($json['enum_class_right_brace']) as dict<_, _>,
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
      /* HH_IGNORE_ERROR[4110] */ $enum_keyword,
      /* HH_IGNORE_ERROR[4110] */ $class_keyword,
      /* HH_IGNORE_ERROR[4110] */ $name,
      /* HH_IGNORE_ERROR[4110] */ $colon,
      /* HH_IGNORE_ERROR[4110] */ $base,
      /* HH_IGNORE_ERROR[4110] */ $extends,
      /* HH_IGNORE_ERROR[4110] */ $extends_list,
      /* HH_IGNORE_ERROR[4110] */ $left_brace,
      /* HH_IGNORE_ERROR[4110] */ $elements,
      /* HH_IGNORE_ERROR[4110] */ $right_brace,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'attribute_spec' => $this->_attribute_spec,
      'modifiers' => $this->_modifiers,
      'enum_keyword' => $this->_enum_keyword,
      'class_keyword' => $this->_class_keyword,
      'name' => $this->_name,
      'colon' => $this->_colon,
      'base' => $this->_base,
      'extends' => $this->_extends,
      'extends_list' => $this->_extends_list,
      'left_brace' => $this->_left_brace,
      'elements' => $this->_elements,
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
    $enum_keyword = $rewriter($this->_enum_keyword, $parents);
    $class_keyword = $rewriter($this->_class_keyword, $parents);
    $name = $rewriter($this->_name, $parents);
    $colon = $rewriter($this->_colon, $parents);
    $base = $rewriter($this->_base, $parents);
    $extends =
      $this->_extends === null ? null : $rewriter($this->_extends, $parents);
    $extends_list = $this->_extends_list === null
      ? null
      : $rewriter($this->_extends_list, $parents);
    $left_brace = $rewriter($this->_left_brace, $parents);
    $elements =
      $this->_elements === null ? null : $rewriter($this->_elements, $parents);
    $right_brace = $rewriter($this->_right_brace, $parents);
    if (
      $attribute_spec === $this->_attribute_spec &&
      $modifiers === $this->_modifiers &&
      $enum_keyword === $this->_enum_keyword &&
      $class_keyword === $this->_class_keyword &&
      $name === $this->_name &&
      $colon === $this->_colon &&
      $base === $this->_base &&
      $extends === $this->_extends &&
      $extends_list === $this->_extends_list &&
      $left_brace === $this->_left_brace &&
      $elements === $this->_elements &&
      $right_brace === $this->_right_brace
    ) {
      return $this;
    }
    return new static(
      $attribute_spec as ?OldAttributeSpecification,
      $modifiers as ?Node,
      $enum_keyword as EnumToken,
      $class_keyword as ClassToken,
      $name as NameToken,
      $colon as ColonToken,
      $base as ISimpleCreationSpecifier,
      $extends as ?ExtendsToken,
      /* HH_FIXME[4110] ?NodeList<ListItem<SimpleTypeSpecifier>> may not be enforceable */ $extends_list,
      $left_brace as LeftBraceToken,
      /* HH_FIXME[4110] ?NodeList<EnumClassEnumerator> may not be enforceable */ $elements,
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
      $this->_enum_keyword,
      $this->_class_keyword,
      $this->_name,
      $this->_colon,
      $this->_base,
      $this->_extends,
      $this->_extends_list,
      $this->_left_brace,
      $this->_elements,
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

  public function withModifiers(?Node $value): this {
    if ($value === $this->_modifiers) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $value,
      $this->_enum_keyword,
      $this->_class_keyword,
      $this->_name,
      $this->_colon,
      $this->_base,
      $this->_extends,
      $this->_extends_list,
      $this->_left_brace,
      $this->_elements,
      $this->_right_brace,
    );
  }

  public function hasModifiers(): bool {
    return $this->_modifiers !== null;
  }

  /**
   * @return null
   */
  public function getModifiers(): ?Node {
    return $this->_modifiers;
  }

  /**
   * @return
   */
  public function getModifiersx(): Node {
    return TypeAssert\not_null($this->getModifiers());
  }

  public function getEnumKeywordUNTYPED(): ?Node {
    return $this->_enum_keyword;
  }

  public function withEnumKeyword(EnumToken $value): this {
    if ($value === $this->_enum_keyword) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_modifiers,
      $value,
      $this->_class_keyword,
      $this->_name,
      $this->_colon,
      $this->_base,
      $this->_extends,
      $this->_extends_list,
      $this->_left_brace,
      $this->_elements,
      $this->_right_brace,
    );
  }

  public function hasEnumKeyword(): bool {
    return true;
  }

  /**
   * @return EnumToken
   */
  public function getEnumKeyword(): EnumToken {
    return TypeAssert\instance_of(EnumToken::class, $this->_enum_keyword);
  }

  /**
   * @return EnumToken
   */
  public function getEnumKeywordx(): EnumToken {
    return $this->getEnumKeyword();
  }

  public function getClassKeywordUNTYPED(): ?Node {
    return $this->_class_keyword;
  }

  public function withClassKeyword(ClassToken $value): this {
    if ($value === $this->_class_keyword) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_modifiers,
      $this->_enum_keyword,
      $value,
      $this->_name,
      $this->_colon,
      $this->_base,
      $this->_extends,
      $this->_extends_list,
      $this->_left_brace,
      $this->_elements,
      $this->_right_brace,
    );
  }

  public function hasClassKeyword(): bool {
    return true;
  }

  /**
   * @return ClassToken
   */
  public function getClassKeyword(): ClassToken {
    return TypeAssert\instance_of(ClassToken::class, $this->_class_keyword);
  }

  /**
   * @return ClassToken
   */
  public function getClassKeywordx(): ClassToken {
    return $this->getClassKeyword();
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
      $this->_enum_keyword,
      $this->_class_keyword,
      $value,
      $this->_colon,
      $this->_base,
      $this->_extends,
      $this->_extends_list,
      $this->_left_brace,
      $this->_elements,
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
      $this->_enum_keyword,
      $this->_class_keyword,
      $this->_name,
      $value,
      $this->_base,
      $this->_extends,
      $this->_extends_list,
      $this->_left_brace,
      $this->_elements,
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

  public function withBase(ISimpleCreationSpecifier $value): this {
    if ($value === $this->_base) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_modifiers,
      $this->_enum_keyword,
      $this->_class_keyword,
      $this->_name,
      $this->_colon,
      $value,
      $this->_extends,
      $this->_extends_list,
      $this->_left_brace,
      $this->_elements,
      $this->_right_brace,
    );
  }

  public function hasBase(): bool {
    return true;
  }

  /**
   * @return GenericTypeSpecifier | SimpleTypeSpecifier
   */
  public function getBase(): ISimpleCreationSpecifier {
    return
      TypeAssert\instance_of(ISimpleCreationSpecifier::class, $this->_base);
  }

  /**
   * @return GenericTypeSpecifier | SimpleTypeSpecifier
   */
  public function getBasex(): ISimpleCreationSpecifier {
    return $this->getBase();
  }

  public function getExtendsUNTYPED(): ?Node {
    return $this->_extends;
  }

  public function withExtends(?ExtendsToken $value): this {
    if ($value === $this->_extends) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_modifiers,
      $this->_enum_keyword,
      $this->_class_keyword,
      $this->_name,
      $this->_colon,
      $this->_base,
      $value,
      $this->_extends_list,
      $this->_left_brace,
      $this->_elements,
      $this->_right_brace,
    );
  }

  public function hasExtends(): bool {
    return $this->_extends !== null;
  }

  /**
   * @return null | ExtendsToken
   */
  public function getExtends(): ?ExtendsToken {
    return $this->_extends;
  }

  /**
   * @return ExtendsToken
   */
  public function getExtendsx(): ExtendsToken {
    return TypeAssert\not_null($this->getExtends());
  }

  public function getExtendsListUNTYPED(): ?Node {
    return $this->_extends_list;
  }

  public function withExtendsList(
    ?NodeList<ListItem<SimpleTypeSpecifier>> $value,
  ): this {
    if ($value === $this->_extends_list) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_modifiers,
      $this->_enum_keyword,
      $this->_class_keyword,
      $this->_name,
      $this->_colon,
      $this->_base,
      $this->_extends,
      $value,
      $this->_left_brace,
      $this->_elements,
      $this->_right_brace,
    );
  }

  public function hasExtendsList(): bool {
    return $this->_extends_list !== null;
  }

  /**
   * @return NodeList<ListItem<SimpleTypeSpecifier>> | null
   */
  public function getExtendsList(): ?NodeList<ListItem<SimpleTypeSpecifier>> {
    return $this->_extends_list;
  }

  /**
   * @return NodeList<ListItem<SimpleTypeSpecifier>>
   */
  public function getExtendsListx(): NodeList<ListItem<SimpleTypeSpecifier>> {
    return TypeAssert\not_null($this->getExtendsList());
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
      $this->_enum_keyword,
      $this->_class_keyword,
      $this->_name,
      $this->_colon,
      $this->_base,
      $this->_extends,
      $this->_extends_list,
      $value,
      $this->_elements,
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

  public function getElementsUNTYPED(): ?Node {
    return $this->_elements;
  }

  public function withElements(?NodeList<EnumClassEnumerator> $value): this {
    if ($value === $this->_elements) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_modifiers,
      $this->_enum_keyword,
      $this->_class_keyword,
      $this->_name,
      $this->_colon,
      $this->_base,
      $this->_extends,
      $this->_extends_list,
      $this->_left_brace,
      $value,
      $this->_right_brace,
    );
  }

  public function hasElements(): bool {
    return $this->_elements !== null;
  }

  /**
   * @return NodeList<EnumClassEnumerator> | null
   */
  public function getElements(): ?NodeList<EnumClassEnumerator> {
    return $this->_elements;
  }

  /**
   * @return NodeList<EnumClassEnumerator>
   */
  public function getElementsx(): NodeList<EnumClassEnumerator> {
    return TypeAssert\not_null($this->getElements());
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
      $this->_enum_keyword,
      $this->_class_keyword,
      $this->_name,
      $this->_colon,
      $this->_base,
      $this->_extends,
      $this->_extends_list,
      $this->_left_brace,
      $this->_elements,
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
