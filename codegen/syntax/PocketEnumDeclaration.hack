/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<3d18a51a66d18403af72627b9eb3d711>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class PocketEnumDeclaration extends Node {

  const string SYNTAX_KIND = 'pocket_enum_declaration';

  private ?Node $_attributes;
  private ?Node $_modifiers;
  private ?Node $_enum;
  private ?Node $_name;
  private ?Node $_left_brace;
  private ?Node $_fields;
  private ?Node $_right_brace;

  public function __construct(
    ?Node $attributes,
    ?Node $modifiers,
    ?Node $enum,
    ?Node $name,
    ?Node $left_brace,
    ?Node $fields,
    ?Node $right_brace,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_attributes = $attributes;
    $this->_modifiers = $modifiers;
    $this->_enum = $enum;
    $this->_name = $name;
    $this->_left_brace = $left_brace;
    $this->_fields = $fields;
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
    $attributes = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['pocket_enum_attributes'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $attributes?->getWidth() ?? 0;
    $modifiers = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['pocket_enum_modifiers'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $modifiers?->getWidth() ?? 0;
    $enum = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['pocket_enum_enum'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $enum?->getWidth() ?? 0;
    $name = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['pocket_enum_name'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $name?->getWidth() ?? 0;
    $left_brace = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['pocket_enum_left_brace'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $left_brace?->getWidth() ?? 0;
    $fields = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['pocket_enum_fields'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $fields?->getWidth() ?? 0;
    $right_brace = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['pocket_enum_right_brace'] ?? dict['kind' => 'missing'],
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
      /* HH_IGNORE_ERROR[4110] */ $attributes,
      /* HH_IGNORE_ERROR[4110] */ $modifiers,
      /* HH_IGNORE_ERROR[4110] */ $enum,
      /* HH_IGNORE_ERROR[4110] */ $name,
      /* HH_IGNORE_ERROR[4110] */ $left_brace,
      /* HH_IGNORE_ERROR[4110] */ $fields,
      /* HH_IGNORE_ERROR[4110] */ $right_brace,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'attributes' => $this->_attributes,
      'modifiers' => $this->_modifiers,
      'enum' => $this->_enum,
      'name' => $this->_name,
      'left_brace' => $this->_left_brace,
      'fields' => $this->_fields,
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
    $attributes = $this->_attributes === null
      ? null
      : $rewriter($this->_attributes, $parents);
    $modifiers = $this->_modifiers === null
      ? null
      : $rewriter($this->_modifiers, $parents);
    $enum = $this->_enum === null ? null : $rewriter($this->_enum, $parents);
    $name = $this->_name === null ? null : $rewriter($this->_name, $parents);
    $left_brace = $this->_left_brace === null
      ? null
      : $rewriter($this->_left_brace, $parents);
    $fields = $this->_fields === null
      ? null
      : $rewriter($this->_fields, $parents);
    $right_brace = $this->_right_brace === null
      ? null
      : $rewriter($this->_right_brace, $parents);
    if (
      $attributes === $this->_attributes &&
      $modifiers === $this->_modifiers &&
      $enum === $this->_enum &&
      $name === $this->_name &&
      $left_brace === $this->_left_brace &&
      $fields === $this->_fields &&
      $right_brace === $this->_right_brace
    ) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $attributes,
      /* HH_FIXME[4110] use `as` */ $modifiers,
      /* HH_FIXME[4110] use `as` */ $enum,
      /* HH_FIXME[4110] use `as` */ $name,
      /* HH_FIXME[4110] use `as` */ $left_brace,
      /* HH_FIXME[4110] use `as` */ $fields,
      /* HH_FIXME[4110] use `as` */ $right_brace,
    );
  }

  public function getAttributesUNTYPED(): ?Node {
    return $this->_attributes;
  }

  public function withAttributes(?Node $value): this {
    if ($value === $this->_attributes) {
      return $this;
    }
    return new static(
      $value,
      $this->_modifiers,
      $this->_enum,
      $this->_name,
      $this->_left_brace,
      $this->_fields,
      $this->_right_brace,
    );
  }

  public function hasAttributes(): bool {
    return $this->_attributes !== null;
  }

  /**
   * @return unknown
   */
  public function getAttributes(): ?Node {
    return $this->_attributes;
  }

  /**
   * @return unknown
   */
  public function getAttributesx(): Node {
    return TypeAssert\not_null($this->getAttributes());
  }

  public function getModifiersUNTYPED(): ?Node {
    return $this->_modifiers;
  }

  public function withModifiers(?Node $value): this {
    if ($value === $this->_modifiers) {
      return $this;
    }
    return new static(
      $this->_attributes,
      $value,
      $this->_enum,
      $this->_name,
      $this->_left_brace,
      $this->_fields,
      $this->_right_brace,
    );
  }

  public function hasModifiers(): bool {
    return $this->_modifiers !== null;
  }

  /**
   * @return unknown
   */
  public function getModifiers(): ?Node {
    return $this->_modifiers;
  }

  /**
   * @return unknown
   */
  public function getModifiersx(): Node {
    return TypeAssert\not_null($this->getModifiers());
  }

  public function getEnumUNTYPED(): ?Node {
    return $this->_enum;
  }

  public function withEnum(?Node $value): this {
    if ($value === $this->_enum) {
      return $this;
    }
    return new static(
      $this->_attributes,
      $this->_modifiers,
      $value,
      $this->_name,
      $this->_left_brace,
      $this->_fields,
      $this->_right_brace,
    );
  }

  public function hasEnum(): bool {
    return $this->_enum !== null;
  }

  /**
   * @return unknown
   */
  public function getEnum(): ?Node {
    return $this->_enum;
  }

  /**
   * @return unknown
   */
  public function getEnumx(): Node {
    return TypeAssert\not_null($this->getEnum());
  }

  public function getNameUNTYPED(): ?Node {
    return $this->_name;
  }

  public function withName(?Node $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new static(
      $this->_attributes,
      $this->_modifiers,
      $this->_enum,
      $value,
      $this->_left_brace,
      $this->_fields,
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

  public function getLeftBraceUNTYPED(): ?Node {
    return $this->_left_brace;
  }

  public function withLeftBrace(?Node $value): this {
    if ($value === $this->_left_brace) {
      return $this;
    }
    return new static(
      $this->_attributes,
      $this->_modifiers,
      $this->_enum,
      $this->_name,
      $value,
      $this->_fields,
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

  public function getFieldsUNTYPED(): ?Node {
    return $this->_fields;
  }

  public function withFields(?Node $value): this {
    if ($value === $this->_fields) {
      return $this;
    }
    return new static(
      $this->_attributes,
      $this->_modifiers,
      $this->_enum,
      $this->_name,
      $this->_left_brace,
      $value,
      $this->_right_brace,
    );
  }

  public function hasFields(): bool {
    return $this->_fields !== null;
  }

  /**
   * @return unknown
   */
  public function getFields(): ?Node {
    return $this->_fields;
  }

  /**
   * @return unknown
   */
  public function getFieldsx(): Node {
    return TypeAssert\not_null($this->getFields());
  }

  public function getRightBraceUNTYPED(): ?Node {
    return $this->_right_brace;
  }

  public function withRightBrace(?Node $value): this {
    if ($value === $this->_right_brace) {
      return $this;
    }
    return new static(
      $this->_attributes,
      $this->_modifiers,
      $this->_enum,
      $this->_name,
      $this->_left_brace,
      $this->_fields,
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
