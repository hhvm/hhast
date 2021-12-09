/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<129da117a81f97fc63c64e8921a42d2b>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;
/* HHAST_IGNORE_ALL[5607] 5607 is ignored because of false positives when comparing a generic to a typed value */
/* HHAST_IGNORE_ALL[5624] HHAST_IGNORE_ALL[5639] 5624 and 5639 are ignored because they insist on using co(tra)variant generics. Could this break external consumers? */

<<__ConsistentConstruct>>
final class TraitUse extends Node implements IClassBodyDeclaration {

  const string SYNTAX_KIND = 'trait_use';

  private UseToken $_keyword;
  private NodeList<ListItem<ISimpleCreationSpecifier>> $_names;
  private SemicolonToken $_semicolon;

  public function __construct(
    UseToken $keyword,
    NodeList<ListItem<ISimpleCreationSpecifier>> $names,
    SemicolonToken $semicolon,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_keyword = $keyword;
    $this->_names = $names;
    $this->_semicolon = $semicolon;
    parent::__construct($source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<arraykey, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
    string $_type_hint,
  ): this {
    $offset = $initial_offset;
    $keyword = Node::fromJSON(
      ($json['trait_use_keyword']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'UseToken',
    );
    $keyword = $keyword as nonnull;
    $offset += $keyword->getWidth();
    $names = Node::fromJSON(
      ($json['trait_use_names']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'NodeList<ListItem<ISimpleCreationSpecifier>>',
    );
    $names = $names as nonnull;
    $offset += $names->getWidth();
    $semicolon = Node::fromJSON(
      ($json['trait_use_semicolon']) as dict<_, _>,
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
      /* HH_IGNORE_ERROR[4110] */ $keyword,
      /* HH_IGNORE_ERROR[4110] */ $names,
      /* HH_IGNORE_ERROR[4110] */ $semicolon,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'keyword' => $this->_keyword,
      'names' => $this->_names,
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
    $keyword = $rewriter($this->_keyword, $parents);
    $names = $rewriter($this->_names, $parents);
    $semicolon = $rewriter($this->_semicolon, $parents);
    if (
      $keyword === $this->_keyword &&
      $names === $this->_names &&
      $semicolon === $this->_semicolon
    ) {
      return $this;
    }
    return new static(
      $keyword as UseToken,
      /* HH_FIXME[4110] NodeList<ListItem<ISimpleCreationSpecifier>> may not be enforceable */ $names,
      $semicolon as SemicolonToken,
    );
  }

  public function getKeywordUNTYPED(): ?Node {
    return $this->_keyword;
  }

  public function withKeyword(UseToken $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static($value, $this->_names, $this->_semicolon);
  }

  public function hasKeyword(): bool {
    return true;
  }

  /**
   * @return UseToken
   */
  public function getKeyword(): UseToken {
    return TypeAssert\instance_of(UseToken::class, $this->_keyword);
  }

  /**
   * @return UseToken
   */
  public function getKeywordx(): UseToken {
    return $this->getKeyword();
  }

  public function getNamesUNTYPED(): ?Node {
    return $this->_names;
  }

  public function withNames(
    NodeList<ListItem<ISimpleCreationSpecifier>> $value,
  ): this {
    if ($value === $this->_names) {
      return $this;
    }
    return new static($this->_keyword, $value, $this->_semicolon);
  }

  public function hasNames(): bool {
    return true;
  }

  /**
   * @return NodeList<ListItem<GenericTypeSpecifier>> |
   * NodeList<ListItem<ISimpleCreationSpecifier>> |
   * NodeList<ListItem<SimpleTypeSpecifier>>
   */
  public function getNames(): NodeList<ListItem<ISimpleCreationSpecifier>> {
    return TypeAssert\instance_of(NodeList::class, $this->_names);
  }

  /**
   * @return NodeList<ListItem<GenericTypeSpecifier>> |
   * NodeList<ListItem<ISimpleCreationSpecifier>> |
   * NodeList<ListItem<SimpleTypeSpecifier>>
   */
  public function getNamesx(): NodeList<ListItem<ISimpleCreationSpecifier>> {
    return $this->getNames();
  }

  public function getSemicolonUNTYPED(): ?Node {
    return $this->_semicolon;
  }

  public function withSemicolon(SemicolonToken $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new static($this->_keyword, $this->_names, $value);
  }

  public function hasSemicolon(): bool {
    return true;
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
