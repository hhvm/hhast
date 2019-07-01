/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<48bc9f072828f0f3cd2df780863fcf23>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class ConstDeclaration extends Node implements IClassBodyDeclaration {

  const string SYNTAX_KIND = 'const_declaration';

  private Node $_modifiers;
  private Node $_keyword;
  private Node $_type_specifier;
  private Node $_declarators;
  private Node $_semicolon;

  public function __construct(
    Node $modifiers,
    Node $keyword,
    Node $type_specifier,
    Node $declarators,
    Node $semicolon,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_modifiers = $modifiers;
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
    $modifiers = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['const_modifiers'],
      $file,
      $offset,
      $source,
      'NodeList<AbstractToken>',
    );
    $offset += $modifiers->getWidth();
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
      $modifiers,
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
      'modifiers' => $this->_modifiers,
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
    $modifiers = $rewriter($this->_modifiers, $parents);
    $keyword = $rewriter($this->_keyword, $parents);
    $type_specifier = $rewriter($this->_type_specifier, $parents);
    $declarators = $rewriter($this->_declarators, $parents);
    $semicolon = $rewriter($this->_semicolon, $parents);
    if (
      $modifiers === $this->_modifiers &&
      $keyword === $this->_keyword &&
      $type_specifier === $this->_type_specifier &&
      $declarators === $this->_declarators &&
      $semicolon === $this->_semicolon
    ) {
      return $this;
    }
    return new static(
      $modifiers,
      $keyword,
      $type_specifier,
      $declarators,
      $semicolon,
    );
  }

  public function getModifiersUNTYPED(): Node {
    return $this->_modifiers;
  }

  public function withModifiers(Node $value): this {
    if ($value === $this->_modifiers) {
      return $this;
    }
    return new static(
      $value,
      $this->_keyword,
      $this->_type_specifier,
      $this->_declarators,
      $this->_semicolon,
    );
  }

  public function hasModifiers(): bool {
    return !$this->_modifiers->isMissing();
  }

  /**
   * @return NodeList<AbstractToken> | null
   */
  public function getModifiers(): ?NodeList<AbstractToken> {
    if ($this->_modifiers->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(NodeList::class, $this->_modifiers);
  }

  /**
   * @return NodeList<AbstractToken>
   */
  public function getModifiersx(): NodeList<AbstractToken> {
    return TypeAssert\not_null($this->getModifiers());
  }

  public function getKeywordUNTYPED(): Node {
    return $this->_keyword;
  }

  public function withKeyword(Node $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static(
      $this->_modifiers,
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

  public function getTypeSpecifierUNTYPED(): Node {
    return $this->_type_specifier;
  }

  public function withTypeSpecifier(Node $value): this {
    if ($value === $this->_type_specifier) {
      return $this;
    }
    return new static(
      $this->_modifiers,
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

  public function withDeclarators(Node $value): this {
    if ($value === $this->_declarators) {
      return $this;
    }
    return new static(
      $this->_modifiers,
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

  public function withSemicolon(Node $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new static(
      $this->_modifiers,
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
