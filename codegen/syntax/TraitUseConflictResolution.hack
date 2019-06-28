/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<dfa92e6d9c6666c569cae89ad2d7379d>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class TraitUseConflictResolution
  extends Node
  implements IClassBodyDeclaration {

  const string SYNTAX_KIND = 'trait_use_conflict_resolution';

  private Node $_keyword;
  private Node $_names;
  private Node $_left_brace;
  private Node $_clauses;
  private Node $_right_brace;

  public function __construct(
    Node $keyword,
    Node $names,
    Node $left_brace,
    Node $clauses,
    Node $right_brace,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_keyword = $keyword;
    $this->_names = $names;
    $this->_left_brace = $left_brace;
    $this->_clauses = $clauses;
    $this->_right_brace = $right_brace;
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
    $keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['trait_use_conflict_resolution_keyword'],
      $file,
      $offset,
      $source,
      'UseToken',
    );
    $offset += $keyword->getWidth();
    $names = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['trait_use_conflict_resolution_names'],
      $file,
      $offset,
      $source,
      'NodeList<ListItem<SimpleTypeSpecifier>>',
    );
    $offset += $names->getWidth();
    $left_brace = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['trait_use_conflict_resolution_left_brace'],
      $file,
      $offset,
      $source,
      'LeftBraceToken',
    );
    $offset += $left_brace->getWidth();
    $clauses = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['trait_use_conflict_resolution_clauses'],
      $file,
      $offset,
      $source,
      'NodeList<ListItem<ITraitUseItem>>',
    );
    $offset += $clauses->getWidth();
    $right_brace = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['trait_use_conflict_resolution_right_brace'],
      $file,
      $offset,
      $source,
      'RightBraceToken',
    );
    $offset += $right_brace->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      $keyword,
      $names,
      $left_brace,
      $clauses,
      $right_brace,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'keyword' => $this->_keyword,
      'names' => $this->_names,
      'left_brace' => $this->_left_brace,
      'clauses' => $this->_clauses,
      'right_brace' => $this->_right_brace,
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
    $left_brace = $rewriter($this->_left_brace, $parents);
    $clauses = $rewriter($this->_clauses, $parents);
    $right_brace = $rewriter($this->_right_brace, $parents);
    if (
      $keyword === $this->_keyword &&
      $names === $this->_names &&
      $left_brace === $this->_left_brace &&
      $clauses === $this->_clauses &&
      $right_brace === $this->_right_brace
    ) {
      return $this;
    }
    return new static($keyword, $names, $left_brace, $clauses, $right_brace);
  }

  public function getKeywordUNTYPED(): Node {
    return $this->_keyword;
  }

  public function withKeyword(UseToken $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static(
      $value ?? Missing(),
      $this->_names,
      $this->_left_brace,
      $this->_clauses,
      $this->_right_brace,
    );
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

  public function withNames(
    NodeList<ListItem<SimpleTypeSpecifier>> $value,
  ): this {
    if ($value === $this->_names) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $value ?? Missing(),
      $this->_left_brace,
      $this->_clauses,
      $this->_right_brace,
    );
  }

  public function hasNames(): bool {
    return !$this->_names->isMissing();
  }

  /**
   * @return NodeList<ListItem<SimpleTypeSpecifier>>
   */
  public function getNames(): NodeList<ListItem<SimpleTypeSpecifier>> {
    return TypeAssert\instance_of(NodeList::class, $this->_names);
  }

  /**
   * @return NodeList<ListItem<SimpleTypeSpecifier>>
   */
  public function getNamesx(): NodeList<ListItem<SimpleTypeSpecifier>> {
    return $this->getNames();
  }

  public function getLeftBraceUNTYPED(): Node {
    return $this->_left_brace;
  }

  public function withLeftBrace(LeftBraceToken $value): this {
    if ($value === $this->_left_brace) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_names,
      $value ?? Missing(),
      $this->_clauses,
      $this->_right_brace,
    );
  }

  public function hasLeftBrace(): bool {
    return !$this->_left_brace->isMissing();
  }

  /**
   * @return LeftBraceToken
   */
  public function getLeftBrace(): LeftBraceToken {
    return TypeAssert\instance_of(LeftBraceToken::class, $this->_left_brace);
  }

  /**
   * @return LeftBraceToken
   */
  public function getLeftBracex(): LeftBraceToken {
    return $this->getLeftBrace();
  }

  public function getClausesUNTYPED(): Node {
    return $this->_clauses;
  }

  public function withClauses(?NodeList<ListItem<ITraitUseItem>> $value): this {
    if ($value === $this->_clauses) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_names,
      $this->_left_brace,
      $value ?? Missing(),
      $this->_right_brace,
    );
  }

  public function hasClauses(): bool {
    return !$this->_clauses->isMissing();
  }

  /**
   * @return NodeList<ListItem<TraitUseAliasItem>> |
   * NodeList<ListItem<ITraitUseItem>> |
   * NodeList<ListItem<TraitUsePrecedenceItem>> | null
   */
  public function getClauses(): ?NodeList<ListItem<ITraitUseItem>> {
    if ($this->_clauses->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(NodeList::class, $this->_clauses);
  }

  /**
   * @return NodeList<ListItem<TraitUseAliasItem>> |
   * NodeList<ListItem<ITraitUseItem>> |
   * NodeList<ListItem<TraitUsePrecedenceItem>>
   */
  public function getClausesx(): NodeList<ListItem<ITraitUseItem>> {
    return TypeAssert\not_null($this->getClauses());
  }

  public function getRightBraceUNTYPED(): Node {
    return $this->_right_brace;
  }

  public function withRightBrace(RightBraceToken $value): this {
    if ($value === $this->_right_brace) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_names,
      $this->_left_brace,
      $this->_clauses,
      $value ?? Missing(),
    );
  }

  public function hasRightBrace(): bool {
    return !$this->_right_brace->isMissing();
  }

  /**
   * @return RightBraceToken
   */
  public function getRightBrace(): RightBraceToken {
    return TypeAssert\instance_of(RightBraceToken::class, $this->_right_brace);
  }

  /**
   * @return RightBraceToken
   */
  public function getRightBracex(): RightBraceToken {
    return $this->getRightBrace();
  }
}
