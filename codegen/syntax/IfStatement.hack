/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<37e1848f69eb5eafc31ba6f71c470a21>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class IfStatement
  extends Node
  implements IControlFlowStatement, IStatement {

  const string SYNTAX_KIND = 'if_statement';

  private Node $_keyword;
  private Node $_left_paren;
  private Node $_condition;
  private Node $_right_paren;
  private Node $_statement;
  private Node $_elseif_clauses;
  private Node $_else_clause;

  public function __construct(
    Node $keyword,
    Node $left_paren,
    Node $condition,
    Node $right_paren,
    Node $statement,
    Node $elseif_clauses,
    Node $else_clause,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_keyword = $keyword;
    $this->_left_paren = $left_paren;
    $this->_condition = $condition;
    $this->_right_paren = $right_paren;
    $this->_statement = $statement;
    $this->_elseif_clauses = $elseif_clauses;
    $this->_else_clause = $else_clause;
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
    $keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['if_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $keyword->getWidth();
    $left_paren = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['if_left_paren'],
      $file,
      $offset,
      $source,
    );
    $offset += $left_paren->getWidth();
    $condition = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['if_condition'],
      $file,
      $offset,
      $source,
    );
    $offset += $condition->getWidth();
    $right_paren = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['if_right_paren'],
      $file,
      $offset,
      $source,
    );
    $offset += $right_paren->getWidth();
    $statement = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['if_statement'],
      $file,
      $offset,
      $source,
    );
    $offset += $statement->getWidth();
    $elseif_clauses = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['if_elseif_clauses'],
      $file,
      $offset,
      $source,
    );
    $offset += $elseif_clauses->getWidth();
    $else_clause = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['if_else_clause'],
      $file,
      $offset,
      $source,
    );
    $offset += $else_clause->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      $keyword,
      $left_paren,
      $condition,
      $right_paren,
      $statement,
      $elseif_clauses,
      $else_clause,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
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
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $keyword = $rewriter($this->_keyword, $parents);
    $left_paren = $rewriter($this->_left_paren, $parents);
    $condition = $rewriter($this->_condition, $parents);
    $right_paren = $rewriter($this->_right_paren, $parents);
    $statement = $rewriter($this->_statement, $parents);
    $elseif_clauses = $rewriter($this->_elseif_clauses, $parents);
    $else_clause = $rewriter($this->_else_clause, $parents);
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
    return new static(
      $keyword,
      $left_paren,
      $condition,
      $right_paren,
      $statement,
      $elseif_clauses,
      $else_clause,
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
   * @return IfToken
   */
  public function getKeyword(): IfToken {
    return TypeAssert\instance_of(IfToken::class, $this->_keyword);
  }

  /**
   * @return IfToken
   */
  public function getKeywordx(): IfToken {
    return $this->getKeyword();
  }

  public function getLeftParenUNTYPED(): Node {
    return $this->_left_paren;
  }

  public function withLeftParen(Node $value): this {
    if ($value === $this->_left_paren) {
      return $this;
    }
    return new static(
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
   * @return LeftParenToken
   */
  public function getLeftParen(): LeftParenToken {
    return TypeAssert\instance_of(LeftParenToken::class, $this->_left_paren);
  }

  /**
   * @return LeftParenToken
   */
  public function getLeftParenx(): LeftParenToken {
    return $this->getLeftParen();
  }

  public function getConditionUNTYPED(): Node {
    return $this->_condition;
  }

  public function withCondition(Node $value): this {
    if ($value === $this->_condition) {
      return $this;
    }
    return new static(
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
   * @return ArrayIntrinsicExpression | AsExpression | BinaryExpression |
   * CastExpression | FunctionCallExpression | InstanceofExpression |
   * IsExpression | IssetExpression | LiteralExpression |
   * MemberSelectionExpression | ParenthesizedExpression |
   * PrefixUnaryExpression | QualifiedName | ScopeResolutionExpression |
   * SubscriptExpression | NameToken | VariableExpression
   */
  <<__Memoize>>
  public function getCondition(): IExpression {
    return __Private\Wrap\wrap_IExpression($this->_condition);
  }

  /**
   * @return ArrayIntrinsicExpression | AsExpression | BinaryExpression |
   * CastExpression | FunctionCallExpression | InstanceofExpression |
   * IsExpression | IssetExpression | LiteralExpression |
   * MemberSelectionExpression | ParenthesizedExpression |
   * PrefixUnaryExpression | QualifiedName | ScopeResolutionExpression |
   * SubscriptExpression | NameToken | VariableExpression
   */
  public function getConditionx(): IExpression {
    return $this->getCondition();
  }

  public function getRightParenUNTYPED(): Node {
    return $this->_right_paren;
  }

  public function withRightParen(Node $value): this {
    if ($value === $this->_right_paren) {
      return $this;
    }
    return new static(
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
   * @return RightParenToken
   */
  public function getRightParen(): RightParenToken {
    return TypeAssert\instance_of(RightParenToken::class, $this->_right_paren);
  }

  /**
   * @return RightParenToken
   */
  public function getRightParenx(): RightParenToken {
    return $this->getRightParen();
  }

  public function getStatementUNTYPED(): Node {
    return $this->_statement;
  }

  public function withStatement(Node $value): this {
    if ($value === $this->_statement) {
      return $this;
    }
    return new static(
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
   * @return BreakStatement | CompoundStatement | ContinueStatement |
   * EchoStatement | ExpressionStatement | GotoStatement | ReturnStatement |
   * ThrowStatement | UnsetStatement
   */
  public function getStatement(): IStatement {
    return TypeAssert\instance_of(IStatement::class, $this->_statement);
  }

  /**
   * @return BreakStatement | CompoundStatement | ContinueStatement |
   * EchoStatement | ExpressionStatement | GotoStatement | ReturnStatement |
   * ThrowStatement | UnsetStatement
   */
  public function getStatementx(): IStatement {
    return $this->getStatement();
  }

  public function getElseifClausesUNTYPED(): Node {
    return $this->_elseif_clauses;
  }

  public function withElseifClauses(Node $value): this {
    if ($value === $this->_elseif_clauses) {
      return $this;
    }
    return new static(
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
   * @return NodeList<ElseifClause> | null
   */
  public function getElseifClauses(): ?NodeList<ElseifClause> {
    if ($this->_elseif_clauses->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(NodeList::class, $this->_elseif_clauses);
  }

  /**
   * @return NodeList<ElseifClause>
   */
  public function getElseifClausesx(): NodeList<ElseifClause> {
    return TypeAssert\not_null($this->getElseifClauses());
  }

  public function getElseClauseUNTYPED(): Node {
    return $this->_else_clause;
  }

  public function withElseClause(Node $value): this {
    if ($value === $this->_else_clause) {
      return $this;
    }
    return new static(
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
   * @return ElseClause | null
   */
  public function getElseClause(): ?ElseClause {
    if ($this->_else_clause->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(ElseClause::class, $this->_else_clause);
  }

  /**
   * @return ElseClause
   */
  public function getElseClausex(): ElseClause {
    return TypeAssert\not_null($this->getElseClause());
  }
}
