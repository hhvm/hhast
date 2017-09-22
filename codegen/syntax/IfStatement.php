<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<43c560d8459498077f3118ef8bba2db1>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class IfStatement extends EditableNode implements IControlFlowStatement {

  private EditableNode $_keyword;
  private EditableNode $_left_paren;
  private EditableNode $_condition;
  private EditableNode $_right_paren;
  private EditableNode $_statement;
  private EditableNode $_elseif_clauses;
  private EditableNode $_else_clause;

  public function __construct(
    EditableNode $keyword,
    EditableNode $left_paren,
    EditableNode $condition,
    EditableNode $right_paren,
    EditableNode $statement,
    EditableNode $elseif_clauses,
    EditableNode $else_clause,
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
  public static function fromJSON(
    dict<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['if_keyword'],
      $position,
      $source,
    );
    $position += $keyword->getWidth();
    $left_paren = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['if_left_paren'],
      $position,
      $source,
    );
    $position += $left_paren->getWidth();
    $condition = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['if_condition'],
      $position,
      $source,
    );
    $position += $condition->getWidth();
    $right_paren = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['if_right_paren'],
      $position,
      $source,
    );
    $position += $right_paren->getWidth();
    $statement = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['if_statement'],
      $position,
      $source,
    );
    $position += $statement->getWidth();
    $elseif_clauses = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['if_elseif_clauses'],
      $position,
      $source,
    );
    $position += $elseif_clauses->getWidth();
    $else_clause = EditableNode::fromJSON(
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
  public function getChildren(): KeyedTraversable<string, EditableNode> {
    return dict[
      'keyword' => $this->_keyword,
      'left_paren' => $this->_left_paren,
      'condition' => $this->_condition,
      'right_paren' => $this->_right_paren,
      'statement' => $this->_statement,
      'elseif_clauses' => $this->_elseif_clauses,
      'else_clause' => $this->_else_clause,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?Traversable<EditableNode> $parents = null,
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

  public function getKeywordUNTYPED(): EditableNode {
    return $this->_keyword;
  }

  public function withKeyword(EditableNode $value): this {
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

  /**
   * @returns IfToken
   */
  public function getKeyword(): IfToken {
    return TypeAssert\instance_of(IfToken::class, $this->_keyword);
  }

  public function getLeftParenUNTYPED(): EditableNode {
    return $this->_left_paren;
  }

  public function withLeftParen(EditableNode $value): this {
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

  /**
   * @returns LeftParenToken
   */
  public function getLeftParen(): LeftParenToken {
    return TypeAssert\instance_of(LeftParenToken::class, $this->_left_paren);
  }

  public function getConditionUNTYPED(): EditableNode {
    return $this->_condition;
  }

  public function withCondition(EditableNode $value): this {
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

  /**
   * @returns BinaryExpression | FunctionCallExpression | PrefixUnaryExpression
   * | LiteralExpression | SubscriptExpression | IssetExpression |
   * VariableExpression | ArrayIntrinsicExpression | InstanceofExpression |
   * QualifiedNameExpression | CastExpression | MemberSelectionExpression |
   * ParenthesizedExpression | EmptyExpression | ScopeResolutionExpression
   */
  public function getCondition(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_condition);
  }

  public function getRightParenUNTYPED(): EditableNode {
    return $this->_right_paren;
  }

  public function withRightParen(EditableNode $value): this {
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

  /**
   * @returns RightParenToken | Missing
   */
  public function getRightParen(): ?RightParenToken {
    if ($this->_right_paren->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(RightParenToken::class, $this->_right_paren);
  }

  /**
   * @returns RightParenToken
   */
  public function getRightParenx(): RightParenToken {
    return TypeAssert\instance_of(RightParenToken::class, $this->_right_paren);
  }

  public function getStatementUNTYPED(): EditableNode {
    return $this->_statement;
  }

  public function withStatement(EditableNode $value): this {
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

  /**
   * @returns CompoundStatement | ExpressionStatement | EchoStatement |
   * ThrowStatement | ReturnStatement | BreakStatement | UnsetStatement |
   * GotoStatement | ContinueStatement | GlobalStatement
   */
  public function getStatement(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_statement);
  }

  public function getElseifClausesUNTYPED(): EditableNode {
    return $this->_elseif_clauses;
  }

  public function withElseifClauses(EditableNode $value): this {
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

  /**
   * @returns Missing | EditableList
   */
  public function getElseifClauses(): ?EditableList {
    if ($this->_elseif_clauses->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableList::class, $this->_elseif_clauses);
  }

  /**
   * @returns EditableList
   */
  public function getElseifClausesx(): EditableList {
    return TypeAssert\instance_of(EditableList::class, $this->_elseif_clauses);
  }

  public function getElseClauseUNTYPED(): EditableNode {
    return $this->_else_clause;
  }

  public function withElseClause(EditableNode $value): this {
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

  /**
   * @returns ElseClause | Missing
   */
  public function getElseClause(): ?ElseClause {
    if ($this->_else_clause->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(ElseClause::class, $this->_else_clause);
  }

  /**
   * @returns ElseClause
   */
  public function getElseClausex(): ElseClause {
    return TypeAssert\instance_of(ElseClause::class, $this->_else_clause);
  }
}
