/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<3a36a0b8386545b648851d69b3701ce9>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class PocketEnumDeclaration extends Node {

  const string SYNTAX_KIND = 'pocket_enum_declaration';

  private Node $_modifiers;
  private Node $_enum;
  private Node $_name;
  private Node $_left_brace;
  private Node $_fields;
  private Node $_right_brace;

  public function __construct(
    Node $modifiers,
    Node $enum,
    Node $name,
    Node $left_brace,
    Node $fields,
    Node $right_brace,
    ?__Private\SourceRef $source_ref = null,
  ) {
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
    $modifiers = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['pocket_enum_modifiers'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $modifiers->getWidth();
    $enum = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['pocket_enum_enum'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $enum->getWidth();
    $name = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['pocket_enum_name'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $name->getWidth();
    $left_brace = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['pocket_enum_left_brace'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $left_brace->getWidth();
    $fields = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['pocket_enum_fields'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $fields->getWidth();
    $right_brace = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['pocket_enum_right_brace'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $right_brace->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      $modifiers,
      $enum,
      $name,
      $left_brace,
      $fields,
      $right_brace,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'modifiers' => $this->_modifiers,
      'enum' => $this->_enum,
      'name' => $this->_name,
      'left_brace' => $this->_left_brace,
      'fields' => $this->_fields,
      'right_brace' => $this->_right_brace,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $modifiers = $rewriter($this->_modifiers, $parents);
    $enum = $rewriter($this->_enum, $parents);
    $name = $rewriter($this->_name, $parents);
    $left_brace = $rewriter($this->_left_brace, $parents);
    $fields = $rewriter($this->_fields, $parents);
    $right_brace = $rewriter($this->_right_brace, $parents);
    if (
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
      $modifiers,
      $enum,
      $name,
      $left_brace,
      $fields,
      $right_brace,
    );
  }

  public function getModifiersUNTYPED(): Node {
    return $this->_modifiers;
  }

  public function withModifiers(Node $value): this {
    if ($value === $this->_modifiers) {
      return $this;
    }
    return new static(
      $value,
      $this->_enum,
      $this->_name,
      $this->_left_brace,
      $this->_fields,
      $this->_right_brace,
    );
  }

  public function hasModifiers(): bool {
    return !$this->_modifiers->isMissing();
  }

  /**
   * @return unknown
   */
  public function getModifiers(): Node {
    return $this->_modifiers;
  }

  /**
   * @return unknown
   */
  public function getModifiersx(): Node {
    return $this->getModifiers();
  }

  public function getEnumUNTYPED(): Node {
    return $this->_enum;
  }

  public function withEnum(Node $value): this {
    if ($value === $this->_enum) {
      return $this;
    }
    return new static(
      $this->_modifiers,
      $value,
      $this->_name,
      $this->_left_brace,
      $this->_fields,
      $this->_right_brace,
    );
  }

  public function hasEnum(): bool {
    return !$this->_enum->isMissing();
  }

  /**
   * @return unknown
   */
  public function getEnum(): Node {
    return $this->_enum;
  }

  /**
   * @return unknown
   */
  public function getEnumx(): Node {
    return $this->getEnum();
  }

  public function getNameUNTYPED(): Node {
    return $this->_name;
  }

  public function withName(Node $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new static(
      $this->_modifiers,
      $this->_enum,
      $value,
      $this->_left_brace,
      $this->_fields,
      $this->_right_brace,
    );
  }

  public function hasName(): bool {
    return !$this->_name->isMissing();
  }

  /**
   * @return unknown
   */
  public function getName(): Node {
    return $this->_name;
  }

  /**
   * @return unknown
   */
  public function getNamex(): Node {
    return $this->getName();
  }

  public function getLeftBraceUNTYPED(): Node {
    return $this->_left_brace;
  }

  public function withLeftBrace(Node $value): this {
    if ($value === $this->_left_brace) {
      return $this;
    }
    return new static(
      $this->_modifiers,
      $this->_enum,
      $this->_name,
      $value,
      $this->_fields,
      $this->_right_brace,
    );
  }

  public function hasLeftBrace(): bool {
    return !$this->_left_brace->isMissing();
  }

  /**
   * @return unknown
   */
  public function getLeftBrace(): Node {
    return $this->_left_brace;
  }

  /**
   * @return unknown
   */
  public function getLeftBracex(): Node {
    return $this->getLeftBrace();
  }

  public function getFieldsUNTYPED(): Node {
    return $this->_fields;
  }

  public function withFields(Node $value): this {
    if ($value === $this->_fields) {
      return $this;
    }
    return new static(
      $this->_modifiers,
      $this->_enum,
      $this->_name,
      $this->_left_brace,
      $value,
      $this->_right_brace,
    );
  }

  public function hasFields(): bool {
    return !$this->_fields->isMissing();
  }

  /**
   * @return unknown
   */
  public function getFields(): Node {
    return $this->_fields;
  }

  /**
   * @return unknown
   */
  public function getFieldsx(): Node {
    return $this->getFields();
  }

  public function getRightBraceUNTYPED(): Node {
    return $this->_right_brace;
  }

  public function withRightBrace(Node $value): this {
    if ($value === $this->_right_brace) {
      return $this;
    }
    return new static(
      $this->_modifiers,
      $this->_enum,
      $this->_name,
      $this->_left_brace,
      $this->_fields,
      $value,
    );
  }

  public function hasRightBrace(): bool {
    return !$this->_right_brace->isMissing();
  }

  /**
   * @return unknown
   */
  public function getRightBrace(): Node {
    return $this->_right_brace;
  }

  /**
   * @return unknown
   */
  public function getRightBracex(): Node {
    return $this->getRightBrace();
  }
}
