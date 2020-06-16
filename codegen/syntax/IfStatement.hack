/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<503a91220535cc10241412bc8768fca6>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class IfStatement
  extends Node
  implements IControlFlowStatement, IStatement {

  const string SYNTAX_KIND = 'if_statement';

  private IfToken $_keyword;
  private LeftParenToken $_left_paren;
  private IExpression $_condition;
  private RightParenToken $_right_paren;
  private IStatement $_statement;
  private ?NodeList<ElseifClause> $_elseif_clauses;
  private ?ElseClause $_else_clause;

  public function __construct(
    IfToken $keyword,
    LeftParenToken $left_paren,
    IExpression $condition,
    RightParenToken $right_paren,
    IStatement $statement,
    ?NodeList<ElseifClause> $elseif_clauses,
    ?ElseClause $else_clause,
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
    string $_type_hint,
  ): this {
    $offset = $initial_offset;
    $keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['if_keyword'],
      $file,
      $offset,
      $source,
      'IfToken',
    );
    $keyword = $keyword as nonnull;
    $offset += $keyword->getWidth();
    $left_paren = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['if_left_paren'],
      $file,
      $offset,
      $source,
      'LeftParenToken',
    );
    $left_paren = $left_paren as nonnull;
    $offset += $left_paren->getWidth();
    $condition = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['if_condition'],
      $file,
      $offset,
      $source,
      'IExpression',
    );
    $condition = $condition as nonnull;
    $offset += $condition->getWidth();
    $right_paren = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['if_right_paren'],
      $file,
      $offset,
      $source,
      'RightParenToken',
    );
    $right_paren = $right_paren as nonnull;
    $offset += $right_paren->getWidth();
    $statement = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['if_statement'],
      $file,
      $offset,
      $source,
      'IStatement',
    );
    $statement = $statement as nonnull;
    $offset += $statement->getWidth();
    $elseif_clauses = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['if_elseif_clauses'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'NodeList<ElseifClause>',
    );
    $offset += $elseif_clauses?->getWidth() ?? 0;
    $else_clause = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['if_else_clause'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'ElseClause',
    );
    $offset += $else_clause?->getWidth() ?? 0;
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $keyword,
      /* HH_IGNORE_ERROR[4110] */ $left_paren,
      /* HH_IGNORE_ERROR[4110] */ $condition,
      /* HH_IGNORE_ERROR[4110] */ $right_paren,
      /* HH_IGNORE_ERROR[4110] */ $statement,
      /* HH_IGNORE_ERROR[4110] */ $elseif_clauses,
      /* HH_IGNORE_ERROR[4110] */ $else_clause,
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
    $left_paren = $rewriter($this->_left_paren, $parents);
    $condition = $rewriter($this->_condition, $parents);
    $right_paren = $rewriter($this->_right_paren, $parents);
    $statement = $rewriter($this->_statement, $parents);
    $elseif_clauses = $this->_elseif_clauses === null
      ? null
      : $rewriter($this->_elseif_clauses, $parents);
    $else_clause = $this->_else_clause === null
      ? null
      : $rewriter($this->_else_clause, $parents);
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
      /* HH_FIXME[4110] use `as` */ $keyword,
      /* HH_FIXME[4110] use `as` */ $left_paren,
      /* HH_FIXME[4110] use `as` */ $condition,
      /* HH_FIXME[4110] use `as` */ $right_paren,
      /* HH_FIXME[4110] use `as` */ $statement,
      /* HH_FIXME[4110] use `as` */ $elseif_clauses,
      /* HH_FIXME[4110] use `as` */ $else_clause,
    );
  }

  public function getKeywordUNTYPED(): ?Node {
    return $this->_keyword;
  }

  public function withKeyword(IfToken $value): this {
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
    return $this->_keyword !== null;
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

  public function getLeftParenUNTYPED(): ?Node {
    return $this->_left_paren;
  }

  public function withLeftParen(LeftParenToken $value): this {
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
    return $this->_left_paren !== null;
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

  public function getConditionUNTYPED(): ?Node {
    return $this->_condition;
  }

  public function withCondition(IExpression $value): this {
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
    return $this->_condition !== null;
  }

  /**
   * @return AsExpression | BinaryExpression | CastExpression |
   * FunctionCallExpression | IsExpression | IssetExpression |
   * LiteralExpression | MemberSelectionExpression | ParenthesizedExpression |
   * PrefixUnaryExpression | QualifiedName | ScopeResolutionExpression |
   * SubscriptExpression | NameToken | VariableExpression |
   * VarrayIntrinsicExpression
   */
  public function getCondition(): IExpression {
    return TypeAssert\instance_of(IExpression::class, $this->_condition);
  }

  /**
   * @return AsExpression | BinaryExpression | CastExpression |
   * FunctionCallExpression | IsExpression | IssetExpression |
   * LiteralExpression | MemberSelectionExpression | ParenthesizedExpression |
   * PrefixUnaryExpression | QualifiedName | ScopeResolutionExpression |
   * SubscriptExpression | NameToken | VariableExpression |
   * VarrayIntrinsicExpression
   */
  public function getConditionx(): IExpression {
    return $this->getCondition();
  }

  public function getRightParenUNTYPED(): ?Node {
    return $this->_right_paren;
  }

  public function withRightParen(RightParenToken $value): this {
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
    return $this->_right_paren !== null;
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

  public function getStatementUNTYPED(): ?Node {
    return $this->_statement;
  }

  public function withStatement(IStatement $value): this {
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
    return $this->_statement !== null;
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

  public function getElseifClausesUNTYPED(): ?Node {
    return $this->_elseif_clauses;
  }

  public function withElseifClauses(?NodeList<ElseifClause> $value): this {
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
    return $this->_elseif_clauses !== null;
  }

  /**
   * @return NodeList<ElseifClause> | null
   */
  public function getElseifClauses(): ?NodeList<ElseifClause> {
    return $this->_elseif_clauses;
  }

  /**
   * @return NodeList<ElseifClause>
   */
  public function getElseifClausesx(): NodeList<ElseifClause> {
    return TypeAssert\not_null($this->getElseifClauses());
  }

  public function getElseClauseUNTYPED(): ?Node {
    return $this->_else_clause;
  }

  public function withElseClause(?ElseClause $value): this {
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
    return $this->_else_clause !== null;
  }

  /**
   * @return ElseClause | null
   */
  public function getElseClause(): ?ElseClause {
    return $this->_else_clause;
  }

  /**
   * @return ElseClause
   */
  public function getElseClausex(): ElseClause {
    return TypeAssert\not_null($this->getElseClause());
  }
}
