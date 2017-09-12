<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<446e34968502c202b1da0515acf3aafc>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class TryStatement extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_compound_statement;
  private EditableSyntax $_catch_clauses;
  private EditableSyntax $_finally_clause;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $compound_statement,
    EditableSyntax $catch_clauses,
    EditableSyntax $finally_clause,
  ) {
    parent::__construct('try_statement');
    $this->_keyword = $keyword;
    $this->_compound_statement = $compound_statement;
    $this->_catch_clauses = $catch_clauses;
    $this->_finally_clause = $finally_clause;
  }

  <<__Override>>
  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['try_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $compound_statement = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['try_compound_statement'],
      $position,
      $source,
    );
    $position += $compound_statement->width();
    $catch_clauses = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['try_catch_clauses'],
      $position,
      $source,
    );
    $position += $catch_clauses->width();
    $finally_clause = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['try_finally_clause'],
      $position,
      $source,
    );
    $position += $finally_clause->width();
    return new self(
      $keyword,
      $compound_statement,
      $catch_clauses,
      $finally_clause,
    );
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'compound_statement' => $this->_compound_statement;
    yield 'catch_clauses' => $this->_catch_clauses;
    yield 'finally_clause' => $this->_finally_clause;
  }

  <<__Override>>
  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $parents);
    $compound_statement = $this->_compound_statement->rewrite($rewriter, $parents);
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
    return new self($keyword, $compound_statement, $catch_clauses, $finally_clause);
  }

  public function getKeywordUNTYPED(): EditableSyntax {
    return $this->_keyword;
  }

  public function withKeyword(EditableSyntax $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new self(
      $value,
      $this->_compound_statement,
      $this->_catch_clauses,
      $this->_finally_clause,
    );
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->is_missing();
  }

  public function getKeyword(): TryToken {
    return TypeAssert::isInstanceOf(TryToken::class, $this->_keyword);
  }

  public function getCompoundStatementUNTYPED(): EditableSyntax {
    return $this->_compound_statement;
  }

  public function withCompoundStatement(EditableSyntax $value): this {
    if ($value === $this->_compound_statement) {
      return $this;
    }
    return new self(
      $this->_keyword,
      $value,
      $this->_catch_clauses,
      $this->_finally_clause,
    );
  }

  public function hasCompoundStatement(): bool {
    return !$this->_compound_statement->is_missing();
  }

  public function getCompoundStatement(): CompoundStatement {
    return TypeAssert::isInstanceOf(CompoundStatement::class, $this->_compound_statement);
  }

  public function getCatchClausesUNTYPED(): EditableSyntax {
    return $this->_catch_clauses;
  }

  public function withCatchClauses(EditableSyntax $value): this {
    if ($value === $this->_catch_clauses) {
      return $this;
    }
    return new self(
      $this->_keyword,
      $this->_compound_statement,
      $value,
      $this->_finally_clause,
    );
  }

  public function hasCatchClauses(): bool {
    return !$this->_catch_clauses->is_missing();
  }

  public function getCatchClauses(): ?EditableList {
    if ($this->_catch_clauses->is_missing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(EditableList::class, $this->_catch_clauses);
  }

  public function getCatchClausesx(): EditableList {
    return TypeAssert::isInstanceOf(EditableList::class, $this->_catch_clauses);
  }

  public function getFinallyClauseUNTYPED(): EditableSyntax {
    return $this->_finally_clause;
  }

  public function withFinallyClause(EditableSyntax $value): this {
    if ($value === $this->_finally_clause) {
      return $this;
    }
    return new self(
      $this->_keyword,
      $this->_compound_statement,
      $this->_catch_clauses,
      $value,
    );
  }

  public function hasFinallyClause(): bool {
    return !$this->_finally_clause->is_missing();
  }

  public function getFinallyClause(): ?FinallyClause {
    if ($this->_finally_clause->is_missing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(FinallyClause::class, $this->_finally_clause);
  }

  public function getFinallyClausex(): FinallyClause {
    return TypeAssert::isInstanceOf(FinallyClause::class, $this->_finally_clause);
  }
}
