<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<586fcaa2b6dd4bf6273a31e850a92f69>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class EnumDeclaration extends EditableSyntax {

  private EditableSyntax $_attribute_spec;
  private EditableSyntax $_keyword;
  private EditableSyntax $_name;
  private EditableSyntax $_colon;
  private EditableSyntax $_base;
  private EditableSyntax $_type;
  private EditableSyntax $_left_brace;
  private EditableSyntax $_enumerators;
  private EditableSyntax $_right_brace;

  public function __construct(
    EditableSyntax $attribute_spec,
    EditableSyntax $keyword,
    EditableSyntax $name,
    EditableSyntax $colon,
    EditableSyntax $base,
    EditableSyntax $type,
    EditableSyntax $left_brace,
    EditableSyntax $enumerators,
    EditableSyntax $right_brace,
  ) {
    parent::__construct('enum_declaration');
    $this->_attribute_spec = $attribute_spec;
    $this->_keyword = $keyword;
    $this->_name = $name;
    $this->_colon = $colon;
    $this->_base = $base;
    $this->_type = $type;
    $this->_left_brace = $left_brace;
    $this->_enumerators = $enumerators;
    $this->_right_brace = $right_brace;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $attribute_spec = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['enum_attribute_spec'],
      $position,
      $source,
    );
    $position += $attribute_spec->width();
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['enum_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $name = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['enum_name'],
      $position,
      $source,
    );
    $position += $name->width();
    $colon = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['enum_colon'],
      $position,
      $source,
    );
    $position += $colon->width();
    $base = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['enum_base'],
      $position,
      $source,
    );
    $position += $base->width();
    $type = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['enum_type'],
      $position,
      $source,
    );
    $position += $type->width();
    $left_brace = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['enum_left_brace'],
      $position,
      $source,
    );
    $position += $left_brace->width();
    $enumerators = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['enum_enumerators'],
      $position,
      $source,
    );
    $position += $enumerators->width();
    $right_brace = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['enum_right_brace'],
      $position,
      $source,
    );
    $position += $right_brace->width();
    return new self(
      $attribute_spec,
      $keyword,
      $name,
      $colon,
      $base,
      $type,
      $left_brace,
      $enumerators,
      $right_brace,
    );
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'attribute_spec' => $this->_attribute_spec;
    yield 'keyword' => $this->_keyword;
    yield 'name' => $this->_name;
    yield 'colon' => $this->_colon;
    yield 'base' => $this->_base;
    yield 'type' => $this->_type;
    yield 'left_brace' => $this->_left_brace;
    yield 'enumerators' => $this->_enumerators;
    yield 'right_brace' => $this->_right_brace;
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
    $colon = $this->_colon->rewrite($rewriter, $parents);
    $base = $this->_base->rewrite($rewriter, $parents);
    $type = $this->_type->rewrite($rewriter, $parents);
    $left_brace = $this->_left_brace->rewrite($rewriter, $parents);
    $enumerators = $this->_enumerators->rewrite($rewriter, $parents);
    $right_brace = $this->_right_brace->rewrite($rewriter, $parents);
    if (
      $attribute_spec === $this->_attribute_spec &&
      $keyword === $this->_keyword &&
      $name === $this->_name &&
      $colon === $this->_colon &&
      $base === $this->_base &&
      $type === $this->_type &&
      $left_brace === $this->_left_brace &&
      $enumerators === $this->_enumerators &&
      $right_brace === $this->_right_brace
    ) {
      return $this;
    }
    return new self(
      $attribute_spec,
      $keyword,
      $name,
      $colon,
      $base,
      $type,
      $left_brace,
      $enumerators,
      $right_brace,
    );
  }

  public function attribute_spec(): EditableSyntax {
    return $this->attribute_specx();
  }

  public function attribute_specx(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_attribute_spec);
  }

  public function raw_attribute_spec(): EditableSyntax {
    return $this->_attribute_spec;
  }

  public function with_attribute_spec(EditableSyntax $value): this {
    return new self(
      $value,
      $this->_keyword,
      $this->_name,
      $this->_colon,
      $this->_base,
      $this->_type,
      $this->_left_brace,
      $this->_enumerators,
      $this->_right_brace,
    );
  }

  public function keyword(): EnumToken {
    return $this->keywordx();
  }

  public function keywordx(): EnumToken {
    return TypeAssert::isInstanceOf(EnumToken::class, $this->_keyword);
  }

  public function raw_keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self(
      $this->_attribute_spec,
      $value,
      $this->_name,
      $this->_colon,
      $this->_base,
      $this->_type,
      $this->_left_brace,
      $this->_enumerators,
      $this->_right_brace,
    );
  }

  public function name(): NameToken {
    return $this->namex();
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
      $this->_colon,
      $this->_base,
      $this->_type,
      $this->_left_brace,
      $this->_enumerators,
      $this->_right_brace,
    );
  }

  public function colon(): ColonToken {
    return $this->colonx();
  }

  public function colonx(): ColonToken {
    return TypeAssert::isInstanceOf(ColonToken::class, $this->_colon);
  }

  public function raw_colon(): EditableSyntax {
    return $this->_colon;
  }

  public function with_colon(EditableSyntax $value): this {
    return new self(
      $this->_attribute_spec,
      $this->_keyword,
      $this->_name,
      $value,
      $this->_base,
      $this->_type,
      $this->_left_brace,
      $this->_enumerators,
      $this->_right_brace,
    );
  }

  public function base(): EditableSyntax {
    return $this->basex();
  }

  public function basex(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_base);
  }

  public function raw_base(): EditableSyntax {
    return $this->_base;
  }

  public function with_base(EditableSyntax $value): this {
    return new self(
      $this->_attribute_spec,
      $this->_keyword,
      $this->_name,
      $this->_colon,
      $value,
      $this->_type,
      $this->_left_brace,
      $this->_enumerators,
      $this->_right_brace,
    );
  }

  public function type(): ?TypeConstraint {
    return $this->_type->is_missing() ? null : TypeAssert::isInstanceOf(TypeConstraint::class, $this->_type);
  }

  public function typex(): TypeConstraint {
    return TypeAssert::isInstanceOf(TypeConstraint::class, $this->_type);
  }

  public function raw_type(): EditableSyntax {
    return $this->_type;
  }

  public function with_type(EditableSyntax $value): this {
    return new self(
      $this->_attribute_spec,
      $this->_keyword,
      $this->_name,
      $this->_colon,
      $this->_base,
      $value,
      $this->_left_brace,
      $this->_enumerators,
      $this->_right_brace,
    );
  }

  public function left_brace(): LeftBraceToken {
    return $this->left_bracex();
  }

  public function left_bracex(): LeftBraceToken {
    return TypeAssert::isInstanceOf(LeftBraceToken::class, $this->_left_brace);
  }

  public function raw_left_brace(): EditableSyntax {
    return $this->_left_brace;
  }

  public function with_left_brace(EditableSyntax $value): this {
    return new self(
      $this->_attribute_spec,
      $this->_keyword,
      $this->_name,
      $this->_colon,
      $this->_base,
      $this->_type,
      $value,
      $this->_enumerators,
      $this->_right_brace,
    );
  }

  public function enumerators(): ?EditableList {
    return $this->_enumerators->is_missing() ? null : TypeAssert::isInstanceOf(EditableList::class, $this->_enumerators);
  }

  public function enumeratorsx(): EditableList {
    return TypeAssert::isInstanceOf(EditableList::class, $this->_enumerators);
  }

  public function raw_enumerators(): EditableSyntax {
    return $this->_enumerators;
  }

  public function with_enumerators(EditableSyntax $value): this {
    return new self(
      $this->_attribute_spec,
      $this->_keyword,
      $this->_name,
      $this->_colon,
      $this->_base,
      $this->_type,
      $this->_left_brace,
      $value,
      $this->_right_brace,
    );
  }

  public function right_brace(): RightBraceToken {
    return $this->right_bracex();
  }

  public function right_bracex(): RightBraceToken {
    return TypeAssert::isInstanceOf(RightBraceToken::class, $this->_right_brace);
  }

  public function raw_right_brace(): EditableSyntax {
    return $this->_right_brace;
  }

  public function with_right_brace(EditableSyntax $value): this {
    return new self(
      $this->_attribute_spec,
      $this->_keyword,
      $this->_name,
      $this->_colon,
      $this->_base,
      $this->_type,
      $this->_left_brace,
      $this->_enumerators,
      $value,
    );
  }
}
