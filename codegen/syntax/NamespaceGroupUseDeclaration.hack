/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<188844105e5ec996df6b03e1dbe14943>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class NamespaceGroupUseDeclaration
  extends Node
  implements INamespaceUseDeclaration {

  const string SYNTAX_KIND = 'namespace_group_use_declaration';

  private Node $_keyword;
  private Node $_kind;
  private Node $_prefix;
  private Node $_left_brace;
  private Node $_clauses;
  private Node $_right_brace;
  private Node $_semicolon;

  public function __construct(
    Node $keyword,
    Node $kind,
    Node $prefix,
    Node $left_brace,
    Node $clauses,
    Node $right_brace,
    Node $semicolon,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_keyword = $keyword;
    $this->_kind = $kind;
    $this->_prefix = $prefix;
    $this->_left_brace = $left_brace;
    $this->_clauses = $clauses;
    $this->_right_brace = $right_brace;
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
    $keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['namespace_group_use_keyword'],
      $file,
      $offset,
      $source,
      'UseToken',
    );
    $offset += $keyword->getWidth();
    $kind = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['namespace_group_use_kind'],
      $file,
      $offset,
      $source,
      'Token',
    );
    $offset += $kind->getWidth();
    $prefix = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['namespace_group_use_prefix'],
      $file,
      $offset,
      $source,
      'QualifiedName',
    );
    $offset += $prefix->getWidth();
    $left_brace = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['namespace_group_use_left_brace'],
      $file,
      $offset,
      $source,
      'LeftBraceToken',
    );
    $offset += $left_brace->getWidth();
    $clauses = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['namespace_group_use_clauses'],
      $file,
      $offset,
      $source,
      'NodeList<ListItem<NamespaceUseClause>>',
    );
    $offset += $clauses->getWidth();
    $right_brace = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['namespace_group_use_right_brace'],
      $file,
      $offset,
      $source,
      'RightBraceToken',
    );
    $offset += $right_brace->getWidth();
    $semicolon = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['namespace_group_use_semicolon'],
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
      $keyword,
      $kind,
      $prefix,
      $left_brace,
      $clauses,
      $right_brace,
      $semicolon,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'keyword' => $this->_keyword,
      'kind' => $this->_kind,
      'prefix' => $this->_prefix,
      'left_brace' => $this->_left_brace,
      'clauses' => $this->_clauses,
      'right_brace' => $this->_right_brace,
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
    $kind = $rewriter($this->_kind, $parents);
    $prefix = $rewriter($this->_prefix, $parents);
    $left_brace = $rewriter($this->_left_brace, $parents);
    $clauses = $rewriter($this->_clauses, $parents);
    $right_brace = $rewriter($this->_right_brace, $parents);
    $semicolon = $rewriter($this->_semicolon, $parents);
    if (
      $keyword === $this->_keyword &&
      $kind === $this->_kind &&
      $prefix === $this->_prefix &&
      $left_brace === $this->_left_brace &&
      $clauses === $this->_clauses &&
      $right_brace === $this->_right_brace &&
      $semicolon === $this->_semicolon
    ) {
      return $this;
    }
    return new static(
      $keyword,
      $kind,
      $prefix,
      $left_brace,
      $clauses,
      $right_brace,
      $semicolon,
    );
  }

  public function getKeywordUNTYPED(): Node {
    return $this->_keyword;
  }

  public function withKeyword(Node $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static(
      $value,
      $this->_kind,
      $this->_prefix,
      $this->_left_brace,
      $this->_clauses,
      $this->_right_brace,
      $this->_semicolon,
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

  public function getKindUNTYPED(): Node {
    return $this->_kind;
  }

  public function withKind(Node $value): this {
    if ($value === $this->_kind) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $value,
      $this->_prefix,
      $this->_left_brace,
      $this->_clauses,
      $this->_right_brace,
      $this->_semicolon,
    );
  }

  public function hasKind(): bool {
    return !$this->_kind->isMissing();
  }

  /**
   * @return null | ConstToken | FunctionToken | NamespaceToken | TypeToken
   */
  public function getKind(): ?Token {
    if ($this->_kind->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(Token::class, $this->_kind);
  }

  /**
   * @return ConstToken | FunctionToken | NamespaceToken | TypeToken
   */
  public function getKindx(): Token {
    return TypeAssert\not_null($this->getKind());
  }

  public function getPrefixUNTYPED(): Node {
    return $this->_prefix;
  }

  public function withPrefix(Node $value): this {
    if ($value === $this->_prefix) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_kind,
      $value,
      $this->_left_brace,
      $this->_clauses,
      $this->_right_brace,
      $this->_semicolon,
    );
  }

  public function hasPrefix(): bool {
    return !$this->_prefix->isMissing();
  }

  /**
   * @return QualifiedName
   */
  public function getPrefix(): QualifiedName {
    return TypeAssert\instance_of(QualifiedName::class, $this->_prefix);
  }

  /**
   * @return QualifiedName
   */
  public function getPrefixx(): QualifiedName {
    return $this->getPrefix();
  }

  public function getLeftBraceUNTYPED(): Node {
    return $this->_left_brace;
  }

  public function withLeftBrace(Node $value): this {
    if ($value === $this->_left_brace) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_kind,
      $this->_prefix,
      $value,
      $this->_clauses,
      $this->_right_brace,
      $this->_semicolon,
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

  public function withClauses(Node $value): this {
    if ($value === $this->_clauses) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_kind,
      $this->_prefix,
      $this->_left_brace,
      $value,
      $this->_right_brace,
      $this->_semicolon,
    );
  }

  public function hasClauses(): bool {
    return !$this->_clauses->isMissing();
  }

  /**
   * @return NodeList<ListItem<NamespaceUseClause>>
   */
  public function getClauses(): NodeList<ListItem<NamespaceUseClause>> {
    return TypeAssert\instance_of(NodeList::class, $this->_clauses);
  }

  /**
   * @return NodeList<ListItem<NamespaceUseClause>>
   */
  public function getClausesx(): NodeList<ListItem<NamespaceUseClause>> {
    return $this->getClauses();
  }

  public function getRightBraceUNTYPED(): Node {
    return $this->_right_brace;
  }

  public function withRightBrace(Node $value): this {
    if ($value === $this->_right_brace) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_kind,
      $this->_prefix,
      $this->_left_brace,
      $this->_clauses,
      $value,
      $this->_semicolon,
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

  public function getSemicolonUNTYPED(): Node {
    return $this->_semicolon;
  }

  public function withSemicolon(Node $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_kind,
      $this->_prefix,
      $this->_left_brace,
      $this->_clauses,
      $this->_right_brace,
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
