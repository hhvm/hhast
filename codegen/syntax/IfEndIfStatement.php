<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<d223cac1ba8696c5b7a331eacb65c2c0>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class IfEndIfStatement extends EditableNode {

  private EditableNode $_keyword;
  private EditableNode $_left_paren;
  private EditableNode $_condition;
  private EditableNode $_right_paren;
  private EditableNode $_colon;
  private EditableNode $_statement;
  private EditableNode $_elseif_colon_clauses;
  private EditableNode $_else_colon_clause;
  private EditableNode $_endif_keyword;
  private EditableNode $_semicolon;

  public function __construct(
    EditableNode $keyword,
    EditableNode $left_paren,
    EditableNode $condition,
    EditableNode $right_paren,
    EditableNode $colon,
    EditableNode $statement,
    EditableNode $elseif_colon_clauses,
    EditableNode $else_colon_clause,
    EditableNode $endif_keyword,
    EditableNode $semicolon,
  ) {
    parent::__construct('if_endif_statement');
    $this->_keyword = $keyword;
    $this->_left_paren = $left_paren;
    $this->_condition = $condition;
    $this->_right_paren = $right_paren;
    $this->_colon = $colon;
    $this->_statement = $statement;
    $this->_elseif_colon_clauses = $elseif_colon_clauses;
    $this->_else_colon_clause = $else_colon_clause;
    $this->_endif_keyword = $endif_keyword;
    $this->_semicolon = $semicolon;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
  ): this {
    $keyword = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['if_endif_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $keyword->getWidth();
    $left_paren = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['if_endif_left_paren'],
      $file,
      $offset,
      $source,
    );
    $offset += $left_paren->getWidth();
    $condition = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['if_endif_condition'],
      $file,
      $offset,
      $source,
    );
    $offset += $condition->getWidth();
    $right_paren = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['if_endif_right_paren'],
      $file,
      $offset,
      $source,
    );
    $offset += $right_paren->getWidth();
    $colon = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['if_endif_colon'],
      $file,
      $offset,
      $source,
    );
    $offset += $colon->getWidth();
    $statement = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['if_endif_statement'],
      $file,
      $offset,
      $source,
    );
    $offset += $statement->getWidth();
    $elseif_colon_clauses = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['if_endif_elseif_colon_clauses'],
      $file,
      $offset,
      $source,
    );
    $offset += $elseif_colon_clauses->getWidth();
    $else_colon_clause = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['if_endif_else_colon_clause'],
      $file,
      $offset,
      $source,
    );
    $offset += $else_colon_clause->getWidth();
    $endif_keyword = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['if_endif_endif_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $endif_keyword->getWidth();
    $semicolon = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['if_endif_semicolon'],
      $file,
      $offset,
      $source,
    );
    $offset += $semicolon->getWidth();
    return new static(
      $keyword,
      $left_paren,
      $condition,
      $right_paren,
      $colon,
      $statement,
      $elseif_colon_clauses,
      $else_colon_clause,
      $endif_keyword,
      $semicolon,
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
      'elseif_colon_clauses' => $this->_elseif_colon_clauses,
      'else_colon_clause' => $this->_else_colon_clause,
      'endif_keyword' => $this->_endif_keyword,
      'semicolon' => $this->_semicolon,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?vec<EditableNode> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $parents);
    $left_paren = $this->_left_paren->rewrite($rewriter, $parents);
    $condition = $this->_condition->rewrite($rewriter, $parents);
    $right_paren = $this->_right_paren->rewrite($rewriter, $parents);
    $colon = $this->_colon->rewrite($rewriter, $parents);
    $statement = $this->_statement->rewrite($rewriter, $parents);
    $elseif_colon_clauses =
      $this->_elseif_colon_clauses->rewrite($rewriter, $parents);
    $else_colon_clause =
      $this->_else_colon_clause->rewrite($rewriter, $parents);
    $endif_keyword = $this->_endif_keyword->rewrite($rewriter, $parents);
    $semicolon = $this->_semicolon->rewrite($rewriter, $parents);
    if (
      $keyword === $this->_keyword &&
      $left_paren === $this->_left_paren &&
      $condition === $this->_condition &&
      $right_paren === $this->_right_paren &&
      $colon === $this->_colon &&
      $statement === $this->_statement &&
      $elseif_colon_clauses === $this->_elseif_colon_clauses &&
      $else_colon_clause === $this->_else_colon_clause &&
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
      $elseif_colon_clauses,
      $else_colon_clause,
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
      $this->_elseif_colon_clauses,
      $this->_else_colon_clause,
      $this->_endif_keyword,
      $this->_semicolon,
    );
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  /**
   * @returns unknown
   */
  public function getKeyword(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_keyword);
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
      $this->_elseif_colon_clauses,
      $this->_else_colon_clause,
      $this->_endif_keyword,
      $this->_semicolon,
    );
  }

  public function hasLeftParen(): bool {
    return !$this->_left_paren->isMissing();
  }

  /**
   * @returns unknown
   */
  public function getLeftParen(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_left_paren);
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
      $this->_elseif_colon_clauses,
      $this->_else_colon_clause,
      $this->_endif_keyword,
      $this->_semicolon,
    );
  }

  public function hasCondition(): bool {
    return !$this->_condition->isMissing();
  }

  /**
   * @returns unknown
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
    return new static(
      $this->_keyword,
      $this->_left_paren,
      $this->_condition,
      $value,
      $this->_colon,
      $this->_statement,
      $this->_elseif_colon_clauses,
      $this->_else_colon_clause,
      $this->_endif_keyword,
      $this->_semicolon,
    );
  }

  public function hasRightParen(): bool {
    return !$this->_right_paren->isMissing();
  }

  /**
   * @returns unknown
   */
  public function getRightParen(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_right_paren);
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
      $this->_elseif_colon_clauses,
      $this->_else_colon_clause,
      $this->_endif_keyword,
      $this->_semicolon,
    );
  }

  public function hasColon(): bool {
    return !$this->_colon->isMissing();
  }

  /**
   * @returns unknown
   */
  public function getColon(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_colon);
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
      $this->_elseif_colon_clauses,
      $this->_else_colon_clause,
      $this->_endif_keyword,
      $this->_semicolon,
    );
  }

  public function hasStatement(): bool {
    return !$this->_statement->isMissing();
  }

  /**
   * @returns unknown
   */
  public function getStatement(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_statement);
  }

  public function getElseifColonClausesUNTYPED(): EditableNode {
    return $this->_elseif_colon_clauses;
  }

  public function withElseifColonClauses(EditableNode $value): this {
    if ($value === $this->_elseif_colon_clauses) {
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
      $this->_else_colon_clause,
      $this->_endif_keyword,
      $this->_semicolon,
    );
  }

  public function hasElseifColonClauses(): bool {
    return !$this->_elseif_colon_clauses->isMissing();
  }

  /**
   * @returns unknown
   */
  public function getElseifColonClauses(): EditableNode {
    return
      TypeAssert\instance_of(EditableNode::class, $this->_elseif_colon_clauses);
  }

  public function getElseColonClauseUNTYPED(): EditableNode {
    return $this->_else_colon_clause;
  }

  public function withElseColonClause(EditableNode $value): this {
    if ($value === $this->_else_colon_clause) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_left_paren,
      $this->_condition,
      $this->_right_paren,
      $this->_colon,
      $this->_statement,
      $this->_elseif_colon_clauses,
      $value,
      $this->_endif_keyword,
      $this->_semicolon,
    );
  }

  public function hasElseColonClause(): bool {
    return !$this->_else_colon_clause->isMissing();
  }

  /**
   * @returns unknown
   */
  public function getElseColonClause(): EditableNode {
    return
      TypeAssert\instance_of(EditableNode::class, $this->_else_colon_clause);
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
      $this->_elseif_colon_clauses,
      $this->_else_colon_clause,
      $value,
      $this->_semicolon,
    );
  }

  public function hasEndifKeyword(): bool {
    return !$this->_endif_keyword->isMissing();
  }

  /**
   * @returns unknown
   */
  public function getEndifKeyword(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_endif_keyword);
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
      $this->_elseif_colon_clauses,
      $this->_else_colon_clause,
      $this->_endif_keyword,
      $value,
    );
  }

  public function hasSemicolon(): bool {
    return !$this->_semicolon->isMissing();
  }

  /**
   * @returns unknown
   */
  public function getSemicolon(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_semicolon);
  }
}
