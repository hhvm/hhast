<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<8e02bc05733b2c5ababe0a7c39475b5e>>
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

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'compound_statement' => $this->_compound_statement;
    yield 'catch_clauses' => $this->_catch_clauses;
    yield 'finally_clause' => $this->_finally_clause;
  }

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

  public function keyword(): TryToken {
    return $this->keywordx();
  }

  public function keywordx(): TryToken {
    return TypeAssert::isInstanceOf(TryToken::class, $this->_keyword);
  }

  public function raw_keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
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

  public function compound_statement(): CompoundStatement {
    return $this->compound_statementx();
  }

  public function compound_statementx(): CompoundStatement {
    return TypeAssert::isInstanceOf(CompoundStatement::class, $this->_compound_statement);
  }

  public function raw_compound_statement(): EditableSyntax {
    return $this->_compound_statement;
  }

  public function with_compound_statement(EditableSyntax $value): this {
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

  public function catch_clauses(): ?EditableList {
    return $this->_catch_clauses->is_missing() ? null : TypeAssert::isInstanceOf(EditableList::class, $this->_catch_clauses);
  }

  public function catch_clausesx(): EditableList {
    return TypeAssert::isInstanceOf(EditableList::class, $this->_catch_clauses);
  }

  public function raw_catch_clauses(): EditableSyntax {
    return $this->_catch_clauses;
  }

  public function with_catch_clauses(EditableSyntax $value): this {
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

  public function finally_clause(): ?FinallyClause {
    return $this->_finally_clause->is_missing() ? null : TypeAssert::isInstanceOf(FinallyClause::class, $this->_finally_clause);
  }

  public function finally_clausex(): FinallyClause {
    return TypeAssert::isInstanceOf(FinallyClause::class, $this->_finally_clause);
  }

  public function raw_finally_clause(): EditableSyntax {
    return $this->_finally_clause;
  }

  public function with_finally_clause(EditableSyntax $value): this {
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
}
