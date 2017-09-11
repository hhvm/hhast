<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<33d01599963b7013fb0629200db73769>>
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

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $modifiers = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['property_modifiers'],
      $position,
      $source,
    );
    $position += $modifiers->width();
    $type = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['property_type'],
      $position,
      $source,
    );
    $position += $type->width();
    $declarators = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['property_declarators'],
      $position,
      $source,
    );
    $position += $declarators->width();
    $semicolon = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['property_semicolon'],
      $position,
      $source,
    );
    $position += $semicolon->width();
    return new self($modifiers, $type, $declarators, $semicolon);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'modifiers' => $this->_modifiers;
    yield 'type' => $this->_type;
    yield 'declarators' => $this->_declarators;
    yield 'semicolon' => $this->_semicolon;
  }

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

  public function modifiers(): EditableSyntax {
    return $this->modifiersx();
  }

  public function modifiersx(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_modifiers);
  }

  public function raw_modifiers(): EditableSyntax {
    return $this->_modifiers;
  }

  public function with_modifiers(EditableSyntax $value): this {
    if ($value === $this->_modifiers) {
      return $this;
    }
    return new self($value, $this->_type, $this->_declarators, $this->_semicolon);
  }

  public function type(): EditableSyntax {
    return $this->typex();
  }

  public function typex(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_type);
  }

  public function raw_type(): EditableSyntax {
    return $this->_type;
  }

  public function with_type(EditableSyntax $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return new self($this->_modifiers, $value, $this->_declarators, $this->_semicolon);
  }

  public function declarators(): EditableList {
    return $this->declaratorsx();
  }

  public function declaratorsx(): EditableList {
    return TypeAssert::isInstanceOf(EditableList::class, $this->_declarators);
  }

  public function raw_declarators(): EditableSyntax {
    return $this->_declarators;
  }

  public function with_declarators(EditableSyntax $value): this {
    if ($value === $this->_declarators) {
      return $this;
    }
    return new self($this->_modifiers, $this->_type, $value, $this->_semicolon);
  }

  public function semicolon(): ?SemicolonToken {
    return $this->_semicolon->is_missing() ? null : TypeAssert::isInstanceOf(SemicolonToken::class, $this->_semicolon);
  }

  public function semicolonx(): SemicolonToken {
    return TypeAssert::isInstanceOf(SemicolonToken::class, $this->_semicolon);
  }

  public function raw_semicolon(): EditableSyntax {
    return $this->_semicolon;
  }

  public function with_semicolon(EditableSyntax $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new self($this->_modifiers, $this->_type, $this->_declarators, $value);
  }
}
