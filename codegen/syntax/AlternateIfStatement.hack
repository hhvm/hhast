/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<a0658b36c41037644144ce9f8f5a2315>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class AlternateIfStatement
  extends EditableNode
  implements IControlFlowStatement, IStatement {

  private EditableNode $_keyword;
  private EditableNode $_left_paren;
  private EditableNode $_condition;
  private EditableNode $_right_paren;
  private EditableNode $_colon;
  private EditableNode $_statement;
  private EditableNode $_elseif_clauses;
  private EditableNode $_else_clause;
  private EditableNode $_endif_keyword;
  private EditableNode $_semicolon;

  public function __construct(
    EditableNode $keyword,
    EditableNode $left_paren,
    EditableNode $condition,
    EditableNode $right_paren,
    EditableNode $colon,
    EditableNode $statement,
    EditableNode $elseif_clauses,
    EditableNode $else_clause,
    EditableNode $endif_keyword,
    EditableNode $semicolon,
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
    parent::__construct('alternate_if_statement', $source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
  ): this {
    $offset = $initial_offset;
    $keyword = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['alternate_if_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $keyword->getWidth();
    $left_paren = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['alternate_if_left_paren'],
      $file,
      $offset,
      $source,
    );
    $offset += $left_paren->getWidth();
    $condition = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['alternate_if_condition'],
      $file,
      $offset,
      $source,
    );
    $offset += $condition->getWidth();
    $right_paren = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['alternate_if_right_paren'],
      $file,
      $offset,
      $source,
    );
    $offset += $right_paren->getWidth();
    $colon = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['alternate_if_colon'],
      $file,
      $offset,
      $source,
    );
    $offset += $colon->getWidth();
    $statement = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['alternate_if_statement'],
      $file,
      $offset,
      $source,
    );
    $offset += $statement->getWidth();
    $elseif_clauses = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['alternate_if_elseif_clauses'],
      $file,
      $offset,
      $source,
    );
    $offset += $elseif_clauses->getWidth();
    $else_clause = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['alternate_if_else_clause'],
      $file,
      $offset,
      $source,
    );
    $offset += $else_clause->getWidth();
    $endif_keyword = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['alternate_if_endif_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $endif_keyword->getWidth();
    $semicolon = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['alternate_if_semicolon'],
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
  public function getChildren(): dict<string, EditableNode> {
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
    vec<EditableNode> $parents = vec[],
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

  public function getKeywordUNTYPED(): EditableNode {
    return $this->_keyword;
  }

  public function withKeyword(EditableNode $value): this {
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

  public function getLeftParenUNTYPED(): EditableNode {
    return $this->_left_paren;
  }

  public function withLeftParen(EditableNode $value): this {
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

  public function getConditionUNTYPED(): EditableNode {
    return $this->_condition;
  }

  public function withCondition(EditableNode $value): this {
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

  public function getRightParenUNTYPED(): EditableNode {
    return $this->_right_paren;
  }

  public function withRightParen(EditableNode $value): this {
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

  public function getColonUNTYPED(): EditableNode {
    return $this->_colon;
  }

  public function withColon(EditableNode $value): this {
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

  public function getStatementUNTYPED(): EditableNode {
    return $this->_statement;
  }

  public function withStatement(EditableNode $value): this {
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
   * @return EditableList<EditableNode>
   */
  public function getStatement(): EditableList<EditableNode> {
    return TypeAssert\instance_of(EditableList::class, $this->_statement);
  }

  /**
   * @return EditableList<EditableNode>
   */
  public function getStatementx(): EditableList<EditableNode> {
    return $this->getStatement();
  }

  public function getElseifClausesUNTYPED(): EditableNode {
    return $this->_elseif_clauses;
  }

  public function withElseifClauses(EditableNode $value): this {
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
   * @return EditableList<EditableNode> | null
   */
  public function getElseifClauses(): ?EditableList<EditableNode> {
    if ($this->_elseif_clauses->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableList::class, $this->_elseif_clauses);
  }

  /**
   * @return EditableList<EditableNode>
   */
  public function getElseifClausesx(): EditableList<EditableNode> {
    return TypeAssert\not_null($this->getElseifClauses());
  }

  public function getElseClauseUNTYPED(): EditableNode {
    return $this->_else_clause;
  }

  public function withElseClause(EditableNode $value): this {
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

  public function getEndifKeywordUNTYPED(): EditableNode {
    return $this->_endif_keyword;
  }

  public function withEndifKeyword(EditableNode $value): this {
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

  public function getSemicolonUNTYPED(): EditableNode {
    return $this->_semicolon;
  }

  public function withSemicolon(EditableNode $value): this {
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
