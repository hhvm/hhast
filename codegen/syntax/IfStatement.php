<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<bedbac0fad7b151d71ea25ebdb5e4bfc>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class IfStatement extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_left_paren;
  private EditableSyntax $_condition;
  private EditableSyntax $_right_paren;
  private EditableSyntax $_statement;
  private EditableSyntax $_elseif_clauses;
  private EditableSyntax $_else_clause;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $left_paren,
    EditableSyntax $condition,
    EditableSyntax $right_paren,
    EditableSyntax $statement,
    EditableSyntax $elseif_clauses,
    EditableSyntax $else_clause,
  ) {
    parent::__construct('if_statement');
    $this->_keyword = $keyword;
    $this->_left_paren = $left_paren;
    $this->_condition = $condition;
    $this->_right_paren = $right_paren;
    $this->_statement = $statement;
    $this->_elseif_clauses = $elseif_clauses;
    $this->_else_clause = $else_clause;
  }

  <<__Override>>
  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['if_keyword'],
      $position,
      $source,
    );
    $position += $keyword->getWidth();
    $left_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['if_left_paren'],
      $position,
      $source,
    );
    $position += $left_paren->getWidth();
    $condition = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['if_condition'],
      $position,
      $source,
    );
    $position += $condition->getWidth();
    $right_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['if_right_paren'],
      $position,
      $source,
    );
    $position += $right_paren->getWidth();
    $statement = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['if_statement'],
      $position,
      $source,
    );
    $position += $statement->getWidth();
    $elseif_clauses = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['if_elseif_clauses'],
      $position,
      $source,
    );
    $position += $elseif_clauses->getWidth();
    $else_clause = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['if_else_clause'],
      $position,
      $source,
    );
    $position += $else_clause->getWidth();
    return new self(
      $keyword,
      $left_paren,
      $condition,
      $right_paren,
      $statement,
      $elseif_clauses,
      $else_clause,
    );
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'left_paren' => $this->_left_paren;
    yield 'condition' => $this->_condition;
    yield 'right_paren' => $this->_right_paren;
    yield 'statement' => $this->_statement;
    yield 'elseif_clauses' => $this->_elseif_clauses;
    yield 'else_clause' => $this->_else_clause;
  }

  <<__Override>>
  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $parents);
    $left_paren = $this->_left_paren->rewrite($rewriter, $parents);
    $condition = $this->_condition->rewrite($rewriter, $parents);
    $right_paren = $this->_right_paren->rewrite($rewriter, $parents);
    $statement = $this->_statement->rewrite($rewriter, $parents);
    $elseif_clauses = $this->_elseif_clauses->rewrite($rewriter, $parents);
    $else_clause = $this->_else_clause->rewrite($rewriter, $parents);
    if (
      $keyword === $this->_keyword &&
      $left_paren === $this->_left_paren &&
      $condition === $this->_condition &&
      $right_paren === $this->_right_paren &&
      $statement === $this->_statement &&
      $elseif_clauses === $this->_elseif_clauses &&
      $else_clause === $this->_else_clause
    ) {
      return $this;
    }
    return new self(
      $keyword,
      $left_paren,
      $condition,
      $right_paren,
      $statement,
      $elseif_clauses,
      $else_clause,
    );
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
      $this->_left_paren,
      $this->_condition,
      $this->_right_paren,
      $this->_statement,
      $this->_elseif_clauses,
      $this->_else_clause,
    );
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  public function getKeyword(): IfToken {
    return TypeAssert::isInstanceOf(IfToken::class, $this->_keyword);
  }

  public function getLeftParenUNTYPED(): EditableSyntax {
    return $this->_left_paren;
  }

  public function withLeftParen(EditableSyntax $value): this {
    if ($value === $this->_left_paren) {
      return $this;
    }
    return new self(
      $this->_keyword,
      $value,
      $this->_condition,
      $this->_right_paren,
      $this->_statement,
      $this->_elseif_clauses,
      $this->_else_clause,
    );
  }

  public function hasLeftParen(): bool {
    return !$this->_left_paren->isMissing();
  }

  public function getLeftParen(): LeftParenToken {
    return TypeAssert::isInstanceOf(LeftParenToken::class, $this->_left_paren);
  }

  public function getConditionUNTYPED(): EditableSyntax {
    return $this->_condition;
  }

  public function withCondition(EditableSyntax $value): this {
    if ($value === $this->_condition) {
      return $this;
    }
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $value,
      $this->_right_paren,
      $this->_statement,
      $this->_elseif_clauses,
      $this->_else_clause,
    );
  }

  public function hasCondition(): bool {
    return !$this->_condition->isMissing();
  }

  public function getCondition(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_condition);
  }

  public function getRightParenUNTYPED(): EditableSyntax {
    return $this->_right_paren;
  }

  public function withRightParen(EditableSyntax $value): this {
    if ($value === $this->_right_paren) {
      return $this;
    }
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $this->_condition,
      $value,
      $this->_statement,
      $this->_elseif_clauses,
      $this->_else_clause,
    );
  }

  public function hasRightParen(): bool {
    return !$this->_right_paren->isMissing();
  }

  public function getRightParen(): ?RightParenToken {
    if ($this->_right_paren->isMissing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(RightParenToken::class, $this->_right_paren);
  }

  public function getRightParenx(): RightParenToken {
    return TypeAssert::isInstanceOf(RightParenToken::class, $this->_right_paren);
  }

  public function getStatementUNTYPED(): EditableSyntax {
    return $this->_statement;
  }

  public function withStatement(EditableSyntax $value): this {
    if ($value === $this->_statement) {
      return $this;
    }
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $this->_condition,
      $this->_right_paren,
      $value,
      $this->_elseif_clauses,
      $this->_else_clause,
    );
  }

  public function hasStatement(): bool {
    return !$this->_statement->isMissing();
  }

  public function getStatement(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_statement);
  }

  public function getElseifClausesUNTYPED(): EditableSyntax {
    return $this->_elseif_clauses;
  }

  public function withElseifClauses(EditableSyntax $value): this {
    if ($value === $this->_elseif_clauses) {
      return $this;
    }
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $this->_condition,
      $this->_right_paren,
      $this->_statement,
      $value,
      $this->_else_clause,
    );
  }

  public function hasElseifClauses(): bool {
    return !$this->_elseif_clauses->isMissing();
  }

  public function getElseifClauses(): ?EditableList {
    if ($this->_elseif_clauses->isMissing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(EditableList::class, $this->_elseif_clauses);
  }

  public function getElseifClausesx(): EditableList {
    return TypeAssert::isInstanceOf(EditableList::class, $this->_elseif_clauses);
  }

  public function getElseClauseUNTYPED(): EditableSyntax {
    return $this->_else_clause;
  }

  public function withElseClause(EditableSyntax $value): this {
    if ($value === $this->_else_clause) {
      return $this;
    }
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $this->_condition,
      $this->_right_paren,
      $this->_statement,
      $this->_elseif_clauses,
      $value,
    );
  }

  public function hasElseClause(): bool {
    return !$this->_else_clause->isMissing();
  }

  public function getElseClause(): ?ElseClause {
    if ($this->_else_clause->isMissing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(ElseClause::class, $this->_else_clause);
  }

  public function getElseClausex(): ElseClause {
    return TypeAssert::isInstanceOf(ElseClause::class, $this->_else_clause);
  }
}
