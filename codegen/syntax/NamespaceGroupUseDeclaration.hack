/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<beba2fea88caac60f30b653f0ea1cdf2>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;
/* HHAST_IGNORE_ALL[5607] 5607 is ignored because of false positives when comparing a generic to a typed value */
/* HHAST_IGNORE_ALL[5624] HHAST_IGNORE_ALL[5639] 5624 and 5639 are ignored because they insist on using co(tra)variant generics. Could this break external consumers? */

<<__ConsistentConstruct>>
final class NamespaceGroupUseDeclaration
  extends Node
  implements INamespaceUseDeclaration {

  const string SYNTAX_KIND = 'namespace_group_use_declaration';

  private UseToken $_keyword;
  private ?Token $_kind;
  private QualifiedName $_prefix;
  private LeftBraceToken $_left_brace;
  private NodeList<ListItem<NamespaceUseClause>> $_clauses;
  private RightBraceToken $_right_brace;
  private SemicolonToken $_semicolon;

  public function __construct(
    UseToken $keyword,
    ?Token $kind,
    QualifiedName $prefix,
    LeftBraceToken $left_brace,
    NodeList<ListItem<NamespaceUseClause>> $clauses,
    RightBraceToken $right_brace,
    SemicolonToken $semicolon,
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
    dict<arraykey, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
    string $_type_hint,
  ): this {
    $offset = $initial_offset;
    $keyword = Node::fromJSON(
      ($json['namespace_group_use_keyword']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'UseToken',
    );
    $keyword = $keyword as nonnull;
    $offset += $keyword->getWidth();
    $kind = Node::fromJSON(
      ($json['namespace_group_use_kind'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'Token',
    );
    $offset += $kind?->getWidth() ?? 0;
    $prefix = Node::fromJSON(
      ($json['namespace_group_use_prefix']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'QualifiedName',
    );
    $prefix = $prefix as nonnull;
    $offset += $prefix->getWidth();
    $left_brace = Node::fromJSON(
      ($json['namespace_group_use_left_brace']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'LeftBraceToken',
    );
    $left_brace = $left_brace as nonnull;
    $offset += $left_brace->getWidth();
    $clauses = Node::fromJSON(
      ($json['namespace_group_use_clauses']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'NodeList<ListItem<NamespaceUseClause>>',
    );
    $clauses = $clauses as nonnull;
    $offset += $clauses->getWidth();
    $right_brace = Node::fromJSON(
      ($json['namespace_group_use_right_brace']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'RightBraceToken',
    );
    $right_brace = $right_brace as nonnull;
    $offset += $right_brace->getWidth();
    $semicolon = Node::fromJSON(
      ($json['namespace_group_use_semicolon']) as dict<_, _>,
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
      /* HH_IGNORE_ERROR[4110] */ $prefix,
      /* HH_IGNORE_ERROR[4110] */ $left_brace,
      /* HH_IGNORE_ERROR[4110] */ $clauses,
      /* HH_IGNORE_ERROR[4110] */ $right_brace,
      /* HH_IGNORE_ERROR[4110] */ $semicolon,
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
      $keyword as UseToken,
      $kind as ?Token,
      $prefix as QualifiedName,
      $left_brace as LeftBraceToken,
      /* HH_FIXME[4110] NodeList<ListItem<NamespaceUseClause>> may not be enforceable */ $clauses,
      $right_brace as RightBraceToken,
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
      $this->_prefix,
      $this->_left_brace,
      $this->_clauses,
      $this->_right_brace,
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

  public function getPrefixUNTYPED(): ?Node {
    return $this->_prefix;
  }

  public function withPrefix(QualifiedName $value): this {
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
    return true;
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

  public function getLeftBraceUNTYPED(): ?Node {
    return $this->_left_brace;
  }

  public function withLeftBrace(LeftBraceToken $value): this {
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
    return true;
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

  public function getClausesUNTYPED(): ?Node {
    return $this->_clauses;
  }

  public function withClauses(
    NodeList<ListItem<NamespaceUseClause>> $value,
  ): this {
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
    return true;
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

  public function getRightBraceUNTYPED(): ?Node {
    return $this->_right_brace;
  }

  public function withRightBrace(RightBraceToken $value): this {
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
    return true;
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

  public function getSemicolonUNTYPED(): ?Node {
    return $this->_semicolon;
  }

  public function withSemicolon(SemicolonToken $value): this {
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
