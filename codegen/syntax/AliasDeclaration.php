<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<f39cd05097a6caf789f0e12b373ea122>>
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
    $position += $attribute_spec->width();
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['alias_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $name = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['alias_name'],
      $position,
      $source,
    );
    $position += $name->width();
    $generic_parameter = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['alias_generic_parameter'],
      $position,
      $source,
    );
    $position += $generic_parameter->width();
    $constraint = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['alias_constraint'],
      $position,
      $source,
    );
    $position += $constraint->width();
    $equal = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['alias_equal'],
      $position,
      $source,
    );
    $position += $equal->width();
    $type = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['alias_type'],
      $position,
      $source,
    );
    $position += $type->width();
    $semicolon = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['alias_semicolon'],
      $position,
      $source,
    );
    $position += $semicolon->width();
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

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'attribute_spec' => $this->_attribute_spec;
    yield 'keyword' => $this->_keyword;
    yield 'name' => $this->_name;
    yield 'generic_parameter' => $this->_generic_parameter;
    yield 'constraint' => $this->_constraint;
    yield 'equal' => $this->_equal;
    yield 'type' => $this->_type;
    yield 'semicolon' => $this->_semicolon;
  }

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

  public function attribute_spec(): ?AttributeSpecification {
    return $this->_attribute_spec->is_missing() ? null : TypeAssert::isInstanceOf(AttributeSpecification::class, $this->_attribute_spec);
  }

  public function attribute_specx(): AttributeSpecification {
    return TypeAssert::isInstanceOf(AttributeSpecification::class, $this->_attribute_spec);
  }

  public function raw_attribute_spec(): EditableSyntax {
    return $this->_attribute_spec;
  }

  public function with_attribute_spec(EditableSyntax $value): this {
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

  public function keyword(): EditableSyntax {
    return $this->keywordx();
  }

  public function keywordx(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_keyword);
  }

  public function raw_keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
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

  public function name(): ?NameToken {
    return $this->_name->is_missing() ? null : TypeAssert::isInstanceOf(NameToken::class, $this->_name);
  }

  public function namex(): NameToken {
    return TypeAssert::isInstanceOf(NameToken::class, $this->_name);
  }

  public function raw_name(): EditableSyntax {
    return $this->_name;
  }

  public function with_name(EditableSyntax $value): this {
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

  public function generic_parameter(): ?TypeParameters {
    return $this->_generic_parameter->is_missing() ? null : TypeAssert::isInstanceOf(TypeParameters::class, $this->_generic_parameter);
  }

  public function generic_parameterx(): TypeParameters {
    return TypeAssert::isInstanceOf(TypeParameters::class, $this->_generic_parameter);
  }

  public function raw_generic_parameter(): EditableSyntax {
    return $this->_generic_parameter;
  }

  public function with_generic_parameter(EditableSyntax $value): this {
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

  public function constraint(): ?TypeConstraint {
    return $this->_constraint->is_missing() ? null : TypeAssert::isInstanceOf(TypeConstraint::class, $this->_constraint);
  }

  public function constraintx(): TypeConstraint {
    return TypeAssert::isInstanceOf(TypeConstraint::class, $this->_constraint);
  }

  public function raw_constraint(): EditableSyntax {
    return $this->_constraint;
  }

  public function with_constraint(EditableSyntax $value): this {
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

  public function equal(): ?EqualToken {
    return $this->_equal->is_missing() ? null : TypeAssert::isInstanceOf(EqualToken::class, $this->_equal);
  }

  public function equalx(): EqualToken {
    return TypeAssert::isInstanceOf(EqualToken::class, $this->_equal);
  }

  public function raw_equal(): EditableSyntax {
    return $this->_equal;
  }

  public function with_equal(EditableSyntax $value): this {
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

  public function semicolon(): SemicolonToken {
    return $this->semicolonx();
  }

  public function semicolonx(): SemicolonToken {
    return TypeAssert::isInstanceOf(SemicolonToken::class, $this->_semicolon);
  }

  public function raw_semicolon(): EditableSyntax {
    return $this->_semicolon;
  }

  public function with_semicolon(EditableSyntax $value): this {
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
}
