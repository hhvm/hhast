/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<e88134e868f94521b20e9623dad5e9a2>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class ConstDeclaration extends EditableNode {

  private EditableNode $_visibility;
  private EditableNode $_abstract;
  private EditableNode $_keyword;
  private EditableNode $_type_specifier;
  private EditableNode $_declarators;
  private EditableNode $_semicolon;

  public function __construct(
    EditableNode $visibility,
    EditableNode $abstract,
    EditableNode $keyword,
    EditableNode $type_specifier,
    EditableNode $declarators,
    EditableNode $semicolon,
  ) {
    parent::__construct('const_declaration');
    $this->_visibility = $visibility;
    $this->_abstract = $abstract;
    $this->_keyword = $keyword;
    $this->_type_specifier = $type_specifier;
    $this->_declarators = $declarators;
    $this->_semicolon = $semicolon;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
  ): this {
    $visibility = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['const_visibility'],
      $file,
      $offset,
      $source,
    );
    $offset += $visibility->getWidth();
    $abstract = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['const_abstract'],
      $file,
      $offset,
      $source,
    );
    $offset += $abstract->getWidth();
    $keyword = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['const_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $keyword->getWidth();
    $type_specifier = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['const_type_specifier'],
      $file,
      $offset,
      $source,
    );
    $offset += $type_specifier->getWidth();
    $declarators = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['const_declarators'],
      $file,
      $offset,
      $source,
    );
    $offset += $declarators->getWidth();
    $semicolon = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['const_semicolon'],
      $file,
      $offset,
      $source,
    );
    $offset += $semicolon->getWidth();
    return new static(
      $visibility,
      $abstract,
      $keyword,
      $type_specifier,
      $declarators,
      $semicolon,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'visibility' => $this->_visibility,
      'abstract' => $this->_abstract,
      'keyword' => $this->_keyword,
      'type_specifier' => $this->_type_specifier,
      'declarators' => $this->_declarators,
      'semicolon' => $this->_semicolon,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?vec<EditableNode> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $visibility = $this->_visibility->rewrite($rewriter, $parents);
    $abstract = $this->_abstract->rewrite($rewriter, $parents);
    $keyword = $this->_keyword->rewrite($rewriter, $parents);
    $type_specifier = $this->_type_specifier->rewrite($rewriter, $parents);
    $declarators = $this->_declarators->rewrite($rewriter, $parents);
    $semicolon = $this->_semicolon->rewrite($rewriter, $parents);
    if (
      $visibility === $this->_visibility &&
      $abstract === $this->_abstract &&
      $keyword === $this->_keyword &&
      $type_specifier === $this->_type_specifier &&
      $declarators === $this->_declarators &&
      $semicolon === $this->_semicolon
    ) {
      return $this;
    }
    return new static(
      $visibility,
      $abstract,
      $keyword,
      $type_specifier,
      $declarators,
      $semicolon,
    );
  }

  public function getVisibilityUNTYPED(): EditableNode {
    return $this->_visibility;
  }

  public function withVisibility(EditableNode $value): this {
    if ($value === $this->_visibility) {
      return $this;
    }
    return new static(
      $value,
      $this->_abstract,
      $this->_keyword,
      $this->_type_specifier,
      $this->_declarators,
      $this->_semicolon,
    );
  }

  public function hasVisibility(): bool {
    return !$this->_visibility->isMissing();
  }

  /**
   * @return null | ProtectedToken | PublicToken
   */
  public function getVisibility(): ?EditableToken {
    if ($this->_visibility->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableToken::class, $this->_visibility);
  }

  /**
   * @return ProtectedToken | PublicToken
   */
  public function getVisibilityx(): EditableToken {
    return TypeAssert\instance_of(EditableToken::class, $this->_visibility);
  }

  public function getAbstractUNTYPED(): EditableNode {
    return $this->_abstract;
  }

  public function withAbstract(EditableNode $value): this {
    if ($value === $this->_abstract) {
      return $this;
    }
    return new static(
      $this->_visibility,
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
   * @return null | AbstractToken
   */
  public function getAbstract(): ?AbstractToken {
    if ($this->_abstract->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(AbstractToken::class, $this->_abstract);
  }

  /**
   * @return AbstractToken
   */
  public function getAbstractx(): AbstractToken {
    return TypeAssert\instance_of(AbstractToken::class, $this->_abstract);
  }

  public function getKeywordUNTYPED(): EditableNode {
    return $this->_keyword;
  }

  public function withKeyword(EditableNode $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static(
      $this->_visibility,
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
   * @return ConstToken
   */
  public function getKeyword(): ConstToken {
    return TypeAssert\instance_of(ConstToken::class, $this->_keyword);
  }

  /**
   * @return ConstToken
   */
  public function getKeywordx(): ConstToken {
    return $this->getKeyword();
  }

  public function getTypeSpecifierUNTYPED(): EditableNode {
    return $this->_type_specifier;
  }

  public function withTypeSpecifier(EditableNode $value): this {
    if ($value === $this->_type_specifier) {
      return $this;
    }
    return new static(
      $this->_visibility,
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
   * @return ClassnameTypeSpecifier | GenericTypeSpecifier |
   * KeysetTypeSpecifier | null | NullableTypeSpecifier | SimpleTypeSpecifier |
   * TupleTypeSpecifier | TypeConstant | VarrayTypeSpecifier |
   * VectorTypeSpecifier
   */
  public function getTypeSpecifier(): ?EditableNode {
    if ($this->_type_specifier->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableNode::class, $this->_type_specifier);
  }

  /**
   * @return ClassnameTypeSpecifier | GenericTypeSpecifier |
   * KeysetTypeSpecifier | NullableTypeSpecifier | SimpleTypeSpecifier |
   * TupleTypeSpecifier | TypeConstant | VarrayTypeSpecifier |
   * VectorTypeSpecifier
   */
  public function getTypeSpecifierx(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_type_specifier);
  }

  public function getDeclaratorsUNTYPED(): EditableNode {
    return $this->_declarators;
  }

  public function withDeclarators(EditableNode $value): this {
    if ($value === $this->_declarators) {
      return $this;
    }
    return new static(
      $this->_visibility,
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
   * @return EditableList<ConstantDeclarator>
   */
  public function getDeclarators(): EditableList<ConstantDeclarator> {
    return TypeAssert\instance_of(EditableList::class, $this->_declarators);
  }

  /**
   * @return EditableList<ConstantDeclarator>
   */
  public function getDeclaratorsx(): EditableList<ConstantDeclarator> {
    return $this->getDeclarators();
  }

  public function getSemicolonUNTYPED(): EditableNode {
    return $this->_semicolon;
  }

  public function withSemicolon(EditableNode $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new static(
      $this->_visibility,
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
   * @return SemicolonToken
   */
  public function getSemicolon(): SemicolonToken {
    return TypeAssert\instance_of(SemicolonToken::class, $this->_semicolon);
  }

  /**
   * @return SemicolonToken
   */
  public function getSemicolonx(): SemicolonToken {
    return $this->getSemicolon();
  }
}
