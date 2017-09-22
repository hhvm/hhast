<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<1d28bdc39fe0a6d82cf06306a787b669>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class PropertyDeclaration extends EditableNode {

  private EditableNode $_modifiers;
  private EditableNode $_type;
  private EditableNode $_declarators;
  private EditableNode $_semicolon;

  public function __construct(
    EditableNode $modifiers,
    EditableNode $type,
    EditableNode $declarators,
    EditableNode $semicolon,
  ) {
    parent::__construct('property_declaration');
    $this->_modifiers = $modifiers;
    $this->_type = $type;
    $this->_declarators = $declarators;
    $this->_semicolon = $semicolon;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $modifiers = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['property_modifiers'],
      $position,
      $source,
    );
    $position += $modifiers->getWidth();
    $type = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['property_type'],
      $position,
      $source,
    );
    $position += $type->getWidth();
    $declarators = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['property_declarators'],
      $position,
      $source,
    );
    $position += $declarators->getWidth();
    $semicolon = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['property_semicolon'],
      $position,
      $source,
    );
    $position += $semicolon->getWidth();
    return new self($modifiers, $type, $declarators, $semicolon);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableNode> {
    return dict[
      'modifiers' => $this->_modifiers,
      'type' => $this->_type,
      'declarators' => $this->_declarators,
      'semicolon' => $this->_semicolon,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?Traversable<EditableNode> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $modifiers = $this->_modifiers->rewrite($rewriter, $parents);
    $type = $this->_type->rewrite($rewriter, $parents);
    $declarators = $this->_declarators->rewrite($rewriter, $parents);
    $semicolon = $this->_semicolon->rewrite($rewriter, $parents);
    if (
      $modifiers === $this->_modifiers &&
      $type === $this->_type &&
      $declarators === $this->_declarators &&
      $semicolon === $this->_semicolon
    ) {
      return $this;
    }
    return new self($modifiers, $type, $declarators, $semicolon);
  }

  public function getModifiersUNTYPED(): EditableNode {
    return $this->_modifiers;
  }

  public function withModifiers(EditableNode $value): this {
    if ($value === $this->_modifiers) {
      return $this;
    }
    return
      new self($value, $this->_type, $this->_declarators, $this->_semicolon);
  }

  public function hasModifiers(): bool {
    return !$this->_modifiers->isMissing();
  }

  /**
   * @returns EditableList | VarToken
   */
  public function getModifiers(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_modifiers);
  }

  public function getTypeUNTYPED(): EditableNode {
    return $this->_type;
  }

  public function withType(EditableNode $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return new self(
      $this->_modifiers,
      $value,
      $this->_declarators,
      $this->_semicolon,
    );
  }

  public function hasType(): bool {
    return !$this->_type->isMissing();
  }

  /**
   * @returns Missing | NullableTypeSpecifier | GenericTypeSpecifier |
   * SimpleTypeSpecifier | TypeConstant | DictionaryTypeSpecifier |
   * MapArrayTypeSpecifier | VectorArrayTypeSpecifier | SoftTypeSpecifier |
   * TupleTypeSpecifier | ClosureTypeSpecifier
   */
  public function getType(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_type);
  }

  public function getDeclaratorsUNTYPED(): EditableNode {
    return $this->_declarators;
  }

  public function withDeclarators(EditableNode $value): this {
    if ($value === $this->_declarators) {
      return $this;
    }
    return new self($this->_modifiers, $this->_type, $value, $this->_semicolon);
  }

  public function hasDeclarators(): bool {
    return !$this->_declarators->isMissing();
  }

  /**
   * @returns EditableList
   */
  public function getDeclarators(): EditableList {
    return TypeAssert\instance_of(EditableList::class, $this->_declarators);
  }

  public function getSemicolonUNTYPED(): EditableNode {
    return $this->_semicolon;
  }

  public function withSemicolon(EditableNode $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return
      new self($this->_modifiers, $this->_type, $this->_declarators, $value);
  }

  public function hasSemicolon(): bool {
    return !$this->_semicolon->isMissing();
  }

  /**
   * @returns SemicolonToken | Missing
   */
  public function getSemicolon(): ?SemicolonToken {
    if ($this->_semicolon->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(SemicolonToken::class, $this->_semicolon);
  }

  /**
   * @returns SemicolonToken
   */
  public function getSemicolonx(): SemicolonToken {
    return TypeAssert\instance_of(SemicolonToken::class, $this->_semicolon);
  }
}
