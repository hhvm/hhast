<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<147f8152d8454fe131a461bee764e604>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class ParenthesizedExpression extends EditableSyntax {

  private EditableSyntax $_left_paren;
  private EditableSyntax $_expression;
  private EditableSyntax $_right_paren;

  public function __construct(
    EditableSyntax $left_paren,
    EditableSyntax $expression,
    EditableSyntax $right_paren,
  ) {
    parent::__construct('parenthesized_expression');
    $this->_left_paren = $left_paren;
    $this->_expression = $expression;
    $this->_right_paren = $right_paren;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $left_paren = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['parenthesized_expression_left_paren'],
      $position,
      $source,
    );
    $position += $left_paren->getWidth();
    $expression = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['parenthesized_expression_expression'],
      $position,
      $source,
    );
    $position += $expression->getWidth();
    $right_paren = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['parenthesized_expression_right_paren'],
      $position,
      $source,
    );
    $position += $right_paren->getWidth();
    return new self($left_paren, $expression, $right_paren);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'left_paren' => $this->_left_paren;
    yield 'expression' => $this->_expression;
    yield 'right_paren' => $this->_right_paren;
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $left_paren = $this->_left_paren->rewrite($rewriter, $parents);
    $expression = $this->_expression->rewrite($rewriter, $parents);
    $right_paren = $this->_right_paren->rewrite($rewriter, $parents);
    if (
      $left_paren === $this->_left_paren &&
      $expression === $this->_expression &&
      $right_paren === $this->_right_paren
    ) {
      return $this;
    }
    return new self($left_paren, $expression, $right_paren);
  }

  public function getLeftParenUNTYPED(): EditableSyntax {
    return $this->_left_paren;
  }

  public function withLeftParen(EditableSyntax $value): this {
    if ($value === $this->_left_paren) {
      return $this;
    }
    return new self($value, $this->_expression, $this->_right_paren);
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

  public function getExpressionUNTYPED(): EditableSyntax {
    return $this->_expression;
  }

  public function withExpression(EditableSyntax $value): this {
    if ($value === $this->_expression) {
      return $this;
    }
    return new self($this->_left_paren, $value, $this->_right_paren);
  }

  public function hasExpression(): bool {
    return !$this->_expression->isMissing();
  }

  /**
   * @returns FunctionCallExpression | BinaryExpression | ConditionalExpression
   * | LiteralExpression | PrefixUnaryExpression | ObjectCreationExpression |
   * PostfixUnaryExpression | AnonymousFunction | InstanceofExpression |
   * VariableExpression | ParenthesizedExpression | ArrayIntrinsicExpression |
   * XHPExpression | IssetExpression | ScopeResolutionExpression |
   * SubscriptExpression | MemberSelectionExpression |
   * CollectionLiteralExpression | LambdaExpression | RightParenToken |
   * QualifiedNameExpression | CastExpression | YieldExpression |
   * EmptyExpression | InclusionExpression | QuestionToken
   */
  public function getExpression(): EditableSyntax {
    return TypeAssert\instance_of(EditableSyntax::class, $this->_expression);
  }

  public function getRightParenUNTYPED(): EditableSyntax {
    return $this->_right_paren;
  }

  public function withRightParen(EditableSyntax $value): this {
    if ($value === $this->_right_paren) {
      return $this;
    }
    return new self($this->_left_paren, $this->_expression, $value);
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
}
