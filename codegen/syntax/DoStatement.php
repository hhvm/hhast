<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<06ecc3ea3e6e52365a19c0f751577327>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class DoStatement extends EditableNode
  implements IControlFlowStatement, ILoopStatement {

  private EditableNode $_keyword;
  private EditableNode $_body;
  private EditableNode $_while_keyword;
  private EditableNode $_left_paren;
  private EditableNode $_condition;
  private EditableNode $_right_paren;
  private EditableNode $_semicolon;

  public function __construct(
    EditableNode $keyword,
    EditableNode $body,
    EditableNode $while_keyword,
    EditableNode $left_paren,
    EditableNode $condition,
    EditableNode $right_paren,
    EditableNode $semicolon,
  ) {
    parent::__construct('do_statement');
    $this->_keyword = $keyword;
    $this->_body = $body;
    $this->_while_keyword = $while_keyword;
    $this->_left_paren = $left_paren;
    $this->_condition = $condition;
    $this->_right_paren = $right_paren;
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
      /* UNSAFE_EXPR */ $json['do_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $keyword->getWidth();
    $body = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['do_body'],
      $file,
      $offset,
      $source,
    );
    $offset += $body->getWidth();
    $while_keyword = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['do_while_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $while_keyword->getWidth();
    $left_paren = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['do_left_paren'],
      $file,
      $offset,
      $source,
    );
    $offset += $left_paren->getWidth();
    $condition = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['do_condition'],
      $file,
      $offset,
      $source,
    );
    $offset += $condition->getWidth();
    $right_paren = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['do_right_paren'],
      $file,
      $offset,
      $source,
    );
    $offset += $right_paren->getWidth();
    $semicolon = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['do_semicolon'],
      $file,
      $offset,
      $source,
    );
    $offset += $semicolon->getWidth();
    return new self(
      $keyword,
      $body,
      $while_keyword,
      $left_paren,
      $condition,
      $right_paren,
      $semicolon,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'keyword' => $this->_keyword,
      'body' => $this->_body,
      'while_keyword' => $this->_while_keyword,
      'left_paren' => $this->_left_paren,
      'condition' => $this->_condition,
      'right_paren' => $this->_right_paren,
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
    $body = $this->_body->rewrite($rewriter, $parents);
    $while_keyword = $this->_while_keyword->rewrite($rewriter, $parents);
    $left_paren = $this->_left_paren->rewrite($rewriter, $parents);
    $condition = $this->_condition->rewrite($rewriter, $parents);
    $right_paren = $this->_right_paren->rewrite($rewriter, $parents);
    $semicolon = $this->_semicolon->rewrite($rewriter, $parents);
    if (
      $keyword === $this->_keyword &&
      $body === $this->_body &&
      $while_keyword === $this->_while_keyword &&
      $left_paren === $this->_left_paren &&
      $condition === $this->_condition &&
      $right_paren === $this->_right_paren &&
      $semicolon === $this->_semicolon
    ) {
      return $this;
    }
    return new self(
      $keyword,
      $body,
      $while_keyword,
      $left_paren,
      $condition,
      $right_paren,
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
    return new self(
      $value,
      $this->_body,
      $this->_while_keyword,
      $this->_left_paren,
      $this->_condition,
      $this->_right_paren,
      $this->_semicolon,
    );
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  /**
   * @returns DoToken
   */
  public function getKeyword(): DoToken {
    return TypeAssert\instance_of(DoToken::class, $this->_keyword);
  }

  public function getBodyUNTYPED(): EditableNode {
    return $this->_body;
  }

  public function withBody(EditableNode $value): this {
    if ($value === $this->_body) {
      return $this;
    }
    return new self(
      $this->_keyword,
      $value,
      $this->_while_keyword,
      $this->_left_paren,
      $this->_condition,
      $this->_right_paren,
      $this->_semicolon,
    );
  }

  public function hasBody(): bool {
    return !$this->_body->isMissing();
  }

  /**
   * @returns CompoundStatement | ExpressionStatement
   */
  public function getBody(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_body);
  }

  public function getWhileKeywordUNTYPED(): EditableNode {
    return $this->_while_keyword;
  }

  public function withWhileKeyword(EditableNode $value): this {
    if ($value === $this->_while_keyword) {
      return $this;
    }
    return new self(
      $this->_keyword,
      $this->_body,
      $value,
      $this->_left_paren,
      $this->_condition,
      $this->_right_paren,
      $this->_semicolon,
    );
  }

  public function hasWhileKeyword(): bool {
    return !$this->_while_keyword->isMissing();
  }

  /**
   * @returns WhileToken
   */
  public function getWhileKeyword(): WhileToken {
    return TypeAssert\instance_of(WhileToken::class, $this->_while_keyword);
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
      $this->_body,
      $this->_while_keyword,
      $value,
      $this->_condition,
      $this->_right_paren,
      $this->_semicolon,
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
      $this->_body,
      $this->_while_keyword,
      $this->_left_paren,
      $value,
      $this->_right_paren,
      $this->_semicolon,
    );
  }

  public function hasCondition(): bool {
    return !$this->_condition->isMissing();
  }

  /**
   * @returns LiteralExpression | BinaryExpression | VariableExpression |
   * FunctionCallExpression | SubscriptExpression | PrefixUnaryExpression
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
      $this->_body,
      $this->_while_keyword,
      $this->_left_paren,
      $this->_condition,
      $value,
      $this->_semicolon,
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

  public function getSemicolonUNTYPED(): EditableNode {
    return $this->_semicolon;
  }

  public function withSemicolon(EditableNode $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new self(
      $this->_keyword,
      $this->_body,
      $this->_while_keyword,
      $this->_left_paren,
      $this->_condition,
      $this->_right_paren,
      $value,
    );
  }

  public function hasSemicolon(): bool {
    return !$this->_semicolon->isMissing();
  }

  /**
   * @returns SemicolonToken
   */
  public function getSemicolon(): SemicolonToken {
    return TypeAssert\instance_of(SemicolonToken::class, $this->_semicolon);
  }
}
