/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<a8535c01af2708d1dec6a6d0b966d5aa>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class TryStatement extends Node implements IStatement {

  const string SYNTAX_KIND = 'try_statement';

  private Node $_keyword;
  private Node $_compound_statement;
  private Node $_catch_clauses;
  private Node $_finally_clause;

  public function __construct(
    Node $keyword,
    Node $compound_statement,
    Node $catch_clauses,
    Node $finally_clause,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_keyword = $keyword;
    $this->_compound_statement = $compound_statement;
    $this->_catch_clauses = $catch_clauses;
    $this->_finally_clause = $finally_clause;
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
      /* HH_FIXME[4110] */ $json['try_keyword'],
      $file,
      $offset,
      $source,
      'TryToken',
    );
    $offset += $keyword->getWidth();
    $compound_statement = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['try_compound_statement'],
      $file,
      $offset,
      $source,
      'CompoundStatement',
    );
    $offset += $compound_statement->getWidth();
    $catch_clauses = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['try_catch_clauses'],
      $file,
      $offset,
      $source,
      'NodeList<CatchClause>',
    );
    $offset += $catch_clauses->getWidth();
    $finally_clause = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['try_finally_clause'],
      $file,
      $offset,
      $source,
      'FinallyClause',
    );
    $offset += $finally_clause->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      $keyword,
      $compound_statement,
      $catch_clauses,
      $finally_clause,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'keyword' => $this->_keyword,
      'compound_statement' => $this->_compound_statement,
      'catch_clauses' => $this->_catch_clauses,
      'finally_clause' => $this->_finally_clause,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $keyword = $rewriter($this->_keyword, $parents);
    $compound_statement = $rewriter($this->_compound_statement, $parents);
    $catch_clauses = $rewriter($this->_catch_clauses, $parents);
    $finally_clause = $rewriter($this->_finally_clause, $parents);
    if (
      $keyword === $this->_keyword &&
      $compound_statement === $this->_compound_statement &&
      $catch_clauses === $this->_catch_clauses &&
      $finally_clause === $this->_finally_clause
    ) {
      return $this;
    }
    return new static(
      $keyword,
      $compound_statement,
      $catch_clauses,
      $finally_clause,
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
      $this->_compound_statement,
      $this->_catch_clauses,
      $this->_finally_clause,
    );
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  /**
   * @return TryToken
   */
  public function getKeyword(): TryToken {
    return TypeAssert\instance_of(TryToken::class, $this->_keyword);
  }

  /**
   * @return TryToken
   */
  public function getKeywordx(): TryToken {
    return $this->getKeyword();
  }

  public function getCompoundStatementUNTYPED(): Node {
    return $this->_compound_statement;
  }

  public function withCompoundStatement(Node $value): this {
    if ($value === $this->_compound_statement) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $value,
      $this->_catch_clauses,
      $this->_finally_clause,
    );
  }

  public function hasCompoundStatement(): bool {
    return !$this->_compound_statement->isMissing();
  }

  /**
   * @return CompoundStatement
   */
  public function getCompoundStatement(): CompoundStatement {
    return TypeAssert\instance_of(
      CompoundStatement::class,
      $this->_compound_statement,
    );
  }

  /**
   * @return CompoundStatement
   */
  public function getCompoundStatementx(): CompoundStatement {
    return $this->getCompoundStatement();
  }

  public function getCatchClausesUNTYPED(): Node {
    return $this->_catch_clauses;
  }

  public function withCatchClauses(Node $value): this {
    if ($value === $this->_catch_clauses) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_compound_statement,
      $value,
      $this->_finally_clause,
    );
  }

  public function hasCatchClauses(): bool {
    return !$this->_catch_clauses->isMissing();
  }

  /**
   * @return NodeList<CatchClause> | null
   */
  public function getCatchClauses(): ?NodeList<CatchClause> {
    if ($this->_catch_clauses->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(NodeList::class, $this->_catch_clauses);
  }

  /**
   * @return NodeList<CatchClause>
   */
  public function getCatchClausesx(): NodeList<CatchClause> {
    return TypeAssert\not_null($this->getCatchClauses());
  }

  public function getFinallyClauseUNTYPED(): Node {
    return $this->_finally_clause;
  }

  public function withFinallyClause(Node $value): this {
    if ($value === $this->_finally_clause) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_compound_statement,
      $this->_catch_clauses,
      $value,
    );
  }

  public function hasFinallyClause(): bool {
    return !$this->_finally_clause->isMissing();
  }

  /**
   * @return FinallyClause | null
   */
  public function getFinallyClause(): ?FinallyClause {
    if ($this->_finally_clause->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(FinallyClause::class, $this->_finally_clause);
  }

  /**
   * @return FinallyClause
   */
  public function getFinallyClausex(): FinallyClause {
    return TypeAssert\not_null($this->getFinallyClause());
  }
}
