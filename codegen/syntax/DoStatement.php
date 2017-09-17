<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<ac7aa7805f632875f173d20710aa582f>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class DoStatement extends EditableSyntax
  implements IControlFlowStatement, ILoopStatement {

  private EditableSyntax $_keyword;
  private EditableSyntax $_body;
  private EditableSyntax $_while_keyword;
  private EditableSyntax $_left_paren;
  private EditableSyntax $_condition;
  private EditableSyntax $_right_paren;
  private EditableSyntax $_semicolon;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $body,
    EditableSyntax $while_keyword,
    EditableSyntax $left_paren,
    EditableSyntax $condition,
    EditableSyntax $right_paren,
    EditableSyntax $semicolon,
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
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['do_keyword'],
      $position,
      $source,
    );
    $position += $keyword->getWidth();
    $body = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['do_body'],
      $position,
      $source,
    );
    $position += $body->getWidth();
    $while_keyword = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['do_while_keyword'],
      $position,
      $source,
    );
    $position += $while_keyword->getWidth();
    $left_paren = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['do_left_paren'],
      $position,
      $source,
    );
    $position += $left_paren->getWidth();
    $condition = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['do_condition'],
      $position,
      $source,
    );
    $position += $condition->getWidth();
    $right_paren = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['do_right_paren'],
      $position,
      $source,
    );
    $position += $right_paren->getWidth();
    $semicolon = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['do_semicolon'],
      $position,
      $source,
    );
    $position += $semicolon->getWidth();
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
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'body' => $this->_body;
    yield 'while_keyword' => $this->_while_keyword;
    yield 'left_paren' => $this->_left_paren;
    yield 'condition' => $this->_condition;
    yield 'right_paren' => $this->_right_paren;
    yield 'semicolon' => $this->_semicolon;
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
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

  public function getKeywordUNTYPED(): EditableSyntax {
    return $this->_keyword;
  }

  public function withKeyword(EditableSyntax $value): this {
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

  public function getBodyUNTYPED(): EditableSyntax {
    return $this->_body;
  }

  public function withBody(EditableSyntax $value): this {
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
  public function getBody(): EditableSyntax {
    return TypeAssert\instance_of(EditableSyntax::class, $this->_body);
  }

  public function getWhileKeywordUNTYPED(): EditableSyntax {
    return $this->_while_keyword;
  }

  public function withWhileKeyword(EditableSyntax $value): this {
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

  public function getLeftParenUNTYPED(): EditableSyntax {
    return $this->_left_paren;
  }

  public function withLeftParen(EditableSyntax $value): this {
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

  public function getConditionUNTYPED(): EditableSyntax {
    return $this->_condition;
  }

  public function withCondition(EditableSyntax $value): this {
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
   * FunctionCallExpression | PrefixUnaryExpression | SubscriptExpression
   */
  public function getCondition(): EditableSyntax {
    return TypeAssert\instance_of(EditableSyntax::class, $this->_condition);
  }

  public function getRightParenUNTYPED(): EditableSyntax {
    return $this->_right_paren;
  }

  public function withRightParen(EditableSyntax $value): this {
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

  public function getSemicolonUNTYPED(): EditableSyntax {
    return $this->_semicolon;
  }

  public function withSemicolon(EditableSyntax $value): this {
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
