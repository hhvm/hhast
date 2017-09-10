<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<5bdbf4000781d18a3c4a640452a34647>>
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
    $position += $keyword->width();
    $left_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['if_left_paren'],
      $position,
      $source,
    );
    $position += $left_paren->width();
    $condition = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['if_condition'],
      $position,
      $source,
    );
    $position += $condition->width();
    $right_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['if_right_paren'],
      $position,
      $source,
    );
    $position += $right_paren->width();
    $statement = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['if_statement'],
      $position,
      $source,
    );
    $position += $statement->width();
    $elseif_clauses = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['if_elseif_clauses'],
      $position,
      $source,
    );
    $position += $elseif_clauses->width();
    $else_clause = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['if_else_clause'],
      $position,
      $source,
    );
    $position += $else_clause->width();
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

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'left_paren' => $this->_left_paren;
    yield 'condition' => $this->_condition;
    yield 'right_paren' => $this->_right_paren;
    yield 'statement' => $this->_statement;
    yield 'elseif_clauses' => $this->_elseif_clauses;
    yield 'else_clause' => $this->_else_clause;
  }

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

  public function keyword(): IfToken {
    return $this->keywordx();
  }

  public function keywordx(): IfToken {
    return TypeAssert::isInstanceOf(IfToken::class, $this->_keyword);
  }

  public function raw_keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
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

  public function left_paren(): LeftParenToken {
    return $this->left_parenx();
  }

  public function left_parenx(): LeftParenToken {
    return TypeAssert::isInstanceOf(LeftParenToken::class, $this->_left_paren);
  }

  public function raw_left_paren(): EditableSyntax {
    return $this->_left_paren;
  }

  public function with_left_paren(EditableSyntax $value): this {
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

  public function condition(): EditableSyntax {
    return $this->conditionx();
  }

  public function conditionx(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_condition);
  }

  public function raw_condition(): EditableSyntax {
    return $this->_condition;
  }

  public function with_condition(EditableSyntax $value): this {
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

  public function right_paren(): ?RightParenToken {
    return $this->_right_paren->is_missing() ? null : TypeAssert::isInstanceOf(RightParenToken::class, $this->_right_paren);
  }

  public function right_parenx(): RightParenToken {
    return TypeAssert::isInstanceOf(RightParenToken::class, $this->_right_paren);
  }

  public function raw_right_paren(): EditableSyntax {
    return $this->_right_paren;
  }

  public function with_right_paren(EditableSyntax $value): this {
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

  public function statement(): EditableSyntax {
    return $this->statementx();
  }

  public function statementx(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_statement);
  }

  public function raw_statement(): EditableSyntax {
    return $this->_statement;
  }

  public function with_statement(EditableSyntax $value): this {
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

  public function elseif_clauses(): ?EditableList {
    return $this->_elseif_clauses->is_missing() ? null : TypeAssert::isInstanceOf(EditableList::class, $this->_elseif_clauses);
  }

  public function elseif_clausesx(): EditableList {
    return TypeAssert::isInstanceOf(EditableList::class, $this->_elseif_clauses);
  }

  public function raw_elseif_clauses(): EditableSyntax {
    return $this->_elseif_clauses;
  }

  public function with_elseif_clauses(EditableSyntax $value): this {
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

  public function else_clause(): ?ElseClause {
    return $this->_else_clause->is_missing() ? null : TypeAssert::isInstanceOf(ElseClause::class, $this->_else_clause);
  }

  public function else_clausex(): ElseClause {
    return TypeAssert::isInstanceOf(ElseClause::class, $this->_else_clause);
  }

  public function raw_else_clause(): EditableSyntax {
    return $this->_else_clause;
  }

  public function with_else_clause(EditableSyntax $value): this {
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
}
