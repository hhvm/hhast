/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<19239b09abe9fb90fa935aedd7fde3c4>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class ConstDeclaration extends Node implements IClassBodyDeclaration {

  const string SYNTAX_KIND = 'const_declaration';

  private ?NodeList<AbstractToken> $_modifiers;
  private ConstToken $_keyword;
  private ?ITypeSpecifier $_type_specifier;
  private NodeList<ListItem<ConstantDeclarator>> $_declarators;
  private SemicolonToken $_semicolon;

  public function __construct(
    ?NodeList<AbstractToken> $modifiers,
    ConstToken $keyword,
    ?ITypeSpecifier $type_specifier,
    NodeList<ListItem<ConstantDeclarator>> $declarators,
    SemicolonToken $semicolon,
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
      /* HH_FIXME[4110] */ $json['const_modifiers'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'NodeList<AbstractToken>',
    );
    $offset += $modifiers?->getWidth() ?? 0;
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
      /* HH_FIXME[4110] */ $json['const_type_specifier'] ?? dict['kind' => 'missing'],
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
      /* HH_IGNORE_ERROR[4110] */ $modifiers,
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
      'modifiers' => $this->_modifiers,
      'keyword' => $this->_keyword,
      'type_specifier' => $this->_type_specifier,
      'declarators' => $this->_declarators,
      'semicolon' => $this->_semicolon,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $modifiers = $this->_modifiers === null
      ? null
      : $rewriter($this->_modifiers, $parents);
    $keyword = $rewriter($this->_keyword, $parents);
    $type_specifier = $this->_type_specifier === null
      ? null
      : $rewriter($this->_type_specifier, $parents);
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
      /* HH_FIXME[4110] use `as` */ $modifiers,
      /* HH_FIXME[4110] use `as` */ $keyword,
      /* HH_FIXME[4110] use `as` */ $type_specifier,
      /* HH_FIXME[4110] use `as` */ $declarators,
      /* HH_FIXME[4110] use `as` */ $semicolon,
    );
  }

  public function getModifiersUNTYPED(): ?Node {
    return $this->_modifiers;
  }

  public function withModifiers(?NodeList<AbstractToken> $value): this {
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
    return $this->_modifiers !== null;
  }

  /**
   * @return NodeList<AbstractToken> | null
   */
  public function getModifiers(): ?NodeList<AbstractToken> {
    return $this->_modifiers;
  }

  /**
   * @return NodeList<AbstractToken>
   */
  public function getModifiersx(): NodeList<AbstractToken> {
    return TypeAssert\not_null($this->getModifiers());
  }

  public function getKeywordUNTYPED(): ?Node {
    return $this->_keyword;
  }

  public function withKeyword(ConstToken $value): this {
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
      $this->_modifiers,
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
   * DictionaryTypeSpecifier | GenericTypeSpecifier | KeysetTypeSpecifier |
   * null | NullableTypeSpecifier | SimpleTypeSpecifier | TupleTypeSpecifier |
   * TypeConstant | VarrayTypeSpecifier | VectorTypeSpecifier
   */
  public function getTypeSpecifier(): ?ITypeSpecifier {
    return $this->_type_specifier;
  }

  /**
   * @return ClassnameTypeSpecifier | DarrayTypeSpecifier |
   * DictionaryTypeSpecifier | GenericTypeSpecifier | KeysetTypeSpecifier |
   * NullableTypeSpecifier | SimpleTypeSpecifier | TupleTypeSpecifier |
   * TypeConstant | VarrayTypeSpecifier | VectorTypeSpecifier
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
      $this->_modifiers,
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
      $this->_modifiers,
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
