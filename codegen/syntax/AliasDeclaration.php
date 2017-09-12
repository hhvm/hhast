<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<87576089545c403359fcd7b567afe680>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class AliasDeclaration extends EditableSyntax {

  private EditableSyntax $_attribute_spec;
  private EditableSyntax $_keyword;
  private EditableSyntax $_name;
  private EditableSyntax $_generic_parameter;
  private EditableSyntax $_constraint;
  private EditableSyntax $_equal;
  private EditableSyntax $_type;
  private EditableSyntax $_semicolon;

  public function __construct(
    EditableSyntax $attribute_spec,
    EditableSyntax $keyword,
    EditableSyntax $name,
    EditableSyntax $generic_parameter,
    EditableSyntax $constraint,
    EditableSyntax $equal,
    EditableSyntax $type,
    EditableSyntax $semicolon,
  ) {
    parent::__construct('alias_declaration');
    $this->_attribute_spec = $attribute_spec;
    $this->_keyword = $keyword;
    $this->_name = $name;
    $this->_generic_parameter = $generic_parameter;
    $this->_constraint = $constraint;
    $this->_equal = $equal;
    $this->_type = $type;
    $this->_semicolon = $semicolon;
  }

  <<__Override>>
  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $attribute_spec = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['alias_attribute_spec'],
      $position,
      $source,
    );
    $position += $attribute_spec->getWidth();
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['alias_keyword'],
      $position,
      $source,
    );
    $position += $keyword->getWidth();
    $name = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['alias_name'],
      $position,
      $source,
    );
    $position += $name->getWidth();
    $generic_parameter = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['alias_generic_parameter'],
      $position,
      $source,
    );
    $position += $generic_parameter->getWidth();
    $constraint = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['alias_constraint'],
      $position,
      $source,
    );
    $position += $constraint->getWidth();
    $equal = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['alias_equal'],
      $position,
      $source,
    );
    $position += $equal->getWidth();
    $type = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['alias_type'],
      $position,
      $source,
    );
    $position += $type->getWidth();
    $semicolon = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['alias_semicolon'],
      $position,
      $source,
    );
    $position += $semicolon->getWidth();
    return new self(
      $attribute_spec,
      $keyword,
      $name,
      $generic_parameter,
      $constraint,
      $equal,
      $type,
      $semicolon,
    );
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'attribute_spec' => $this->_attribute_spec;
    yield 'keyword' => $this->_keyword;
    yield 'name' => $this->_name;
    yield 'generic_parameter' => $this->_generic_parameter;
    yield 'constraint' => $this->_constraint;
    yield 'equal' => $this->_equal;
    yield 'type' => $this->_type;
    yield 'semicolon' => $this->_semicolon;
  }

  <<__Override>>
  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $attribute_spec = $this->_attribute_spec->rewrite($rewriter, $parents);
    $keyword = $this->_keyword->rewrite($rewriter, $parents);
    $name = $this->_name->rewrite($rewriter, $parents);
    $generic_parameter = $this->_generic_parameter->rewrite($rewriter, $parents);
    $constraint = $this->_constraint->rewrite($rewriter, $parents);
    $equal = $this->_equal->rewrite($rewriter, $parents);
    $type = $this->_type->rewrite($rewriter, $parents);
    $semicolon = $this->_semicolon->rewrite($rewriter, $parents);
    if (
      $attribute_spec === $this->_attribute_spec &&
      $keyword === $this->_keyword &&
      $name === $this->_name &&
      $generic_parameter === $this->_generic_parameter &&
      $constraint === $this->_constraint &&
      $equal === $this->_equal &&
      $type === $this->_type &&
      $semicolon === $this->_semicolon
    ) {
      return $this;
    }
    return new self(
      $attribute_spec,
      $keyword,
      $name,
      $generic_parameter,
      $constraint,
      $equal,
      $type,
      $semicolon,
    );
  }

  public function getAttributeSpecUNTYPED(): EditableSyntax {
    return $this->_attribute_spec;
  }

  public function withAttributeSpec(EditableSyntax $value): this {
    if ($value === $this->_attribute_spec) {
      return $this;
    }
    return new self(
      $value,
      $this->_keyword,
      $this->_name,
      $this->_generic_parameter,
      $this->_constraint,
      $this->_equal,
      $this->_type,
      $this->_semicolon,
    );
  }

  public function hasAttributeSpec(): bool {
    return !$this->_attribute_spec->isMissing();
  }

  public function getAttributeSpec(): ?AttributeSpecification {
    if ($this->_attribute_spec->isMissing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(AttributeSpecification::class, $this->_attribute_spec);
  }

  public function getAttributeSpecx(): AttributeSpecification {
    return TypeAssert::isInstanceOf(AttributeSpecification::class, $this->_attribute_spec);
  }

  public function getKeywordUNTYPED(): EditableSyntax {
    return $this->_keyword;
  }

  public function withKeyword(EditableSyntax $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new self(
      $this->_attribute_spec,
      $value,
      $this->_name,
      $this->_generic_parameter,
      $this->_constraint,
      $this->_equal,
      $this->_type,
      $this->_semicolon,
    );
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  public function getKeyword(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_keyword);
  }

  public function getNameUNTYPED(): EditableSyntax {
    return $this->_name;
  }

  public function withName(EditableSyntax $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new self(
      $this->_attribute_spec,
      $this->_keyword,
      $value,
      $this->_generic_parameter,
      $this->_constraint,
      $this->_equal,
      $this->_type,
      $this->_semicolon,
    );
  }

  public function hasName(): bool {
    return !$this->_name->isMissing();
  }

  public function getName(): ?NameToken {
    if ($this->_name->isMissing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(NameToken::class, $this->_name);
  }

  public function getNamex(): NameToken {
    return TypeAssert::isInstanceOf(NameToken::class, $this->_name);
  }

  public function getGenericParameterUNTYPED(): EditableSyntax {
    return $this->_generic_parameter;
  }

  public function withGenericParameter(EditableSyntax $value): this {
    if ($value === $this->_generic_parameter) {
      return $this;
    }
    return new self(
      $this->_attribute_spec,
      $this->_keyword,
      $this->_name,
      $value,
      $this->_constraint,
      $this->_equal,
      $this->_type,
      $this->_semicolon,
    );
  }

  public function hasGenericParameter(): bool {
    return !$this->_generic_parameter->isMissing();
  }

  public function getGenericParameter(): ?TypeParameters {
    if ($this->_generic_parameter->isMissing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(TypeParameters::class, $this->_generic_parameter);
  }

  public function getGenericParameterx(): TypeParameters {
    return TypeAssert::isInstanceOf(TypeParameters::class, $this->_generic_parameter);
  }

  public function getConstraintUNTYPED(): EditableSyntax {
    return $this->_constraint;
  }

  public function withConstraint(EditableSyntax $value): this {
    if ($value === $this->_constraint) {
      return $this;
    }
    return new self(
      $this->_attribute_spec,
      $this->_keyword,
      $this->_name,
      $this->_generic_parameter,
      $value,
      $this->_equal,
      $this->_type,
      $this->_semicolon,
    );
  }

  public function hasConstraint(): bool {
    return !$this->_constraint->isMissing();
  }

  public function getConstraint(): ?TypeConstraint {
    if ($this->_constraint->isMissing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(TypeConstraint::class, $this->_constraint);
  }

  public function getConstraintx(): TypeConstraint {
    return TypeAssert::isInstanceOf(TypeConstraint::class, $this->_constraint);
  }

  public function getEqualUNTYPED(): EditableSyntax {
    return $this->_equal;
  }

  public function withEqual(EditableSyntax $value): this {
    if ($value === $this->_equal) {
      return $this;
    }
    return new self(
      $this->_attribute_spec,
      $this->_keyword,
      $this->_name,
      $this->_generic_parameter,
      $this->_constraint,
      $value,
      $this->_type,
      $this->_semicolon,
    );
  }

  public function hasEqual(): bool {
    return !$this->_equal->isMissing();
  }

  public function getEqual(): ?EqualToken {
    if ($this->_equal->isMissing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(EqualToken::class, $this->_equal);
  }

  public function getEqualx(): EqualToken {
    return TypeAssert::isInstanceOf(EqualToken::class, $this->_equal);
  }

  public function getTypeUNTYPED(): EditableSyntax {
    return $this->_type;
  }

  public function withType(EditableSyntax $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return new self(
      $this->_attribute_spec,
      $this->_keyword,
      $this->_name,
      $this->_generic_parameter,
      $this->_constraint,
      $this->_equal,
      $value,
      $this->_semicolon,
    );
  }

  public function hasType(): bool {
    return !$this->_type->isMissing();
  }

  public function getType(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_type);
  }

  public function getSemicolonUNTYPED(): EditableSyntax {
    return $this->_semicolon;
  }

  public function withSemicolon(EditableSyntax $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new self(
      $this->_attribute_spec,
      $this->_keyword,
      $this->_name,
      $this->_generic_parameter,
      $this->_constraint,
      $this->_equal,
      $this->_type,
      $value,
    );
  }

  public function hasSemicolon(): bool {
    return !$this->_semicolon->isMissing();
  }

  public function getSemicolon(): SemicolonToken {
    return TypeAssert::isInstanceOf(SemicolonToken::class, $this->_semicolon);
  }
}
