<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<8181bd3f583cf3bc461d14006c192ba0>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class TypeConstDeclaration extends EditableSyntax {

  private EditableSyntax $_abstract;
  private EditableSyntax $_keyword;
  private EditableSyntax $_type_keyword;
  private EditableSyntax $_name;
  private EditableSyntax $_type_constraint;
  private EditableSyntax $_equal;
  private EditableSyntax $_type_specifier;
  private EditableSyntax $_semicolon;

  public function __construct(
    EditableSyntax $abstract,
    EditableSyntax $keyword,
    EditableSyntax $type_keyword,
    EditableSyntax $name,
    EditableSyntax $type_constraint,
    EditableSyntax $equal,
    EditableSyntax $type_specifier,
    EditableSyntax $semicolon,
  ) {
    parent::__construct('type_const_declaration');
    $this->_abstract = $abstract;
    $this->_keyword = $keyword;
    $this->_type_keyword = $type_keyword;
    $this->_name = $name;
    $this->_type_constraint = $type_constraint;
    $this->_equal = $equal;
    $this->_type_specifier = $type_specifier;
    $this->_semicolon = $semicolon;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $abstract = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['type_const_abstract'],
      $position,
      $source,
    );
    $position += $abstract->width();
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['type_const_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $type_keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['type_const_type_keyword'],
      $position,
      $source,
    );
    $position += $type_keyword->width();
    $name = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['type_const_name'],
      $position,
      $source,
    );
    $position += $name->width();
    $type_constraint = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['type_const_type_constraint'],
      $position,
      $source,
    );
    $position += $type_constraint->width();
    $equal = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['type_const_equal'],
      $position,
      $source,
    );
    $position += $equal->width();
    $type_specifier = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['type_const_type_specifier'],
      $position,
      $source,
    );
    $position += $type_specifier->width();
    $semicolon = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['type_const_semicolon'],
      $position,
      $source,
    );
    $position += $semicolon->width();
    return new self(
      $abstract,
      $keyword,
      $type_keyword,
      $name,
      $type_constraint,
      $equal,
      $type_specifier,
      $semicolon,
    );
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'abstract' => $this->_abstract;
    yield 'keyword' => $this->_keyword;
    yield 'type_keyword' => $this->_type_keyword;
    yield 'name' => $this->_name;
    yield 'type_constraint' => $this->_type_constraint;
    yield 'equal' => $this->_equal;
    yield 'type_specifier' => $this->_type_specifier;
    yield 'semicolon' => $this->_semicolon;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $abstract = $this->_abstract->rewrite($rewriter, $child_parents);
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $type_keyword = $this->_type_keyword->rewrite($rewriter, $child_parents);
    $name = $this->_name->rewrite($rewriter, $child_parents);
    $type_constraint =
      $this->_type_constraint->rewrite($rewriter, $child_parents);
    $equal = $this->_equal->rewrite($rewriter, $child_parents);
    $type_specifier =
      $this->_type_specifier->rewrite($rewriter, $child_parents);
    $semicolon = $this->_semicolon->rewrite($rewriter, $child_parents);
    if (
      $abstract === $this->_abstract &&
      $keyword === $this->_keyword &&
      $type_keyword === $this->_type_keyword &&
      $name === $this->_name &&
      $type_constraint === $this->_type_constraint &&
      $equal === $this->_equal &&
      $type_specifier === $this->_type_specifier &&
      $semicolon === $this->_semicolon
    ) {
      $node = $this;
    } else {
      $node = new self(
        $abstract,
        $keyword,
        $type_keyword,
        $name,
        $type_constraint,
        $equal,
        $type_specifier,
        $semicolon,
      );
    }
    return $rewriter($node, $parents);
  }

  public function abstract(): ?AbstractToken {
    return $this->_abstract->is_missing()
      ? null
      : TypeAssert::isInstanceOf(AbstractToken::class, $this->_abstract);
  }

  public function abstractx(): AbstractToken {
    return TypeAssert::isInstanceOf(AbstractToken::class, $this->_abstract);
  }

  public function raw_abstract(): EditableSyntax {
    return $this->_abstract;
  }

  public function with_abstract(EditableSyntax $value): this {
    return new self(
      $value,
      $this->_keyword,
      $this->_type_keyword,
      $this->_name,
      $this->_type_constraint,
      $this->_equal,
      $this->_type_specifier,
      $this->_semicolon,
    );
  }

  public function keyword(): ConstToken {
    return $this->keywordx();
  }

  public function keywordx(): ConstToken {
    return TypeAssert::isInstanceOf(ConstToken::class, $this->_keyword);
  }

  public function raw_keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self(
      $this->_abstract,
      $value,
      $this->_type_keyword,
      $this->_name,
      $this->_type_constraint,
      $this->_equal,
      $this->_type_specifier,
      $this->_semicolon,
    );
  }

  public function type_keyword(): TypeToken {
    return $this->type_keywordx();
  }

  public function type_keywordx(): TypeToken {
    return TypeAssert::isInstanceOf(TypeToken::class, $this->_type_keyword);
  }

  public function raw_type_keyword(): EditableSyntax {
    return $this->_type_keyword;
  }

  public function with_type_keyword(EditableSyntax $value): this {
    return new self(
      $this->_abstract,
      $this->_keyword,
      $value,
      $this->_name,
      $this->_type_constraint,
      $this->_equal,
      $this->_type_specifier,
      $this->_semicolon,
    );
  }

  public function name(): ?NameToken {
    return $this->_name->is_missing()
      ? null
      : TypeAssert::isInstanceOf(NameToken::class, $this->_name);
  }

  public function namex(): NameToken {
    return TypeAssert::isInstanceOf(NameToken::class, $this->_name);
  }

  public function raw_name(): EditableSyntax {
    return $this->_name;
  }

  public function with_name(EditableSyntax $value): this {
    return new self(
      $this->_abstract,
      $this->_keyword,
      $this->_type_keyword,
      $value,
      $this->_type_constraint,
      $this->_equal,
      $this->_type_specifier,
      $this->_semicolon,
    );
  }

  public function type_constraint(): ?TypeConstraint {
    return $this->_type_constraint->is_missing()
      ? null
      : TypeAssert::isInstanceOf(
          TypeConstraint::class,
          $this->_type_constraint,
        );
  }

  public function type_constraintx(): TypeConstraint {
    return
      TypeAssert::isInstanceOf(TypeConstraint::class, $this->_type_constraint);
  }

  public function raw_type_constraint(): EditableSyntax {
    return $this->_type_constraint;
  }

  public function with_type_constraint(EditableSyntax $value): this {
    return new self(
      $this->_abstract,
      $this->_keyword,
      $this->_type_keyword,
      $this->_name,
      $value,
      $this->_equal,
      $this->_type_specifier,
      $this->_semicolon,
    );
  }

  public function equal(): ?EqualToken {
    return $this->_equal->is_missing()
      ? null
      : TypeAssert::isInstanceOf(EqualToken::class, $this->_equal);
  }

  public function equalx(): EqualToken {
    return TypeAssert::isInstanceOf(EqualToken::class, $this->_equal);
  }

  public function raw_equal(): EditableSyntax {
    return $this->_equal;
  }

  public function with_equal(EditableSyntax $value): this {
    return new self(
      $this->_abstract,
      $this->_keyword,
      $this->_type_keyword,
      $this->_name,
      $this->_type_constraint,
      $value,
      $this->_type_specifier,
      $this->_semicolon,
    );
  }

  public function type_specifier(): EditableSyntax {
    return $this->type_specifierx();
  }

  public function type_specifierx(): EditableSyntax {
    return
      TypeAssert::isInstanceOf(EditableSyntax::class, $this->_type_specifier);
  }

  public function raw_type_specifier(): EditableSyntax {
    return $this->_type_specifier;
  }

  public function with_type_specifier(EditableSyntax $value): this {
    return new self(
      $this->_abstract,
      $this->_keyword,
      $this->_type_keyword,
      $this->_name,
      $this->_type_constraint,
      $this->_equal,
      $value,
      $this->_semicolon,
    );
  }

  public function semicolon(): ?SemicolonToken {
    return $this->_semicolon->is_missing()
      ? null
      : TypeAssert::isInstanceOf(SemicolonToken::class, $this->_semicolon);
  }

  public function semicolonx(): SemicolonToken {
    return TypeAssert::isInstanceOf(SemicolonToken::class, $this->_semicolon);
  }

  public function raw_semicolon(): EditableSyntax {
    return $this->_semicolon;
  }

  public function with_semicolon(EditableSyntax $value): this {
    return new self(
      $this->_abstract,
      $this->_keyword,
      $this->_type_keyword,
      $this->_name,
      $this->_type_constraint,
      $this->_equal,
      $this->_type_specifier,
      $value,
    );
  }
}
