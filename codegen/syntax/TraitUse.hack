/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<d8ad43b1cfbd9fe2e68a029463a737fa>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class TraitUse extends Node implements IClassBodyDeclaration {

  const string SYNTAX_KIND = 'trait_use';

  private Node $_keyword;
  private Node $_names;
  private Node $_semicolon;

  public function __construct(
    Node $keyword,
    Node $names,
    Node $semicolon,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_keyword = $keyword;
    $this->_names = $names;
    $this->_semicolon = $semicolon;
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
    $keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['trait_use_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $keyword->getWidth();
    $names = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['trait_use_names'],
      $file,
      $offset,
      $source,
    );
    $offset += $names->getWidth();
    $semicolon = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['trait_use_semicolon'],
      $file,
      $offset,
      $source,
    );
    $offset += $semicolon->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static($keyword, $names, $semicolon, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'keyword' => $this->_keyword,
      'names' => $this->_names,
      'semicolon' => $this->_semicolon,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
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
    return new static($keyword, $names, $semicolon);
  }

  public function getKeywordUNTYPED(): Node {
    return $this->_keyword;
  }

  public function withKeyword(Node $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static($value, $this->_names, $this->_semicolon);
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
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

  public function getNamesUNTYPED(): Node {
    return $this->_names;
  }

  public function withNames(Node $value): this {
    if ($value === $this->_names) {
      return $this;
    }
    return new static($this->_keyword, $value, $this->_semicolon);
  }

  public function hasNames(): bool {
    return !$this->_names->isMissing();
  }

  /**
   * @return NodeList<GenericTypeSpecifier> |
   * NodeList<ISimpleCreationSpecifier> | NodeList<SimpleTypeSpecifier>
   */
  public function getNames(): NodeList<ISimpleCreationSpecifier> {
    return TypeAssert\instance_of(NodeList::class, $this->_names);
  }

  /**
   * @return NodeList<GenericTypeSpecifier> |
   * NodeList<ISimpleCreationSpecifier> | NodeList<SimpleTypeSpecifier>
   */
  public function getNamesx(): NodeList<ISimpleCreationSpecifier> {
    return $this->getNames();
  }

  public function getSemicolonUNTYPED(): Node {
    return $this->_semicolon;
  }

  public function withSemicolon(Node $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new static($this->_keyword, $this->_names, $value);
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
