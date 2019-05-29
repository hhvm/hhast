/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<410bc17ce82f53eb8d9bbf5837941404>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class AlternateIfStatement
  extends Node
  implements IControlFlowStatement, IStatement {

  const string SYNTAX_KIND = 'alternate_if_statement';

  private Node $_keyword;
  private Node $_left_paren;
  private Node $_condition;
  private Node $_right_paren;
  private Node $_colon;
  private Node $_statement;
  private Node $_elseif_clauses;
  private Node $_else_clause;
  private Node $_endif_keyword;
  private Node $_semicolon;

  public function __construct(
    Node $keyword,
    Node $left_paren,
    Node $condition,
    Node $right_paren,
    Node $colon,
    Node $statement,
    Node $elseif_clauses,
    Node $else_clause,
    Node $endif_keyword,
    Node $semicolon,
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
  ): this {
    $offset = $initial_offset;
    $keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['alternate_if_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $keyword->getWidth();
    $left_paren = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['alternate_if_left_paren'],
      $file,
      $offset,
      $source,
    );
    $offset += $left_paren->getWidth();
    $condition = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['alternate_if_condition'],
      $file,
      $offset,
      $source,
    );
    $offset += $condition->getWidth();
    $right_paren = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['alternate_if_right_paren'],
      $file,
      $offset,
      $source,
    );
    $offset += $right_paren->getWidth();
    $colon = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['alternate_if_colon'],
      $file,
      $offset,
      $source,
    );
    $offset += $colon->getWidth();
    $statement = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['alternate_if_statement'],
      $file,
      $offset,
      $source,
    );
    $offset += $statement->getWidth();
    $elseif_clauses = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['alternate_if_elseif_clauses'],
      $file,
      $offset,
      $source,
    );
    $offset += $elseif_clauses->getWidth();
    $else_clause = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['alternate_if_else_clause'],
      $file,
      $offset,
      $source,
    );
    $offset += $else_clause->getWidth();
    $endif_keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['alternate_if_endif_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $endif_keyword->getWidth();
    $semicolon = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['alternate_if_semicolon'],
      $file,
      $offset,
      $source,
    );
    $offset += $semicolon->getWidth();
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
      $colon,
      $statement,
      $elseif_clauses,
      $else_clause,
      $endif_keyword,
      $semicolon,
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
    $colon = $rewriter($this->_colon, $parents);
    $statement = $rewriter($this->_statement, $parents);
    $elseif_clauses = $rewriter($this->_elseif_clauses, $parents);
    $else_clause = $rewriter($this->_else_clause, $parents);
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
      $keyword,
      $left_paren,
      $condition,
      $right_paren,
      $colon,
      $statement,
      $elseif_clauses,
      $else_clause,
      $endif_keyword,
      $semicolon,
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
      $this->_colon,
      $this->_statement,
      $this->_elseif_clauses,
      $this->_else_clause,
      $this->_endif_keyword,
      $this->_semicolon,
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
      $this->_colon,
      $this->_statement,
      $this->_elseif_clauses,
      $this->_else_clause,
      $this->_endif_keyword,
      $this->_semicolon,
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
      $this->_colon,
      $this->_statement,
      $this->_elseif_clauses,
      $this->_else_clause,
      $this->_endif_keyword,
      $this->_semicolon,
    );
  }

  public function hasCondition(): bool {
    return !$this->_condition->isMissing();
  }

  /**
   * @return BinaryExpression | VariableExpression
   */
  <<__Memoize>>
  public function getCondition(): IExpression {
    return __Private\Wrap\wrap_IExpression($this->_condition);
  }

  /**
   * @return BinaryExpression | VariableExpression
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
      $this->_colon,
      $this->_statement,
      $this->_elseif_clauses,
      $this->_else_clause,
      $this->_endif_keyword,
      $this->_semicolon,
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

  public function getColonUNTYPED(): Node {
    return $this->_colon;
  }

  public function withColon(Node $value): this {
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
    return !$this->_colon->isMissing();
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
      $this->_colon,
      $value,
      $this->_elseif_clauses,
      $this->_else_clause,
      $this->_endif_keyword,
      $this->_semicolon,
    );
  }

  public function hasStatement(): bool {
    return !$this->_statement->isMissing();
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
      $this->_colon,
      $this->_statement,
      $value,
      $this->_else_clause,
      $this->_endif_keyword,
      $this->_semicolon,
    );
  }

  public function hasElseifClauses(): bool {
    return !$this->_elseif_clauses->isMissing();
  }

  /**
   * @return NodeList<AlternateElseifClause> | null
   */
  public function getElseifClauses(): ?NodeList<AlternateElseifClause> {
    if ($this->_elseif_clauses->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(NodeList::class, $this->_elseif_clauses);
  }

  /**
   * @return NodeList<AlternateElseifClause>
   */
  public function getElseifClausesx(): NodeList<AlternateElseifClause> {
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
      $this->_colon,
      $this->_statement,
      $this->_elseif_clauses,
      $value,
      $this->_endif_keyword,
      $this->_semicolon,
    );
  }

  public function hasElseClause(): bool {
    return !$this->_else_clause->isMissing();
  }

  /**
   * @return AlternateElseClause | null
   */
  public function getElseClause(): ?AlternateElseClause {
    if ($this->_else_clause->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(
      AlternateElseClause::class,
      $this->_else_clause,
    );
  }

  /**
   * @return AlternateElseClause
   */
  public function getElseClausex(): AlternateElseClause {
    return TypeAssert\not_null($this->getElseClause());
  }

  public function getEndifKeywordUNTYPED(): Node {
    return $this->_endif_keyword;
  }

  public function withEndifKeyword(Node $value): this {
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
    return !$this->_endif_keyword->isMissing();
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

  public function getSemicolonUNTYPED(): Node {
    return $this->_semicolon;
  }

  public function withSemicolon(Node $value): this {
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
    return !$this->_semicolon->isMissing();
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
