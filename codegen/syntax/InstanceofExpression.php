<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<14519d6ab45e6ffcbeb2955184bb0c62>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class InstanceofExpression extends EditableNode {

  private EditableNode $_left_operand;
  private EditableNode $_operator;
  private EditableNode $_right_operand;

  public function __construct(
    EditableNode $left_operand,
    EditableNode $operator,
    EditableNode $right_operand,
  ) {
    parent::__construct('instanceof_expression');
    $this->_left_operand = $left_operand;
    $this->_operator = $operator;
    $this->_right_operand = $right_operand;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
  ): this {
    $left_operand = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['instanceof_left_operand'],
      $file,
      $offset,
      $source,
    );
    $offset += $left_operand->getWidth();
    $operator = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['instanceof_operator'],
      $file,
      $offset,
      $source,
    );
    $offset += $operator->getWidth();
    $right_operand = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['instanceof_right_operand'],
      $file,
      $offset,
      $source,
    );
    $offset += $right_operand->getWidth();
    return new static($left_operand, $operator, $right_operand);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'left_operand' => $this->_left_operand,
      'operator' => $this->_operator,
      'right_operand' => $this->_right_operand,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?vec<EditableNode> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $left_operand = $this->_left_operand->rewrite($rewriter, $parents);
    $operator = $this->_operator->rewrite($rewriter, $parents);
    $right_operand = $this->_right_operand->rewrite($rewriter, $parents);
    if (
      $left_operand === $this->_left_operand &&
      $operator === $this->_operator &&
      $right_operand === $this->_right_operand
    ) {
      return $this;
    }
    return new static($left_operand, $operator, $right_operand);
  }

  public function getLeftOperandUNTYPED(): EditableNode {
    return $this->_left_operand;
  }

  public function withLeftOperand(EditableNode $value): this {
    if ($value === $this->_left_operand) {
      return $this;
    }
    return new static($value, $this->_operator, $this->_right_operand);
  }

  public function hasLeftOperand(): bool {
    return !$this->_left_operand->isMissing();
  }

  /**
   * @returns AnonymousFunction | CastExpression | FunctionCallExpression |
   * LiteralExpression | MemberSelectionExpression | ObjectCreationExpression |
   * ParenthesizedExpression | PrefixUnaryExpression |
   * ScopeResolutionExpression | SubscriptExpression | VariableExpression
   */
  public function getLeftOperand(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_left_operand);
  }

  /**
   * @returns AnonymousFunction | CastExpression | FunctionCallExpression |
   * LiteralExpression | MemberSelectionExpression | ObjectCreationExpression |
   * ParenthesizedExpression | PrefixUnaryExpression |
   * ScopeResolutionExpression | SubscriptExpression | VariableExpression
   */
  public function getLeftOperandx(): EditableNode {
    return $this->getLeftOperand();
  }

  public function getOperatorUNTYPED(): EditableNode {
    return $this->_operator;
  }

  public function withOperator(EditableNode $value): this {
    if ($value === $this->_operator) {
      return $this;
    }
    return new static($this->_left_operand, $value, $this->_right_operand);
  }

  public function hasOperator(): bool {
    return !$this->_operator->isMissing();
  }

  /**
   * @returns InstanceofToken
   */
  public function getOperator(): InstanceofToken {
    return TypeAssert\instance_of(InstanceofToken::class, $this->_operator);
  }

  /**
   * @returns InstanceofToken
   */
  public function getOperatorx(): InstanceofToken {
    return $this->getOperator();
  }

  public function getRightOperandUNTYPED(): EditableNode {
    return $this->_right_operand;
  }

  public function withRightOperand(EditableNode $value): this {
    if ($value === $this->_right_operand) {
      return $this;
    }
    return new static($this->_left_operand, $this->_operator, $value);
  }

  public function hasRightOperand(): bool {
    return !$this->_right_operand->isMissing();
  }

  /**
   * @returns MemberSelectionExpression | ParenthesizedExpression |
   * QualifiedName | ScopeResolutionExpression | SubscriptExpression |
   * NameToken | VariableExpression
   */
  public function getRightOperand(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_right_operand);
  }

  /**
   * @returns MemberSelectionExpression | ParenthesizedExpression |
   * QualifiedName | ScopeResolutionExpression | SubscriptExpression |
   * NameToken | VariableExpression
   */
  public function getRightOperandx(): EditableNode {
    return $this->getRightOperand();
  }
}
