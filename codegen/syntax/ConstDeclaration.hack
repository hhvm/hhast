/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<1b29c29b12f1ec88d2f702bcf00654c6>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class ConstDeclaration extends Node implements IClassBodyDeclaration {

  const string SYNTAX_KIND = 'const_declaration';

  private ?Token $_visibility;
  private ?AbstractToken $_abstract;
  private ConstToken $_keyword;
  private ?ITypeSpecifier $_type_specifier;
  private NodeList<ListItem<ConstantDeclarator>> $_declarators;
  private SemicolonToken $_semicolon;

  public function __construct(
    ?Token $visibility,
    ?AbstractToken $abstract,
    ConstToken $keyword,
    ?ITypeSpecifier $type_specifier,
    NodeList<ListItem<ConstantDeclarator>> $declarators,
    SemicolonToken $semicolon,
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
    $offset += $visibility?->getWidth() ?? 0;
    $abstract = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['const_abstract'],
      $file,
      $offset,
      $source,
      'AbstractToken',
    );
    $offset += $abstract?->getWidth() ?? 0;
    $keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['const_keyword'],
      $file,
      $offset,
      $source,
      'ConstToken',
    );
    $keyword = $keyword as nonnull;
    $offset += $keyword->getWidth();
    $type_specifier = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['const_type_specifier'],
      $file,
      $offset,
      $source,
      'ITypeSpecifier',
    );
    $offset += $type_specifier?->getWidth() ?? 0;
    $declarators = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['const_declarators'],
      $file,
      $offset,
      $source,
      'NodeList<ListItem<ConstantDeclarator>>',
    );
    $declarators = $declarators as nonnull;
    $offset += $declarators->getWidth();
    $semicolon = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['const_semicolon'],
      $file,
      $offset,
      $source,
      'SemicolonToken',
    );
    $semicolon = $semicolon as nonnull;
    $offset += $semicolon->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $visibility,
      /* HH_IGNORE_ERROR[4110] */ $abstract,
      /* HH_IGNORE_ERROR[4110] */ $keyword,
      /* HH_IGNORE_ERROR[4110] */ $type_specifier,
      /* HH_IGNORE_ERROR[4110] */ $declarators,
      /* HH_IGNORE_ERROR[4110] */ $semicolon,
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
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $visibility = $this->_visibility === null
      ? null
      : $rewriter($this->_visibility, $parents);
    $abstract = $this->_abstract === null
      ? null
      : $rewriter($this->_abstract, $parents);
    $keyword = $rewriter($this->_keyword, $parents);
    $type_specifier = $this->_type_specifier === null
      ? null
      : $rewriter($this->_type_specifier, $parents);
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
      /* HH_FIXME[4110] use `as` */ $visibility,
      /* HH_FIXME[4110] use `as` */ $abstract,
      /* HH_FIXME[4110] use `as` */ $keyword,
      /* HH_FIXME[4110] use `as` */ $type_specifier,
      /* HH_FIXME[4110] use `as` */ $declarators,
      /* HH_FIXME[4110] use `as` */ $semicolon,
    );
  }

  public function getVisibilityUNTYPED(): ?Node {
    return $this->_visibility;
  }

  public function withVisibility(?Token $value): this {
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
    return $this->_visibility !== null;
  }

  /**
   * @return null | ProtectedToken | PublicToken
   */
  public function getVisibility(): ?Token {
    return $this->_visibility;
  }

  /**
   * @return ProtectedToken | PublicToken
   */
  public function getVisibilityx(): Token {
    return TypeAssert\not_null($this->getVisibility());
  }

  public function getAbstractUNTYPED(): ?Node {
    return $this->_abstract;
  }

  public function withAbstract(?AbstractToken $value): this {
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
    return $this->_abstract !== null;
  }

  /**
   * @return null | AbstractToken
   */
  public function getAbstract(): ?AbstractToken {
    return $this->_abstract;
  }

  /**
   * @return AbstractToken
   */
  public function getAbstractx(): AbstractToken {
    return TypeAssert\not_null($this->getAbstract());
  }

  public function getKeywordUNTYPED(): ?Node {
    return $this->_keyword;
  }

  public function withKeyword(ConstToken $value): this {
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
    return $this->_keyword !== null;
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

  public function getTypeSpecifierUNTYPED(): ?Node {
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
      $value,
      $this->_declarators,
      $this->_semicolon,
    );
  }

  public function hasTypeSpecifier(): bool {
    return $this->_type_specifier !== null;
  }

  /**
   * @return ClassnameTypeSpecifier | DarrayTypeSpecifier |
   * GenericTypeSpecifier | KeysetTypeSpecifier | null | NullableTypeSpecifier
   * | SimpleTypeSpecifier | TupleTypeSpecifier | TypeConstant |
   * VarrayTypeSpecifier | VectorTypeSpecifier
   */
  public function getTypeSpecifier(): ?ITypeSpecifier {
    return $this->_type_specifier;
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

  public function getDeclaratorsUNTYPED(): ?Node {
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
      $value,
      $this->_semicolon,
    );
  }

  public function hasDeclarators(): bool {
    return $this->_declarators !== null;
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

  public function getSemicolonUNTYPED(): ?Node {
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
      $value,
    );
  }

  public function hasSemicolon(): bool {
    return $this->_semicolon !== null;
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
