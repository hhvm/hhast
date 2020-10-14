/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<5152497e871f3af42d0a9fbe7bdc8582>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class EnumClassDeclaration extends Node {

  const string SYNTAX_KIND = 'enum_class_declaration';

  private ?Node $_attribute_spec;
  private ?Node $_enum_keyword;
  private ?Node $_class_keyword;
  private ?Node $_name;
  private ?Node $_colon;
  private ?Node $_base;
  private ?Node $_extends;
  private ?Node $_extends_list;
  private ?Node $_left_brace;
  private ?Node $_elements;
  private ?Node $_right_brace;

  public function __construct(
    ?Node $attribute_spec,
    ?Node $enum_keyword,
    ?Node $class_keyword,
    ?Node $name,
    ?Node $colon,
    ?Node $base,
    ?Node $extends,
    ?Node $extends_list,
    ?Node $left_brace,
    ?Node $elements,
    ?Node $right_brace,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_attribute_spec = $attribute_spec;
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
    dict<string, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
    string $_type_hint,
  ): this {
    $offset = $initial_offset;
    $attribute_spec = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['enum_class_attribute_spec'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $attribute_spec?->getWidth() ?? 0;
    $enum_keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['enum_class_enum_keyword'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $enum_keyword?->getWidth() ?? 0;
    $class_keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['enum_class_class_keyword'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $class_keyword?->getWidth() ?? 0;
    $name = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['enum_class_name'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $name?->getWidth() ?? 0;
    $colon = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['enum_class_colon'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $colon?->getWidth() ?? 0;
    $base = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['enum_class_base'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $base?->getWidth() ?? 0;
    $extends = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['enum_class_extends'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $extends?->getWidth() ?? 0;
    $extends_list = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['enum_class_extends_list'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $extends_list?->getWidth() ?? 0;
    $left_brace = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['enum_class_left_brace'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $left_brace?->getWidth() ?? 0;
    $elements = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['enum_class_elements'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $elements?->getWidth() ?? 0;
    $right_brace = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['enum_class_right_brace'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $right_brace?->getWidth() ?? 0;
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $attribute_spec,
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
    $enum_keyword = $this->_enum_keyword === null
      ? null
      : $rewriter($this->_enum_keyword, $parents);
    $class_keyword = $this->_class_keyword === null
      ? null
      : $rewriter($this->_class_keyword, $parents);
    $name = $this->_name === null ? null : $rewriter($this->_name, $parents);
    $colon = $this->_colon === null ? null : $rewriter($this->_colon, $parents);
    $base = $this->_base === null ? null : $rewriter($this->_base, $parents);
    $extends = $this->_extends === null
      ? null
      : $rewriter($this->_extends, $parents);
    $extends_list = $this->_extends_list === null
      ? null
      : $rewriter($this->_extends_list, $parents);
    $left_brace = $this->_left_brace === null
      ? null
      : $rewriter($this->_left_brace, $parents);
    $elements = $this->_elements === null
      ? null
      : $rewriter($this->_elements, $parents);
    $right_brace = $this->_right_brace === null
      ? null
      : $rewriter($this->_right_brace, $parents);
    if (
      $attribute_spec === $this->_attribute_spec &&
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
      /* HH_FIXME[4110] use `as` */ $attribute_spec,
      /* HH_FIXME[4110] use `as` */ $enum_keyword,
      /* HH_FIXME[4110] use `as` */ $class_keyword,
      /* HH_FIXME[4110] use `as` */ $name,
      /* HH_FIXME[4110] use `as` */ $colon,
      /* HH_FIXME[4110] use `as` */ $base,
      /* HH_FIXME[4110] use `as` */ $extends,
      /* HH_FIXME[4110] use `as` */ $extends_list,
      /* HH_FIXME[4110] use `as` */ $left_brace,
      /* HH_FIXME[4110] use `as` */ $elements,
      /* HH_FIXME[4110] use `as` */ $right_brace,
    );
  }

  public function getAttributeSpecUNTYPED(): ?Node {
    return $this->_attribute_spec;
  }

  public function withAttributeSpec(?Node $value): this {
    if ($value === $this->_attribute_spec) {
      return $this;
    }
    return new static(
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

  public function hasAttributeSpec(): bool {
    return $this->_attribute_spec !== null;
  }

  /**
   * @return unknown
   */
  public function getAttributeSpec(): ?Node {
    return $this->_attribute_spec;
  }

  /**
   * @return unknown
   */
  public function getAttributeSpecx(): Node {
    return TypeAssert\not_null($this->getAttributeSpec());
  }

  public function getEnumKeywordUNTYPED(): ?Node {
    return $this->_enum_keyword;
  }

  public function withEnumKeyword(?Node $value): this {
    if ($value === $this->_enum_keyword) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
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
    return $this->_enum_keyword !== null;
  }

  /**
   * @return unknown
   */
  public function getEnumKeyword(): ?Node {
    return $this->_enum_keyword;
  }

  /**
   * @return unknown
   */
  public function getEnumKeywordx(): Node {
    return TypeAssert\not_null($this->getEnumKeyword());
  }

  public function getClassKeywordUNTYPED(): ?Node {
    return $this->_class_keyword;
  }

  public function withClassKeyword(?Node $value): this {
    if ($value === $this->_class_keyword) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
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
    return $this->_class_keyword !== null;
  }

  /**
   * @return unknown
   */
  public function getClassKeyword(): ?Node {
    return $this->_class_keyword;
  }

  /**
   * @return unknown
   */
  public function getClassKeywordx(): Node {
    return TypeAssert\not_null($this->getClassKeyword());
  }

  public function getNameUNTYPED(): ?Node {
    return $this->_name;
  }

  public function withName(?Node $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
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
    return $this->_name !== null;
  }

  /**
   * @return unknown
   */
  public function getName(): ?Node {
    return $this->_name;
  }

  /**
   * @return unknown
   */
  public function getNamex(): Node {
    return TypeAssert\not_null($this->getName());
  }

  public function getColonUNTYPED(): ?Node {
    return $this->_colon;
  }

  public function withColon(?Node $value): this {
    if ($value === $this->_colon) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
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
    return $this->_colon !== null;
  }

  /**
   * @return unknown
   */
  public function getColon(): ?Node {
    return $this->_colon;
  }

  /**
   * @return unknown
   */
  public function getColonx(): Node {
    return TypeAssert\not_null($this->getColon());
  }

  public function getBaseUNTYPED(): ?Node {
    return $this->_base;
  }

  public function withBase(?Node $value): this {
    if ($value === $this->_base) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
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
    return $this->_base !== null;
  }

  /**
   * @return unknown
   */
  public function getBase(): ?Node {
    return $this->_base;
  }

  /**
   * @return unknown
   */
  public function getBasex(): Node {
    return TypeAssert\not_null($this->getBase());
  }

  public function getExtendsUNTYPED(): ?Node {
    return $this->_extends;
  }

  public function withExtends(?Node $value): this {
    if ($value === $this->_extends) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
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
   * @return unknown
   */
  public function getExtends(): ?Node {
    return $this->_extends;
  }

  /**
   * @return unknown
   */
  public function getExtendsx(): Node {
    return TypeAssert\not_null($this->getExtends());
  }

  public function getExtendsListUNTYPED(): ?Node {
    return $this->_extends_list;
  }

  public function withExtendsList(?Node $value): this {
    if ($value === $this->_extends_list) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
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
   * @return unknown
   */
  public function getExtendsList(): ?Node {
    return $this->_extends_list;
  }

  /**
   * @return unknown
   */
  public function getExtendsListx(): Node {
    return TypeAssert\not_null($this->getExtendsList());
  }

  public function getLeftBraceUNTYPED(): ?Node {
    return $this->_left_brace;
  }

  public function withLeftBrace(?Node $value): this {
    if ($value === $this->_left_brace) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
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
    return $this->_left_brace !== null;
  }

  /**
   * @return unknown
   */
  public function getLeftBrace(): ?Node {
    return $this->_left_brace;
  }

  /**
   * @return unknown
   */
  public function getLeftBracex(): Node {
    return TypeAssert\not_null($this->getLeftBrace());
  }

  public function getElementsUNTYPED(): ?Node {
    return $this->_elements;
  }

  public function withElements(?Node $value): this {
    if ($value === $this->_elements) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
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
   * @return unknown
   */
  public function getElements(): ?Node {
    return $this->_elements;
  }

  /**
   * @return unknown
   */
  public function getElementsx(): Node {
    return TypeAssert\not_null($this->getElements());
  }

  public function getRightBraceUNTYPED(): ?Node {
    return $this->_right_brace;
  }

  public function withRightBrace(?Node $value): this {
    if ($value === $this->_right_brace) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
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
    return $this->_right_brace !== null;
  }

  /**
   * @return unknown
   */
  public function getRightBrace(): ?Node {
    return $this->_right_brace;
  }

  /**
   * @return unknown
   */
  public function getRightBracex(): Node {
    return TypeAssert\not_null($this->getRightBrace());
  }
}
