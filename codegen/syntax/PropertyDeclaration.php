<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<6b33705ebfd881a8a8495b70bf014bdf>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class PropertyDeclaration extends EditableSyntax {

  private EditableSyntax $_modifiers;
  private EditableSyntax $_type;
  private EditableSyntax $_declarators;
  private EditableSyntax $_semicolon;

  public function __construct(
    EditableSyntax $modifiers,
    EditableSyntax $type,
    EditableSyntax $declarators,
    EditableSyntax $semicolon,
  ) {
    parent::__construct('property_declaration');
    $this->_modifiers = $modifiers;
    $this->_type = $type;
    $this->_declarators = $declarators;
    $this->_semicolon = $semicolon;
  }

  <<__Override>>
  public static function fromJSON(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $modifiers = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['property_modifiers'],
      $position,
      $source,
    );
    $position += $modifiers->getWidth();
    $type = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['property_type'],
      $position,
      $source,
    );
    $position += $type->getWidth();
    $declarators = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['property_declarators'],
      $position,
      $source,
    );
    $position += $declarators->getWidth();
    $semicolon = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['property_semicolon'],
      $position,
      $source,
    );
    $position += $semicolon->getWidth();
    return new self($modifiers, $type, $declarators, $semicolon);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'modifiers' => $this->_modifiers;
    yield 'type' => $this->_type;
    yield 'declarators' => $this->_declarators;
    yield 'semicolon' => $this->_semicolon;
  }

  <<__Override>>
  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
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

  public function getModifiersUNTYPED(): EditableSyntax {
    return $this->_modifiers;
  }

  public function withModifiers(EditableSyntax $value): this {
    if ($value === $this->_modifiers) {
      return $this;
    }
    return new self($value, $this->_type, $this->_declarators, $this->_semicolon);
  }

  public function hasModifiers(): bool {
    return !$this->_modifiers->isMissing();
  }

  public function getModifiers(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_modifiers);
  }

  public function getTypeUNTYPED(): EditableSyntax {
    return $this->_type;
  }

  public function withType(EditableSyntax $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return new self($this->_modifiers, $value, $this->_declarators, $this->_semicolon);
  }

  public function hasType(): bool {
    return !$this->_type->isMissing();
  }

  public function getType(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_type);
  }

  public function getDeclaratorsUNTYPED(): EditableSyntax {
    return $this->_declarators;
  }

  public function withDeclarators(EditableSyntax $value): this {
    if ($value === $this->_declarators) {
      return $this;
    }
    return new self($this->_modifiers, $this->_type, $value, $this->_semicolon);
  }

  public function hasDeclarators(): bool {
    return !$this->_declarators->isMissing();
  }

  public function getDeclarators(): EditableList {
    return TypeAssert::isInstanceOf(EditableList::class, $this->_declarators);
  }

  public function getSemicolonUNTYPED(): EditableSyntax {
    return $this->_semicolon;
  }

  public function withSemicolon(EditableSyntax $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new self($this->_modifiers, $this->_type, $this->_declarators, $value);
  }

  public function hasSemicolon(): bool {
    return !$this->_semicolon->isMissing();
  }

  public function getSemicolon(): ?SemicolonToken {
    if ($this->_semicolon->isMissing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(SemicolonToken::class, $this->_semicolon);
  }

  public function getSemicolonx(): SemicolonToken {
    return TypeAssert::isInstanceOf(SemicolonToken::class, $this->_semicolon);
  }
}
