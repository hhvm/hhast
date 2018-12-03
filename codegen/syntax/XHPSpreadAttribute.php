<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<08b588245b3ec90bb0c2d7b60b132a18>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class XHPSpreadAttribute extends EditableNode {

  private EditableNode $_left_brace;
  private EditableNode $_spread_operator;
  private EditableNode $_expression;
  private EditableNode $_right_brace;

  public function __construct(
    EditableNode $left_brace,
    EditableNode $spread_operator,
    EditableNode $expression,
    EditableNode $right_brace,
  ) {
    parent::__construct('xhp_spread_attribute');
    $this->_left_brace = $left_brace;
    $this->_spread_operator = $spread_operator;
    $this->_expression = $expression;
    $this->_right_brace = $right_brace;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
  ): this {
    $left_brace = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['xhp_spread_attribute_left_brace'],
      $file,
      $offset,
      $source,
    );
    $offset += $left_brace->getWidth();
    $spread_operator = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['xhp_spread_attribute_spread_operator'],
      $file,
      $offset,
      $source,
    );
    $offset += $spread_operator->getWidth();
    $expression = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['xhp_spread_attribute_expression'],
      $file,
      $offset,
      $source,
    );
    $offset += $expression->getWidth();
    $right_brace = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['xhp_spread_attribute_right_brace'],
      $file,
      $offset,
      $source,
    );
    $offset += $right_brace->getWidth();
    return new static($left_brace, $spread_operator, $expression, $right_brace);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'left_brace' => $this->_left_brace,
      'spread_operator' => $this->_spread_operator,
      'expression' => $this->_expression,
      'right_brace' => $this->_right_brace,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?vec<EditableNode> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $left_brace = $this->_left_brace->rewrite($rewriter, $parents);
    $spread_operator = $this->_spread_operator->rewrite($rewriter, $parents);
    $expression = $this->_expression->rewrite($rewriter, $parents);
    $right_brace = $this->_right_brace->rewrite($rewriter, $parents);
    if (
      $left_brace === $this->_left_brace &&
      $spread_operator === $this->_spread_operator &&
      $expression === $this->_expression &&
      $right_brace === $this->_right_brace
    ) {
      return $this;
    }
    return new static($left_brace, $spread_operator, $expression, $right_brace);
  }

  public function getLeftBraceUNTYPED(): EditableNode {
    return $this->_left_brace;
  }

  public function withLeftBrace(EditableNode $value): this {
    if ($value === $this->_left_brace) {
      return $this;
    }
    return new static(
      $value,
      $this->_spread_operator,
      $this->_expression,
      $this->_right_brace,
    );
  }

  public function hasLeftBrace(): bool {
    return !$this->_left_brace->isMissing();
  }

  /**
   * @return LeftBraceToken
   */
  public function getLeftBrace(): LeftBraceToken {
    return TypeAssert\instance_of(LeftBraceToken::class, $this->_left_brace);
  }

  /**
   * @return LeftBraceToken
   */
  public function getLeftBracex(): LeftBraceToken {
    return $this->getLeftBrace();
  }

  public function getSpreadOperatorUNTYPED(): EditableNode {
    return $this->_spread_operator;
  }

  public function withSpreadOperator(EditableNode $value): this {
    if ($value === $this->_spread_operator) {
      return $this;
    }
    return new static(
      $this->_left_brace,
      $value,
      $this->_expression,
      $this->_right_brace,
    );
  }

  public function hasSpreadOperator(): bool {
    return !$this->_spread_operator->isMissing();
  }

  /**
   * @return DotDotDotToken
   */
  public function getSpreadOperator(): DotDotDotToken {
    return
      TypeAssert\instance_of(DotDotDotToken::class, $this->_spread_operator);
  }

  /**
   * @return DotDotDotToken
   */
  public function getSpreadOperatorx(): DotDotDotToken {
    return $this->getSpreadOperator();
  }

  public function getExpressionUNTYPED(): EditableNode {
    return $this->_expression;
  }

  public function withExpression(EditableNode $value): this {
    if ($value === $this->_expression) {
      return $this;
    }
    return new static(
      $this->_left_brace,
      $this->_spread_operator,
      $value,
      $this->_right_brace,
    );
  }

  public function hasExpression(): bool {
    return !$this->_expression->isMissing();
  }

  /**
   * @return VariableExpression | XHPExpression
   */
  public function getExpression(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_expression);
  }

  /**
   * @return VariableExpression | XHPExpression
   */
  public function getExpressionx(): EditableNode {
    return $this->getExpression();
  }

  public function getRightBraceUNTYPED(): EditableNode {
    return $this->_right_brace;
  }

  public function withRightBrace(EditableNode $value): this {
    if ($value === $this->_right_brace) {
      return $this;
    }
    return new static(
      $this->_left_brace,
      $this->_spread_operator,
      $this->_expression,
      $value,
    );
  }

  public function hasRightBrace(): bool {
    return !$this->_right_brace->isMissing();
  }

  /**
   * @return RightBraceToken
   */
  public function getRightBrace(): RightBraceToken {
    return TypeAssert\instance_of(RightBraceToken::class, $this->_right_brace);
  }

  /**
   * @return RightBraceToken
   */
  public function getRightBracex(): RightBraceToken {
    return $this->getRightBrace();
  }
}
