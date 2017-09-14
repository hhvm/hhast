<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<fbfbd9b590a16c2f7024ec0889af9657>>
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

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $abstract = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['const_abstract'],
      $position,
      $source,
    );
    $position += $abstract->getWidth();
    $keyword = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['const_keyword'],
      $position,
      $source,
    );
    $position += $keyword->getWidth();
    $type_specifier = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['const_type_specifier'],
      $position,
      $source,
    );
    $position += $type_specifier->getWidth();
    $declarators = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['const_declarators'],
      $position,
      $source,
    );
    $position += $declarators->getWidth();
    $semicolon = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['const_semicolon'],
      $position,
      $source,
    );
    $position += $semicolon->getWidth();
    return new self(
      $abstract,
      $keyword,
      $type_specifier,
      $declarators,
      $semicolon,
    );
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'abstract' => $this->_abstract;
    yield 'keyword' => $this->_keyword;
    yield 'type_specifier' => $this->_type_specifier;
    yield 'declarators' => $this->_declarators;
    yield 'semicolon' => $this->_semicolon;
  }

  <<__Override>>
  public function rewriteDescendants(
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
      $this->_type_specifier,
      $this->_declarators,
      $this->_semicolon,
    );
  }

  public function hasAbstract(): bool {
    return !$this->_abstract->isMissing();
  }

  /**
   * @returns Missing | AbstractToken
   */
  public function getAbstract(): ?AbstractToken {
    if ($this->_abstract->isMissing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(AbstractToken::class, $this->_abstract);
  }

  /**
   * @returns AbstractToken
   */
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
      $this->_type_specifier,
      $this->_declarators,
      $this->_semicolon,
    );
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  /**
   * @returns ConstToken
   */
  public function getKeyword(): ConstToken {
    return TypeAssert::isInstanceOf(ConstToken::class, $this->_keyword);
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
      $value,
      $this->_declarators,
      $this->_semicolon,
    );
  }

  public function hasTypeSpecifier(): bool {
    return !$this->_type_specifier->isMissing();
  }

  /**
   * @returns Missing | SimpleTypeSpecifier | GenericTypeSpecifier |
   * TypeConstant | ClassnameTypeSpecifier | NullableTypeSpecifier
   */
  public function getTypeSpecifier(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_type_specifier);
  }

  public function getDeclaratorsUNTYPED(): EditableSyntax {
    return $this->_declarators;
  }

  public function withDeclarators(EditableSyntax $value): this {
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

  public function hasDeclarators(): bool {
    return !$this->_declarators->isMissing();
  }

  /**
   * @returns EditableList
   */
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
    return new self(
      $this->_abstract,
      $this->_keyword,
      $this->_type_specifier,
      $this->_declarators,
      $value,
    );
  }

  public function hasSemicolon(): bool {
    return !$this->_semicolon->isMissing();
  }

  /**
   * @returns SemicolonToken
   */
  public function getSemicolon(): SemicolonToken {
    return TypeAssert::isInstanceOf(SemicolonToken::class, $this->_semicolon);
  }
}
