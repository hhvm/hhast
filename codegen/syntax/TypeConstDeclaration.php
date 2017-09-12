<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<b17b10b2be07d3bdbab6bbcd581c4edf>>
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

  <<__Override>>
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

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'abstract' => $this->_abstract;
    yield 'keyword' => $this->_keyword;
    yield 'type_keyword' => $this->_type_keyword;
    yield 'name' => $this->_name;
    yield 'type_constraint' => $this->_type_constraint;
    yield 'equal' => $this->_equal;
    yield 'type_specifier' => $this->_type_specifier;
    yield 'semicolon' => $this->_semicolon;
  }

  <<__Override>>
  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $abstract = $this->_abstract->rewrite($rewriter, $parents);
    $keyword = $this->_keyword->rewrite($rewriter, $parents);
    $type_keyword = $this->_type_keyword->rewrite($rewriter, $parents);
    $name = $this->_name->rewrite($rewriter, $parents);
    $type_constraint = $this->_type_constraint->rewrite($rewriter, $parents);
    $equal = $this->_equal->rewrite($rewriter, $parents);
    $type_specifier = $this->_type_specifier->rewrite($rewriter, $parents);
    $semicolon = $this->_semicolon->rewrite($rewriter, $parents);
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
      return $this;
    }
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

  public function getAbstractUNTYPED(): EditableSyntax {
    return $this->_abstract;
  }

  public function withAbstract(EditableSyntax $value): this {
    if ($value === $this->_abstract) {
      return $this;
    }
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

  public function hasAbstract(): bool {
    return !$this->_abstract->is_missing();
  }

  public function getAbstract(): ?AbstractToken {
    if ($this->_abstract->is_missing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(AbstractToken::class, $this->_abstract);
  }

  public function getAbstractx(): AbstractToken {
    return TypeAssert::isInstanceOf(AbstractToken::class, $this->_abstract);
  }

  public function getKeywordUNTYPED(): EditableSyntax {
    return $this->_keyword;
  }

  public function withKeyword(EditableSyntax $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
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

  public function hasKeyword(): bool {
    return !$this->_keyword->is_missing();
  }

  public function getKeyword(): ConstToken {
    return TypeAssert::isInstanceOf(ConstToken::class, $this->_keyword);
  }

  public function getTypeKeywordUNTYPED(): EditableSyntax {
    return $this->_type_keyword;
  }

  public function withTypeKeyword(EditableSyntax $value): this {
    if ($value === $this->_type_keyword) {
      return $this;
    }
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

  public function hasTypeKeyword(): bool {
    return !$this->_type_keyword->is_missing();
  }

  public function getTypeKeyword(): TypeToken {
    return TypeAssert::isInstanceOf(TypeToken::class, $this->_type_keyword);
  }

  public function getNameUNTYPED(): EditableSyntax {
    return $this->_name;
  }

  public function withName(EditableSyntax $value): this {
    if ($value === $this->_name) {
      return $this;
    }
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

  public function hasName(): bool {
    return !$this->_name->is_missing();
  }

  public function getName(): ?NameToken {
    if ($this->_name->is_missing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(NameToken::class, $this->_name);
  }

  public function getNamex(): NameToken {
    return TypeAssert::isInstanceOf(NameToken::class, $this->_name);
  }

  public function getTypeConstraintUNTYPED(): EditableSyntax {
    return $this->_type_constraint;
  }

  public function withTypeConstraint(EditableSyntax $value): this {
    if ($value === $this->_type_constraint) {
      return $this;
    }
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

  public function hasTypeConstraint(): bool {
    return !$this->_type_constraint->is_missing();
  }

  public function getTypeConstraint(): ?TypeConstraint {
    if ($this->_type_constraint->is_missing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(TypeConstraint::class, $this->_type_constraint);
  }

  public function getTypeConstraintx(): TypeConstraint {
    return TypeAssert::isInstanceOf(TypeConstraint::class, $this->_type_constraint);
  }

  public function getEqualUNTYPED(): EditableSyntax {
    return $this->_equal;
  }

  public function withEqual(EditableSyntax $value): this {
    if ($value === $this->_equal) {
      return $this;
    }
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

  public function hasEqual(): bool {
    return !$this->_equal->is_missing();
  }

  public function getEqual(): ?EqualToken {
    if ($this->_equal->is_missing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(EqualToken::class, $this->_equal);
  }

  public function getEqualx(): EqualToken {
    return TypeAssert::isInstanceOf(EqualToken::class, $this->_equal);
  }

  public function getTypeSpecifierUNTYPED(): EditableSyntax {
    return $this->_type_specifier;
  }

  public function withTypeSpecifier(EditableSyntax $value): this {
    if ($value === $this->_type_specifier) {
      return $this;
    }
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

  public function hasTypeSpecifier(): bool {
    return !$this->_type_specifier->is_missing();
  }

  public function getTypeSpecifier(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_type_specifier);
  }

  public function getSemicolonUNTYPED(): EditableSyntax {
    return $this->_semicolon;
  }

  public function withSemicolon(EditableSyntax $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
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

  public function hasSemicolon(): bool {
    return !$this->_semicolon->is_missing();
  }

  public function getSemicolon(): ?SemicolonToken {
    if ($this->_semicolon->is_missing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(SemicolonToken::class, $this->_semicolon);
  }

  public function getSemicolonx(): SemicolonToken {
    return TypeAssert::isInstanceOf(SemicolonToken::class, $this->_semicolon);
  }
}
