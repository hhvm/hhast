/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<bf5c257127fae152fd4dd5ceb3abbcbf>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class TryStatement extends Node implements IStatement {

  const string SYNTAX_KIND = 'try_statement';

  private TryToken $_keyword;
  private CompoundStatement $_compound_statement;
  private ?NodeList<CatchClause> $_catch_clauses;
  private ?FinallyClause $_finally_clause;

  public function __construct(
    TryToken $keyword,
    CompoundStatement $compound_statement,
    ?NodeList<CatchClause> $catch_clauses,
    ?FinallyClause $finally_clause,
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
    $keyword = $keyword as nonnull;
    $offset += $keyword->getWidth();
    $compound_statement = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['try_compound_statement'],
      $file,
      $offset,
      $source,
      'CompoundStatement',
    );
    $compound_statement = $compound_statement as nonnull;
    $offset += $compound_statement->getWidth();
    $catch_clauses = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['try_catch_clauses'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'NodeList<CatchClause>',
    );
    $offset += $catch_clauses?->getWidth() ?? 0;
    $finally_clause = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['try_finally_clause'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'FinallyClause',
    );
    $offset += $finally_clause?->getWidth() ?? 0;
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $keyword,
      /* HH_IGNORE_ERROR[4110] */ $compound_statement,
      /* HH_IGNORE_ERROR[4110] */ $catch_clauses,
      /* HH_IGNORE_ERROR[4110] */ $finally_clause,
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
    $compound_statement = $rewriter($this->_compound_statement, $parents);
    $catch_clauses = $this->_catch_clauses === null
      ? null
      : $rewriter($this->_catch_clauses, $parents);
    $finally_clause = $this->_finally_clause === null
      ? null
      : $rewriter($this->_finally_clause, $parents);
    if (
      $keyword === $this->_keyword &&
      $compound_statement === $this->_compound_statement &&
      $catch_clauses === $this->_catch_clauses &&
      $finally_clause === $this->_finally_clause
    ) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $keyword,
      /* HH_FIXME[4110] use `as` */ $compound_statement,
      /* HH_FIXME[4110] use `as` */ $catch_clauses,
      /* HH_FIXME[4110] use `as` */ $finally_clause,
    );
  }

  public function getKeywordUNTYPED(): ?Node {
    return $this->_keyword;
  }

  public function withKeyword(TryToken $value): this {
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
    return $this->_keyword !== null;
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

  public function getCompoundStatementUNTYPED(): ?Node {
    return $this->_compound_statement;
  }

  public function withCompoundStatement(CompoundStatement $value): this {
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
    return $this->_compound_statement !== null;
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

  public function getCatchClausesUNTYPED(): ?Node {
    return $this->_catch_clauses;
  }

  public function withCatchClauses(?NodeList<CatchClause> $value): this {
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
    return $this->_catch_clauses !== null;
  }

  /**
   * @return NodeList<CatchClause> | null
   */
  public function getCatchClauses(): ?NodeList<CatchClause> {
    return $this->_catch_clauses;
  }

  /**
   * @return NodeList<CatchClause>
   */
  public function getCatchClausesx(): NodeList<CatchClause> {
    return TypeAssert\not_null($this->getCatchClauses());
  }

  public function getFinallyClauseUNTYPED(): ?Node {
    return $this->_finally_clause;
  }

  public function withFinallyClause(?FinallyClause $value): this {
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
    return $this->_finally_clause !== null;
  }

  /**
   * @return FinallyClause | null
   */
  public function getFinallyClause(): ?FinallyClause {
    return $this->_finally_clause;
  }

  /**
   * @return FinallyClause
   */
  public function getFinallyClausex(): FinallyClause {
    return TypeAssert\not_null($this->getFinallyClause());
  }
}
