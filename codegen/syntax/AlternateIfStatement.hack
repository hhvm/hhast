/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<cc255582aff6ace9698eca0a94fcefde>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class AlternateIfStatement
  extends Node
  implements IControlFlowStatement, IStatement {

  const string SYNTAX_KIND = 'alternate_if_statement';

  private IfToken $_keyword;
  private LeftParenToken $_left_paren;
  private IExpression $_condition;
  private RightParenToken $_right_paren;
  private ColonToken $_colon;
  private NodeList<IStatement> $_statement;
  private ?NodeList<AlternateElseifClause> $_elseif_clauses;
  private ?AlternateElseClause $_else_clause;
  private EndifToken $_endif_keyword;
  private SemicolonToken $_semicolon;

  public function __construct(
    IfToken $keyword,
    LeftParenToken $left_paren,
    IExpression $condition,
    RightParenToken $right_paren,
    ColonToken $colon,
    NodeList<IStatement> $statement,
    ?NodeList<AlternateElseifClause> $elseif_clauses,
    ?AlternateElseClause $else_clause,
    EndifToken $endif_keyword,
    SemicolonToken $semicolon,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_keyword = $keyword;
    $this->_left_paren = $left_paren;
    $this->_condition = $condition;
    $this->_right_paren = $right_paren;
    $this->_colon = $colon;
    $this->_statement = $statement;
    $this->_elseif_clauses = $elseif_clauses;
    $this->_else_clause = $else_clause;
    $this->_endif_keyword = $endif_keyword;
    $this->_semicolon = $semicolon;
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
      /* HH_FIXME[4110] */ $json['alternate_if_keyword'],
      $file,
      $offset,
      $source,
      'IfToken',
    );
    $keyword = $keyword as nonnull;
    $offset += $keyword->getWidth();
    $left_paren = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['alternate_if_left_paren'],
      $file,
      $offset,
      $source,
      'LeftParenToken',
    );
    $left_paren = $left_paren as nonnull;
    $offset += $left_paren->getWidth();
    $condition = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['alternate_if_condition'],
      $file,
      $offset,
      $source,
      'IExpression',
    );
    $condition = $condition as nonnull;
    $offset += $condition->getWidth();
    $right_paren = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['alternate_if_right_paren'],
      $file,
      $offset,
      $source,
      'RightParenToken',
    );
    $right_paren = $right_paren as nonnull;
    $offset += $right_paren->getWidth();
    $colon = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['alternate_if_colon'],
      $file,
      $offset,
      $source,
      'ColonToken',
    );
    $colon = $colon as nonnull;
    $offset += $colon->getWidth();
    $statement = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['alternate_if_statement'],
      $file,
      $offset,
      $source,
      'NodeList<IStatement>',
    );
    $statement = $statement as nonnull;
    $offset += $statement->getWidth();
    $elseif_clauses = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['alternate_if_elseif_clauses'],
      $file,
      $offset,
      $source,
      'NodeList<AlternateElseifClause>',
    );
    $offset += $elseif_clauses?->getWidth() ?? 0;
    $else_clause = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['alternate_if_else_clause'],
      $file,
      $offset,
      $source,
      'AlternateElseClause',
    );
    $offset += $else_clause?->getWidth() ?? 0;
    $endif_keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['alternate_if_endif_keyword'],
      $file,
      $offset,
      $source,
      'EndifToken',
    );
    $endif_keyword = $endif_keyword as nonnull;
    $offset += $endif_keyword->getWidth();
    $semicolon = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['alternate_if_semicolon'],
      $file,
      $offset,
      $source,
      'SemicolonToken',
    );
    $semicolon = $semicolon as nonnull;
    $offset += $semicolon->getWidth();
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
      /* HH_IGNORE_ERROR[4110] */ $colon,
      /* HH_IGNORE_ERROR[4110] */ $statement,
      /* HH_IGNORE_ERROR[4110] */ $elseif_clauses,
      /* HH_IGNORE_ERROR[4110] */ $else_clause,
      /* HH_IGNORE_ERROR[4110] */ $endif_keyword,
      /* HH_IGNORE_ERROR[4110] */ $semicolon,
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
      'colon' => $this->_colon,
      'statement' => $this->_statement,
      'elseif_clauses' => $this->_elseif_clauses,
      'else_clause' => $this->_else_clause,
      'endif_keyword' => $this->_endif_keyword,
      'semicolon' => $this->_semicolon,
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
    $colon = $rewriter($this->_colon, $parents);
    $statement = $rewriter($this->_statement, $parents);
    $elseif_clauses = $this->_elseif_clauses === null
      ? null
      : $rewriter($this->_elseif_clauses, $parents);
    $else_clause = $this->_else_clause === null
      ? null
      : $rewriter($this->_else_clause, $parents);
    $endif_keyword = $rewriter($this->_endif_keyword, $parents);
    $semicolon = $rewriter($this->_semicolon, $parents);
    if (
      $keyword === $this->_keyword &&
      $left_paren === $this->_left_paren &&
      $condition === $this->_condition &&
      $right_paren === $this->_right_paren &&
      $colon === $this->_colon &&
      $statement === $this->_statement &&
      $elseif_clauses === $this->_elseif_clauses &&
      $else_clause === $this->_else_clause &&
      $endif_keyword === $this->_endif_keyword &&
      $semicolon === $this->_semicolon
    ) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $keyword,
      /* HH_FIXME[4110] use `as` */ $left_paren,
      /* HH_FIXME[4110] use `as` */ $condition,
      /* HH_FIXME[4110] use `as` */ $right_paren,
      /* HH_FIXME[4110] use `as` */ $colon,
      /* HH_FIXME[4110] use `as` */ $statement,
      /* HH_FIXME[4110] use `as` */ $elseif_clauses,
      /* HH_FIXME[4110] use `as` */ $else_clause,
      /* HH_FIXME[4110] use `as` */ $endif_keyword,
      /* HH_FIXME[4110] use `as` */ $semicolon,
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
      $this->_colon,
      $this->_statement,
      $this->_elseif_clauses,
      $this->_else_clause,
      $this->_endif_keyword,
      $this->_semicolon,
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
      $this->_colon,
      $this->_statement,
      $this->_elseif_clauses,
      $this->_else_clause,
      $this->_endif_keyword,
      $this->_semicolon,
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
      $this->_colon,
      $this->_statement,
      $this->_elseif_clauses,
      $this->_else_clause,
      $this->_endif_keyword,
      $this->_semicolon,
    );
  }

  public function hasCondition(): bool {
    return $this->_condition !== null;
  }

  /**
   * @return BinaryExpression | VariableExpression
   */
  public function getCondition(): IExpression {
    return TypeAssert\instance_of(IExpression::class, $this->_condition);
  }

  /**
   * @return BinaryExpression | VariableExpression
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
      $this->_colon,
      $this->_statement,
      $this->_elseif_clauses,
      $this->_else_clause,
      $this->_endif_keyword,
      $this->_semicolon,
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

  public function getColonUNTYPED(): ?Node {
    return $this->_colon;
  }

  public function withColon(ColonToken $value): this {
    if ($value === $this->_colon) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_left_paren,
      $this->_condition,
      $this->_right_paren,
      $value,
      $this->_statement,
      $this->_elseif_clauses,
      $this->_else_clause,
      $this->_endif_keyword,
      $this->_semicolon,
    );
  }

  public function hasColon(): bool {
    return $this->_colon !== null;
  }

  /**
   * @return ColonToken
   */
  public function getColon(): ColonToken {
    return TypeAssert\instance_of(ColonToken::class, $this->_colon);
  }

  /**
   * @return ColonToken
   */
  public function getColonx(): ColonToken {
    return $this->getColon();
  }

  public function getStatementUNTYPED(): ?Node {
    return $this->_statement;
  }

  public function withStatement(NodeList<IStatement> $value): this {
    if ($value === $this->_statement) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_left_paren,
      $this->_condition,
      $this->_right_paren,
      $this->_colon,
      $value,
      $this->_elseif_clauses,
      $this->_else_clause,
      $this->_endif_keyword,
      $this->_semicolon,
    );
  }

  public function hasStatement(): bool {
    return $this->_statement !== null;
  }

  /**
   * @return NodeList<EchoStatement> | NodeList<ExpressionStatement>
   */
  public function getStatement(): NodeList<IStatement> {
    return TypeAssert\instance_of(NodeList::class, $this->_statement);
  }

  /**
   * @return NodeList<EchoStatement> | NodeList<ExpressionStatement>
   */
  public function getStatementx(): NodeList<IStatement> {
    return $this->getStatement();
  }

  public function getElseifClausesUNTYPED(): ?Node {
    return $this->_elseif_clauses;
  }

  public function withElseifClauses(
    ?NodeList<AlternateElseifClause> $value,
  ): this {
    if ($value === $this->_elseif_clauses) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_left_paren,
      $this->_condition,
      $this->_right_paren,
      $this->_colon,
      $this->_statement,
      $value,
      $this->_else_clause,
      $this->_endif_keyword,
      $this->_semicolon,
    );
  }

  public function hasElseifClauses(): bool {
    return $this->_elseif_clauses !== null;
  }

  /**
   * @return NodeList<AlternateElseifClause> | null
   */
  public function getElseifClauses(): ?NodeList<AlternateElseifClause> {
    return $this->_elseif_clauses;
  }

  /**
   * @return NodeList<AlternateElseifClause>
   */
  public function getElseifClausesx(): NodeList<AlternateElseifClause> {
    return TypeAssert\not_null($this->getElseifClauses());
  }

  public function getElseClauseUNTYPED(): ?Node {
    return $this->_else_clause;
  }

  public function withElseClause(?AlternateElseClause $value): this {
    if ($value === $this->_else_clause) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_left_paren,
      $this->_condition,
      $this->_right_paren,
      $this->_colon,
      $this->_statement,
      $this->_elseif_clauses,
      $value,
      $this->_endif_keyword,
      $this->_semicolon,
    );
  }

  public function hasElseClause(): bool {
    return $this->_else_clause !== null;
  }

  /**
   * @return AlternateElseClause | null
   */
  public function getElseClause(): ?AlternateElseClause {
    return $this->_else_clause;
  }

  /**
   * @return AlternateElseClause
   */
  public function getElseClausex(): AlternateElseClause {
    return TypeAssert\not_null($this->getElseClause());
  }

  public function getEndifKeywordUNTYPED(): ?Node {
    return $this->_endif_keyword;
  }

  public function withEndifKeyword(EndifToken $value): this {
    if ($value === $this->_endif_keyword) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_left_paren,
      $this->_condition,
      $this->_right_paren,
      $this->_colon,
      $this->_statement,
      $this->_elseif_clauses,
      $this->_else_clause,
      $value,
      $this->_semicolon,
    );
  }

  public function hasEndifKeyword(): bool {
    return $this->_endif_keyword !== null;
  }

  /**
   * @return EndifToken
   */
  public function getEndifKeyword(): EndifToken {
    return TypeAssert\instance_of(EndifToken::class, $this->_endif_keyword);
  }

  /**
   * @return EndifToken
   */
  public function getEndifKeywordx(): EndifToken {
    return $this->getEndifKeyword();
  }

  public function getSemicolonUNTYPED(): ?Node {
    return $this->_semicolon;
  }

  public function withSemicolon(SemicolonToken $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_left_paren,
      $this->_condition,
      $this->_right_paren,
      $this->_colon,
      $this->_statement,
      $this->_elseif_clauses,
      $this->_else_clause,
      $this->_endif_keyword,
      $value,
    );
  }

  public function hasSemicolon(): bool {
    return $this->_semicolon !== null;
  }

  /**
   * @return SemicolonToken
   */
  public function getSemicolon(): SemicolonToken {
    return TypeAssert\instance_of(SemicolonToken::class, $this->_semicolon);
  }

  /**
   * @return SemicolonToken
   */
  public function getSemicolonx(): SemicolonToken {
    return $this->getSemicolon();
  }
}
