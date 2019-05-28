/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<eb8eff8ae7c3a168172fc427701e85c2>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class TryStatement extends EditableNode implements IStatement {

  const string SYNTAX_KIND = 'try_statement';

  private EditableNode $_keyword;
  private EditableNode $_compound_statement;
  private EditableNode $_catch_clauses;
  private EditableNode $_finally_clause;

  public function __construct(
    EditableNode $keyword,
    EditableNode $compound_statement,
    EditableNode $catch_clauses,
    EditableNode $finally_clause,
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
  ): this {
    $offset = $initial_offset;
    $keyword = EditableNode::fromJSON(
      /* HH_FIXME[4110] */ $json['try_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $keyword->getWidth();
    $compound_statement = EditableNode::fromJSON(
      /* HH_FIXME[4110] */ $json['try_compound_statement'],
      $file,
      $offset,
      $source,
    );
    $offset += $compound_statement->getWidth();
    $catch_clauses = EditableNode::fromJSON(
      /* HH_FIXME[4110] */ $json['try_catch_clauses'],
      $file,
      $offset,
      $source,
    );
    $offset += $catch_clauses->getWidth();
    $finally_clause = EditableNode::fromJSON(
      /* HH_FIXME[4110] */ $json['try_finally_clause'],
      $file,
      $offset,
      $source,
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
  public function getChildren(): dict<string, EditableNode> {
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
    vec<EditableNode> $parents = vec[],
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

  public function getKeywordUNTYPED(): EditableNode {
    return $this->_keyword;
  }

  public function withKeyword(EditableNode $value): this {
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

  public function getCompoundStatementUNTYPED(): EditableNode {
    return $this->_compound_statement;
  }

  public function withCompoundStatement(EditableNode $value): this {
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

  public function getCatchClausesUNTYPED(): EditableNode {
    return $this->_catch_clauses;
  }

  public function withCatchClauses(EditableNode $value): this {
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
   * @return EditableList<EditableNode> | null
   */
  public function getCatchClauses(): ?EditableList<EditableNode> {
    if ($this->_catch_clauses->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableList::class, $this->_catch_clauses);
  }

  /**
   * @return EditableList<EditableNode>
   */
  public function getCatchClausesx(): EditableList<EditableNode> {
    return TypeAssert\not_null($this->getCatchClauses());
  }

  public function getFinallyClauseUNTYPED(): EditableNode {
    return $this->_finally_clause;
  }

  public function withFinallyClause(EditableNode $value): this {
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
