/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<808bc764a93e6b8208025319d22d9e72>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class PocketEnumDeclaration extends EditableNode {

  private EditableNode $_modifiers;
  private EditableNode $_enum;
  private EditableNode $_name;
  private EditableNode $_left_brace;
  private EditableNode $_fields;
  private EditableNode $_right_brace;

  public function __construct(
    EditableNode $modifiers,
    EditableNode $enum,
    EditableNode $name,
    EditableNode $left_brace,
    EditableNode $fields,
    EditableNode $right_brace,
  ) {
    parent::__construct('pocket_enum_declaration');
    $this->_modifiers = $modifiers;
    $this->_enum = $enum;
    $this->_name = $name;
    $this->_left_brace = $left_brace;
    $this->_fields = $fields;
    $this->_right_brace = $right_brace;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
  ): this {
    $modifiers = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['pocket_enum_modifiers'],
      $file,
      $offset,
      $source,
    );
    $offset += $modifiers->getWidth();
    $enum = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['pocket_enum_enum'],
      $file,
      $offset,
      $source,
    );
    $offset += $enum->getWidth();
    $name = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['pocket_enum_name'],
      $file,
      $offset,
      $source,
    );
    $offset += $name->getWidth();
    $left_brace = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['pocket_enum_left_brace'],
      $file,
      $offset,
      $source,
    );
    $offset += $left_brace->getWidth();
    $fields = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['pocket_enum_fields'],
      $file,
      $offset,
      $source,
    );
    $offset += $fields->getWidth();
    $right_brace = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['pocket_enum_right_brace'],
      $file,
      $offset,
      $source,
    );
    $offset += $right_brace->getWidth();
    return new static(
      $modifiers,
      $enum,
      $name,
      $left_brace,
      $fields,
      $right_brace,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
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
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?vec<EditableNode> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $modifiers = $this->_modifiers->rewrite($rewriter, $parents);
    $enum = $this->_enum->rewrite($rewriter, $parents);
    $name = $this->_name->rewrite($rewriter, $parents);
    $left_brace = $this->_left_brace->rewrite($rewriter, $parents);
    $fields = $this->_fields->rewrite($rewriter, $parents);
    $right_brace = $this->_right_brace->rewrite($rewriter, $parents);
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

  public function getModifiersUNTYPED(): EditableNode {
    return $this->_modifiers;
  }

  public function withModifiers(EditableNode $value): this {
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
  public function getModifiers(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_modifiers);
  }

  /**
   * @return unknown
   */
  public function getModifiersx(): EditableNode {
    return $this->getModifiers();
  }

  public function getEnumUNTYPED(): EditableNode {
    return $this->_enum;
  }

  public function withEnum(EditableNode $value): this {
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
  public function getEnum(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_enum);
  }

  /**
   * @return unknown
   */
  public function getEnumx(): EditableNode {
    return $this->getEnum();
  }

  public function getNameUNTYPED(): EditableNode {
    return $this->_name;
  }

  public function withName(EditableNode $value): this {
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
  public function getName(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_name);
  }

  /**
   * @return unknown
   */
  public function getNamex(): EditableNode {
    return $this->getName();
  }

  public function getLeftBraceUNTYPED(): EditableNode {
    return $this->_left_brace;
  }

  public function withLeftBrace(EditableNode $value): this {
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
  public function getLeftBrace(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_left_brace);
  }

  /**
   * @return unknown
   */
  public function getLeftBracex(): EditableNode {
    return $this->getLeftBrace();
  }

  public function getFieldsUNTYPED(): EditableNode {
    return $this->_fields;
  }

  public function withFields(EditableNode $value): this {
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
  public function getFields(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_fields);
  }

  /**
   * @return unknown
   */
  public function getFieldsx(): EditableNode {
    return $this->getFields();
  }

  public function getRightBraceUNTYPED(): EditableNode {
    return $this->_right_brace;
  }

  public function withRightBrace(EditableNode $value): this {
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
  public function getRightBrace(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_right_brace);
  }

  /**
   * @return unknown
   */
  public function getRightBracex(): EditableNode {
    return $this->getRightBrace();
  }
}
