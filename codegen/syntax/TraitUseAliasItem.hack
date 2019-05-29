/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<9ffa2f50febea8a6803a6fe310f16eec>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class TraitUseAliasItem extends Node implements ITraitUseItem {

  const string SYNTAX_KIND = 'trait_use_alias_item';

  private Node $_aliasing_name;
  private Node $_keyword;
  private Node $_modifiers;
  private Node $_aliased_name;

  public function __construct(
    Node $aliasing_name,
    Node $keyword,
    Node $modifiers,
    Node $aliased_name,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_aliasing_name = $aliasing_name;
    $this->_keyword = $keyword;
    $this->_modifiers = $modifiers;
    $this->_aliased_name = $aliased_name;
    parent::__construct($source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
  ): this {
    $offset = $initial_offset;
    $aliasing_name = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['trait_use_alias_item_aliasing_name'],
      $file,
      $offset,
      $source,
    );
    $offset += $aliasing_name->getWidth();
    $keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['trait_use_alias_item_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $keyword->getWidth();
    $modifiers = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['trait_use_alias_item_modifiers'],
      $file,
      $offset,
      $source,
    );
    $offset += $modifiers->getWidth();
    $aliased_name = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['trait_use_alias_item_aliased_name'],
      $file,
      $offset,
      $source,
    );
    $offset += $aliased_name->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      $aliasing_name,
      $keyword,
      $modifiers,
      $aliased_name,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'aliasing_name' => $this->_aliasing_name,
      'keyword' => $this->_keyword,
      'modifiers' => $this->_modifiers,
      'aliased_name' => $this->_aliased_name,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $aliasing_name = $rewriter($this->_aliasing_name, $parents);
    $keyword = $rewriter($this->_keyword, $parents);
    $modifiers = $rewriter($this->_modifiers, $parents);
    $aliased_name = $rewriter($this->_aliased_name, $parents);
    if (
      $aliasing_name === $this->_aliasing_name &&
      $keyword === $this->_keyword &&
      $modifiers === $this->_modifiers &&
      $aliased_name === $this->_aliased_name
    ) {
      return $this;
    }
    return new static($aliasing_name, $keyword, $modifiers, $aliased_name);
  }

  public function getAliasingNameUNTYPED(): Node {
    return $this->_aliasing_name;
  }

  public function withAliasingName(Node $value): this {
    if ($value === $this->_aliasing_name) {
      return $this;
    }
    return new static(
      $value,
      $this->_keyword,
      $this->_modifiers,
      $this->_aliased_name,
    );
  }

  public function hasAliasingName(): bool {
    return !$this->_aliasing_name->isMissing();
  }

  /**
   * @return ScopeResolutionExpression | SimpleTypeSpecifier
   */
  public function getAliasingName(): Node {
    return $this->_aliasing_name;
  }

  /**
   * @return ScopeResolutionExpression | SimpleTypeSpecifier
   */
  public function getAliasingNamex(): Node {
    return $this->getAliasingName();
  }

  public function getKeywordUNTYPED(): Node {
    return $this->_keyword;
  }

  public function withKeyword(Node $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static(
      $this->_aliasing_name,
      $value,
      $this->_modifiers,
      $this->_aliased_name,
    );
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  /**
   * @return AsToken
   */
  public function getKeyword(): AsToken {
    return TypeAssert\instance_of(AsToken::class, $this->_keyword);
  }

  /**
   * @return AsToken
   */
  public function getKeywordx(): AsToken {
    return $this->getKeyword();
  }

  public function getModifiersUNTYPED(): Node {
    return $this->_modifiers;
  }

  public function withModifiers(Node $value): this {
    if ($value === $this->_modifiers) {
      return $this;
    }
    return new static(
      $this->_aliasing_name,
      $this->_keyword,
      $value,
      $this->_aliased_name,
    );
  }

  public function hasModifiers(): bool {
    return !$this->_modifiers->isMissing();
  }

  /**
   * @return NodeList<FinalToken> | NodeList<Token> | NodeList<PrivateToken> |
   * NodeList<ProtectedToken> | NodeList<PublicToken> | null
   */
  public function getModifiers(): ?NodeList<Token> {
    if ($this->_modifiers->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(NodeList::class, $this->_modifiers);
  }

  /**
   * @return NodeList<FinalToken> | NodeList<Token> | NodeList<PrivateToken> |
   * NodeList<ProtectedToken> | NodeList<PublicToken>
   */
  public function getModifiersx(): NodeList<Token> {
    return TypeAssert\not_null($this->getModifiers());
  }

  public function getAliasedNameUNTYPED(): Node {
    return $this->_aliased_name;
  }

  public function withAliasedName(Node $value): this {
    if ($value === $this->_aliased_name) {
      return $this;
    }
    return new static(
      $this->_aliasing_name,
      $this->_keyword,
      $this->_modifiers,
      $value,
    );
  }

  public function hasAliasedName(): bool {
    return !$this->_aliased_name->isMissing();
  }

  /**
   * @return null | SimpleTypeSpecifier
   */
  public function getAliasedName(): ?SimpleTypeSpecifier {
    if ($this->_aliased_name->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(
      SimpleTypeSpecifier::class,
      $this->_aliased_name,
    );
  }

  /**
   * @return SimpleTypeSpecifier
   */
  public function getAliasedNamex(): SimpleTypeSpecifier {
    return TypeAssert\not_null($this->getAliasedName());
  }
}
