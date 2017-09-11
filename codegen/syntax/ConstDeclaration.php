<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<ad4dfcdd1da80e74efbb27de15d904dc>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class ConstDeclaration extends EditableSyntax {

  private EditableSyntax $_abstract;
  private EditableSyntax $_keyword;
  private EditableSyntax $_type_specifier;
  private EditableSyntax $_declarators;
  private EditableSyntax $_semicolon;

  public function __construct(
    EditableSyntax $abstract,
    EditableSyntax $keyword,
    EditableSyntax $type_specifier,
    EditableSyntax $declarators,
    EditableSyntax $semicolon,
  ) {
    parent::__construct('const_declaration');
    $this->_abstract = $abstract;
    $this->_keyword = $keyword;
    $this->_type_specifier = $type_specifier;
    $this->_declarators = $declarators;
    $this->_semicolon = $semicolon;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $abstract = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['const_abstract'],
      $position,
      $source,
    );
    $position += $abstract->width();
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['const_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $type_specifier = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['const_type_specifier'],
      $position,
      $source,
    );
    $position += $type_specifier->width();
    $declarators = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['const_declarators'],
      $position,
      $source,
    );
    $position += $declarators->width();
    $semicolon = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['const_semicolon'],
      $position,
      $source,
    );
    $position += $semicolon->width();
    return new self(
      $abstract,
      $keyword,
      $type_specifier,
      $declarators,
      $semicolon,
    );
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'abstract' => $this->_abstract;
    yield 'keyword' => $this->_keyword;
    yield 'type_specifier' => $this->_type_specifier;
    yield 'declarators' => $this->_declarators;
    yield 'semicolon' => $this->_semicolon;
  }

  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $abstract = $this->_abstract->rewrite($rewriter, $parents);
    $keyword = $this->_keyword->rewrite($rewriter, $parents);
    $type_specifier = $this->_type_specifier->rewrite($rewriter, $parents);
    $declarators = $this->_declarators->rewrite($rewriter, $parents);
    $semicolon = $this->_semicolon->rewrite($rewriter, $parents);
    if (
      $abstract === $this->_abstract &&
      $keyword === $this->_keyword &&
      $type_specifier === $this->_type_specifier &&
      $declarators === $this->_declarators &&
      $semicolon === $this->_semicolon
    ) {
      return $this;
    }
    return new self($abstract, $keyword, $type_specifier, $declarators, $semicolon);
  }

  public function abstract(): ?AbstractToken {
    return $this->_abstract->is_missing() ? null : TypeAssert::isInstanceOf(AbstractToken::class, $this->_abstract);
  }

  public function abstractx(): AbstractToken {
    return TypeAssert::isInstanceOf(AbstractToken::class, $this->_abstract);
  }

  public function raw_abstract(): EditableSyntax {
    return $this->_abstract;
  }

  public function with_abstract(EditableSyntax $value): this {
    if ($value === $this->_abstract) {
      return $this;
    }
    return new self(
      $value,
      $this->_keyword,
      $this->_type_specifier,
      $this->_declarators,
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
    if ($value === $this->_keyword) {
      return $this;
    }
    return new self(
      $this->_abstract,
      $value,
      $this->_type_specifier,
      $this->_declarators,
      $this->_semicolon,
    );
  }

  public function type_specifier(): EditableSyntax {
    return $this->type_specifierx();
  }

  public function type_specifierx(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_type_specifier);
  }

  public function raw_type_specifier(): EditableSyntax {
    return $this->_type_specifier;
  }

  public function with_type_specifier(EditableSyntax $value): this {
    if ($value === $this->_type_specifier) {
      return $this;
    }
    return new self(
      $this->_abstract,
      $this->_keyword,
      $value,
      $this->_declarators,
      $this->_semicolon,
    );
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
    return new self(
      $this->_abstract,
      $this->_keyword,
      $this->_type_specifier,
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
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new self(
      $this->_abstract,
      $this->_keyword,
      $this->_type_specifier,
      $this->_declarators,
      $value,
    );
  }
}
