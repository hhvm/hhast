<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<594505c931e91876bc342d7d2d6366c5>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class TryStatement extends EditableNode {

  private EditableNode $_keyword;
  private EditableNode $_compound_statement;
  private EditableNode $_catch_clauses;
  private EditableNode $_finally_clause;

  public function __construct(
    EditableNode $keyword,
    EditableNode $compound_statement,
    EditableNode $catch_clauses,
    EditableNode $finally_clause,
  ) {
    parent::__construct('try_statement');
    $this->_keyword = $keyword;
    $this->_compound_statement = $compound_statement;
    $this->_catch_clauses = $catch_clauses;
    $this->_finally_clause = $finally_clause;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
  ): this {
    $keyword = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['try_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $keyword->getWidth();
    $compound_statement = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['try_compound_statement'],
      $file,
      $offset,
      $source,
    );
    $offset += $compound_statement->getWidth();
    $catch_clauses = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['try_catch_clauses'],
      $file,
      $offset,
      $source,
    );
    $offset += $catch_clauses->getWidth();
    $finally_clause = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['try_finally_clause'],
      $file,
      $offset,
      $source,
    );
    $offset += $finally_clause->getWidth();
    return new static(
      $keyword,
      $compound_statement,
      $catch_clauses,
      $finally_clause,
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
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?vec<EditableNode> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $parents);
    $compound_statement =
      $this->_compound_statement->rewrite($rewriter, $parents);
    $catch_clauses = $this->_catch_clauses->rewrite($rewriter, $parents);
    $finally_clause = $this->_finally_clause->rewrite($rewriter, $parents);
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
   * @returns TryToken
   */
  public function getKeyword(): TryToken {
    return TypeAssert\instance_of(TryToken::class, $this->_keyword);
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
   * @returns CompoundStatement
   */
  public function getCompoundStatement(): CompoundStatement {
    return TypeAssert\instance_of(
      CompoundStatement::class,
      $this->_compound_statement,
    );
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
   * @returns EditableList | Missing
   */
  public function getCatchClauses(): ?EditableList {
    if ($this->_catch_clauses->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableList::class, $this->_catch_clauses);
  }

  /**
   * @returns EditableList
   */
  public function getCatchClausesx(): EditableList {
    return TypeAssert\instance_of(EditableList::class, $this->_catch_clauses);
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
   * @returns Missing | FinallyClause
   */
  public function getFinallyClause(): ?FinallyClause {
    if ($this->_finally_clause->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(FinallyClause::class, $this->_finally_clause);
  }

  /**
   * @returns FinallyClause
   */
  public function getFinallyClausex(): FinallyClause {
    return TypeAssert\instance_of(FinallyClause::class, $this->_finally_clause);
  }
}
