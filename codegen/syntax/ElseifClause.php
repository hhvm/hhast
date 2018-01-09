<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<b3cd9b5b4e59650b663f0e04c713fa79>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class ElseifClause extends EditableNode implements IControlFlowStatement {

  private EditableNode $_keyword;
  private EditableNode $_left_paren;
  private EditableNode $_condition;
  private EditableNode $_right_paren;
  private EditableNode $_statement;

  public function __construct(
    EditableNode $keyword,
    EditableNode $left_paren,
    EditableNode $condition,
    EditableNode $right_paren,
    EditableNode $statement,
  ) {
    parent::__construct('elseif_clause');
    $this->_keyword = $keyword;
    $this->_left_paren = $left_paren;
    $this->_condition = $condition;
    $this->_right_paren = $right_paren;
    $this->_statement = $statement;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
  ): this {
    $keyword = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['elseif_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $keyword->getWidth();
    $left_paren = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['elseif_left_paren'],
      $file,
      $offset,
      $source,
    );
    $offset += $left_paren->getWidth();
    $condition = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['elseif_condition'],
      $file,
      $offset,
      $source,
    );
    $offset += $condition->getWidth();
    $right_paren = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['elseif_right_paren'],
      $file,
      $offset,
      $source,
    );
    $offset += $right_paren->getWidth();
    $statement = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['elseif_statement'],
      $file,
      $offset,
      $source,
    );
    $offset += $statement->getWidth();
    return
      new self($keyword, $left_paren, $condition, $right_paren, $statement);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'keyword' => $this->_keyword,
      'left_paren' => $this->_left_paren,
      'condition' => $this->_condition,
      'right_paren' => $this->_right_paren,
      'statement' => $this->_statement,
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
    $statement = $this->_statement->rewrite($rewriter, $parents);
    if (
      $keyword === $this->_keyword &&
      $left_paren === $this->_left_paren &&
      $condition === $this->_condition &&
      $right_paren === $this->_right_paren &&
      $statement === $this->_statement
    ) {
      return $this;
    }
    return
      new self($keyword, $left_paren, $condition, $right_paren, $statement);
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
    );
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  /**
   * @returns ElseifToken
   */
  public function getKeyword(): ElseifToken {
    return TypeAssert\instance_of(ElseifToken::class, $this->_keyword);
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
    );
  }

  public function hasCondition(): bool {
    return !$this->_condition->isMissing();
  }

  /**
   * @returns LiteralExpression | BinaryExpression | FunctionCallExpression |
   * VariableExpression
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
    );
  }

  public function hasRightParen(): bool {
    return !$this->_right_paren->isMissing();
  }

  /**
   * @returns RightParenToken
   */
  public function getRightParen(): RightParenToken {
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
    );
  }

  public function hasStatement(): bool {
    return !$this->_statement->isMissing();
  }

  /**
   * @returns CompoundStatement | ExpressionStatement
   */
  public function getStatement(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_statement);
  }
}
