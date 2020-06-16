/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<24b0793fddc1bcfd10f10bec32eb12d5>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class TraitUseAliasItem extends Node implements ITraitUseItem {

  const string SYNTAX_KIND = 'trait_use_alias_item';

  private Node $_aliasing_name;
  private AsToken $_keyword;
  private ?NodeList<Token> $_modifiers;
  private ?SimpleTypeSpecifier $_aliased_name;

  public function __construct(
    Node $aliasing_name,
    AsToken $keyword,
    ?NodeList<Token> $modifiers,
    ?SimpleTypeSpecifier $aliased_name,
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
    string $_type_hint,
  ): this {
    $offset = $initial_offset;
    $aliasing_name = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['trait_use_alias_item_aliasing_name'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $aliasing_name = $aliasing_name as nonnull;
    $offset += $aliasing_name->getWidth();
    $keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['trait_use_alias_item_keyword'],
      $file,
      $offset,
      $source,
      'AsToken',
    );
    $keyword = $keyword as nonnull;
    $offset += $keyword->getWidth();
    $modifiers = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['trait_use_alias_item_modifiers'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'NodeList<Token>',
    );
    $offset += $modifiers?->getWidth() ?? 0;
    $aliased_name = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['trait_use_alias_item_aliased_name'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'SimpleTypeSpecifier',
    );
    $offset += $aliased_name?->getWidth() ?? 0;
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $aliasing_name,
      /* HH_IGNORE_ERROR[4110] */ $keyword,
      /* HH_IGNORE_ERROR[4110] */ $modifiers,
      /* HH_IGNORE_ERROR[4110] */ $aliased_name,
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
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $aliasing_name = $rewriter($this->_aliasing_name, $parents);
    $keyword = $rewriter($this->_keyword, $parents);
    $modifiers = $this->_modifiers === null
      ? null
      : $rewriter($this->_modifiers, $parents);
    $aliased_name = $this->_aliased_name === null
      ? null
      : $rewriter($this->_aliased_name, $parents);
    if (
      $aliasing_name === $this->_aliasing_name &&
      $keyword === $this->_keyword &&
      $modifiers === $this->_modifiers &&
      $aliased_name === $this->_aliased_name
    ) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $aliasing_name,
      /* HH_FIXME[4110] use `as` */ $keyword,
      /* HH_FIXME[4110] use `as` */ $modifiers,
      /* HH_FIXME[4110] use `as` */ $aliased_name,
    );
  }

  public function getAliasingNameUNTYPED(): ?Node {
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
    return $this->_aliasing_name !== null;
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

  public function getKeywordUNTYPED(): ?Node {
    return $this->_keyword;
  }

  public function withKeyword(AsToken $value): this {
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
    return $this->_keyword !== null;
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

  public function getModifiersUNTYPED(): ?Node {
    return $this->_modifiers;
  }

  public function withModifiers(?NodeList<Token> $value): this {
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
    return $this->_modifiers !== null;
  }

  /**
   * @return NodeList<PrivateToken> | NodeList<ProtectedToken> |
   * NodeList<PublicToken> | null
   */
  public function getModifiers(): ?NodeList<Token> {
    return $this->_modifiers;
  }

  /**
   * @return NodeList<PrivateToken> | NodeList<ProtectedToken> |
   * NodeList<PublicToken>
   */
  public function getModifiersx(): NodeList<Token> {
    return TypeAssert\not_null($this->getModifiers());
  }

  public function getAliasedNameUNTYPED(): ?Node {
    return $this->_aliased_name;
  }

  public function withAliasedName(?SimpleTypeSpecifier $value): this {
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
    return $this->_aliased_name !== null;
  }

  /**
   * @return null | SimpleTypeSpecifier
   */
  public function getAliasedName(): ?SimpleTypeSpecifier {
    return $this->_aliased_name;
  }

  /**
   * @return SimpleTypeSpecifier
   */
  public function getAliasedNamex(): SimpleTypeSpecifier {
    return TypeAssert\not_null($this->getAliasedName());
  }
}
