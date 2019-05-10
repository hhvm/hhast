/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<18721d6a797b6a09fe3b89a0e3c6daf6>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class InstanceofExpression
  extends EditableNode
  implements ILambdaBody, IExpression {

  private EditableNode $_left_operand;
  private EditableNode $_operator;
  private EditableNode $_right_operand;

  public function __construct(
    EditableNode $left_operand,
    EditableNode $operator,
    EditableNode $right_operand,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_left_operand = $left_operand;
    $this->_operator = $operator;
    $this->_right_operand = $right_operand;
    parent::__construct('instanceof_expression', $source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
  ): this {
    $offset = $initial_offset;
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
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static($left_operand, $operator, $right_operand, $source_ref);
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
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<EditableNode> $parents = vec[],
  ): this {
    $parents[] = $this;
    $left_operand = $rewriter($this->_left_operand, $parents);
    $operator = $rewriter($this->_operator, $parents);
    $right_operand = $rewriter($this->_right_operand, $parents);
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
   * @return AnonymousFunction | CastExpression | FunctionCallExpression |
   * LiteralExpression | MemberSelectionExpression | ObjectCreationExpression |
   * ParenthesizedExpression | PipeVariableExpression | PrefixUnaryExpression |
   * ScopeResolutionExpression | SubscriptExpression | VariableExpression
   */
  <<__Memoize>>
  public function getLeftOperand(): IExpression {
    return __Private\Wrap\wrap_IExpression($this->_left_operand);
  }

  /**
   * @return AnonymousFunction | CastExpression | FunctionCallExpression |
   * LiteralExpression | MemberSelectionExpression | ObjectCreationExpression |
   * ParenthesizedExpression | PipeVariableExpression | PrefixUnaryExpression |
   * ScopeResolutionExpression | SubscriptExpression | VariableExpression
   */
  public function getLeftOperandx(): IExpression {
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
   * @return InstanceofToken
   */
  public function getOperator(): InstanceofToken {
    return TypeAssert\instance_of(InstanceofToken::class, $this->_operator);
  }

  /**
   * @return InstanceofToken
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
   * @return MemberSelectionExpression | ParenthesizedExpression |
   * QualifiedName | ScopeResolutionExpression | SubscriptExpression |
   * NameToken | VariableExpression
   */
  <<__Memoize>>
  public function getRightOperand(): IExpression {
    return __Private\Wrap\wrap_IExpression($this->_right_operand);
  }

  /**
   * @return MemberSelectionExpression | ParenthesizedExpression |
   * QualifiedName | ScopeResolutionExpression | SubscriptExpression |
   * NameToken | VariableExpression
   */
  public function getRightOperandx(): IExpression {
    return $this->getRightOperand();
  }
}
