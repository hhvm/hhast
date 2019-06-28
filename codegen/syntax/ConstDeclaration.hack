/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<352a2c80991f724953cbf66609181c5d>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class ConstDeclaration extends Node implements IClassBodyDeclaration {

  const string SYNTAX_KIND = 'const_declaration';

  private Node $_visibility;
  private Node $_abstract;
  private Node $_keyword;
  private Node $_type_specifier;
  private Node $_declarators;
  private Node $_semicolon;

  public function __construct(
    Node $visibility,
    Node $abstract,
    Node $keyword,
    Node $type_specifier,
    Node $declarators,
    Node $semicolon,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_visibility = $visibility;
    $this->_abstract = $abstract;
    $this->_keyword = $keyword;
    $this->_type_specifier = $type_specifier;
    $this->_declarators = $declarators;
    $this->_semicolon = $semicolon;
    parent::__construct($source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
    string $_type_hint,
  ): this {
    $offset = $initial_offset;
    $visibility = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['const_visibility'],
      $file,
      $offset,
      $source,
      'Token',
    );
    $offset += $visibility->getWidth();
    $abstract = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['const_abstract'],
      $file,
      $offset,
      $source,
      'AbstractToken',
    );
    $offset += $abstract->getWidth();
    $keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['const_keyword'],
      $file,
      $offset,
      $source,
      'ConstToken',
    );
    $offset += $keyword->getWidth();
    $type_specifier = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['const_type_specifier'],
      $file,
      $offset,
      $source,
      'ITypeSpecifier',
    );
    $offset += $type_specifier->getWidth();
    $declarators = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['const_declarators'],
      $file,
      $offset,
      $source,
      'NodeList<ListItem<ConstantDeclarator>>',
    );
    $offset += $declarators->getWidth();
    $semicolon = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['const_semicolon'],
      $file,
      $offset,
      $source,
      'SemicolonToken',
    );
    $offset += $semicolon->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      $visibility,
      $abstract,
      $keyword,
      $type_specifier,
      $declarators,
      $semicolon,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
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
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $visibility = $rewriter($this->_visibility, $parents);
    $abstract = $rewriter($this->_abstract, $parents);
    $keyword = $rewriter($this->_keyword, $parents);
    $type_specifier = $rewriter($this->_type_specifier, $parents);
    $declarators = $rewriter($this->_declarators, $parents);
    $semicolon = $rewriter($this->_semicolon, $parents);
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

  public function getVisibilityUNTYPED(): Node {
    return $this->_visibility;
  }

  public function withVisibility(?Token $value): this {
    if ($value === $this->_visibility) {
      return $this;
    }
    return new static(
      $value ?? Missing(),
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
  public function getVisibility(): ?Token {
    if ($this->_visibility->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(Token::class, $this->_visibility);
  }

  /**
   * @return ProtectedToken | PublicToken
   */
  public function getVisibilityx(): Token {
    return TypeAssert\not_null($this->getVisibility());
  }

  public function getAbstractUNTYPED(): Node {
    return $this->_abstract;
  }

  public function withAbstract(?AbstractToken $value): this {
    if ($value === $this->_abstract) {
      return $this;
    }
    return new static(
      $this->_visibility,
      $value ?? Missing(),
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
    return TypeAssert\not_null($this->getAbstract());
  }

  public function getKeywordUNTYPED(): Node {
    return $this->_keyword;
  }

  public function withKeyword(ConstToken $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static(
      $this->_visibility,
      $this->_abstract,
      $value ?? Missing(),
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

  public function getTypeSpecifierUNTYPED(): Node {
    return $this->_type_specifier;
  }

  public function withTypeSpecifier(?ITypeSpecifier $value): this {
    if ($value === $this->_type_specifier) {
      return $this;
    }
    return new static(
      $this->_visibility,
      $this->_abstract,
      $this->_keyword,
      $value ?? Missing(),
      $this->_declarators,
      $this->_semicolon,
    );
  }

  public function hasTypeSpecifier(): bool {
    return !$this->_type_specifier->isMissing();
  }

  /**
   * @return ClassnameTypeSpecifier | DarrayTypeSpecifier |
   * GenericTypeSpecifier | KeysetTypeSpecifier | null | NullableTypeSpecifier
   * | SimpleTypeSpecifier | TupleTypeSpecifier | TypeConstant |
   * VarrayTypeSpecifier | VectorTypeSpecifier
   */
  public function getTypeSpecifier(): ?ITypeSpecifier {
    if ($this->_type_specifier->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(
      ITypeSpecifier::class,
      $this->_type_specifier,
    );
  }

  /**
   * @return ClassnameTypeSpecifier | DarrayTypeSpecifier |
   * GenericTypeSpecifier | KeysetTypeSpecifier | NullableTypeSpecifier |
   * SimpleTypeSpecifier | TupleTypeSpecifier | TypeConstant |
   * VarrayTypeSpecifier | VectorTypeSpecifier
   */
  public function getTypeSpecifierx(): ITypeSpecifier {
    return TypeAssert\not_null($this->getTypeSpecifier());
  }

  public function getDeclaratorsUNTYPED(): Node {
    return $this->_declarators;
  }

  public function withDeclarators(
    NodeList<ListItem<ConstantDeclarator>> $value,
  ): this {
    if ($value === $this->_declarators) {
      return $this;
    }
    return new static(
      $this->_visibility,
      $this->_abstract,
      $this->_keyword,
      $this->_type_specifier,
      $value ?? Missing(),
      $this->_semicolon,
    );
  }

  public function hasDeclarators(): bool {
    return !$this->_declarators->isMissing();
  }

  /**
   * @return NodeList<ListItem<ConstantDeclarator>>
   */
  public function getDeclarators(): NodeList<ListItem<ConstantDeclarator>> {
    return TypeAssert\instance_of(NodeList::class, $this->_declarators);
  }

  /**
   * @return NodeList<ListItem<ConstantDeclarator>>
   */
  public function getDeclaratorsx(): NodeList<ListItem<ConstantDeclarator>> {
    return $this->getDeclarators();
  }

  public function getSemicolonUNTYPED(): Node {
    return $this->_semicolon;
  }

  public function withSemicolon(SemicolonToken $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new static(
      $this->_visibility,
      $this->_abstract,
      $this->_keyword,
      $this->_type_specifier,
      $this->_declarators,
      $value ?? Missing(),
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
