/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<697a7ca6d7a52e8680b21efa76c30adb>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class NamespaceUseDeclaration
  extends Node
  implements INamespaceUseDeclaration {

  const string SYNTAX_KIND = 'namespace_use_declaration';

  private UseToken $_keyword;
  private ?Token $_kind;
  private NodeList<ListItem<NamespaceUseClause>> $_clauses;
  private SemicolonToken $_semicolon;

  public function __construct(
    UseToken $keyword,
    ?Token $kind,
    NodeList<ListItem<NamespaceUseClause>> $clauses,
    SemicolonToken $semicolon,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_keyword = $keyword;
    $this->_kind = $kind;
    $this->_clauses = $clauses;
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
      /* HH_FIXME[4110] */ $json['namespace_use_keyword'],
      $file,
      $offset,
      $source,
      'UseToken',
    );
    $keyword = $keyword as nonnull;
    $offset += $keyword->getWidth();
    $kind = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['namespace_use_kind'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Token',
    );
    $offset += $kind?->getWidth() ?? 0;
    $clauses = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['namespace_use_clauses'],
      $file,
      $offset,
      $source,
      'NodeList<ListItem<NamespaceUseClause>>',
    );
    $clauses = $clauses as nonnull;
    $offset += $clauses->getWidth();
    $semicolon = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['namespace_use_semicolon'],
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
      /* HH_IGNORE_ERROR[4110] */ $kind,
      /* HH_IGNORE_ERROR[4110] */ $clauses,
      /* HH_IGNORE_ERROR[4110] */ $semicolon,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'keyword' => $this->_keyword,
      'kind' => $this->_kind,
      'clauses' => $this->_clauses,
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
    $kind = $this->_kind === null ? null : $rewriter($this->_kind, $parents);
    $clauses = $rewriter($this->_clauses, $parents);
    $semicolon = $rewriter($this->_semicolon, $parents);
    if (
      $keyword === $this->_keyword &&
      $kind === $this->_kind &&
      $clauses === $this->_clauses &&
      $semicolon === $this->_semicolon
    ) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $keyword,
      /* HH_FIXME[4110] use `as` */ $kind,
      /* HH_FIXME[4110] use `as` */ $clauses,
      /* HH_FIXME[4110] use `as` */ $semicolon,
    );
  }

  public function getKeywordUNTYPED(): ?Node {
    return $this->_keyword;
  }

  public function withKeyword(UseToken $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static($value, $this->_kind, $this->_clauses, $this->_semicolon);
  }

  public function hasKeyword(): bool {
    return $this->_keyword !== null;
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

  public function getKindUNTYPED(): ?Node {
    return $this->_kind;
  }

  public function withKind(?Token $value): this {
    if ($value === $this->_kind) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $value,
      $this->_clauses,
      $this->_semicolon,
    );
  }

  public function hasKind(): bool {
    return $this->_kind !== null;
  }

  /**
   * @return null | ConstToken | FunctionToken | NamespaceToken | TypeToken
   */
  public function getKind(): ?Token {
    return $this->_kind;
  }

  /**
   * @return ConstToken | FunctionToken | NamespaceToken | TypeToken
   */
  public function getKindx(): Token {
    return TypeAssert\not_null($this->getKind());
  }

  public function getClausesUNTYPED(): ?Node {
    return $this->_clauses;
  }

  public function withClauses(
    NodeList<ListItem<NamespaceUseClause>> $value,
  ): this {
    if ($value === $this->_clauses) {
      return $this;
    }
    return new static($this->_keyword, $this->_kind, $value, $this->_semicolon);
  }

  public function hasClauses(): bool {
    return $this->_clauses !== null;
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

  public function getSemicolonUNTYPED(): ?Node {
    return $this->_semicolon;
  }

  public function withSemicolon(SemicolonToken $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new static($this->_keyword, $this->_kind, $this->_clauses, $value);
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
