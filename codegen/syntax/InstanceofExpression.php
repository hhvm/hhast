<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<77e68e21c7d8807f35fff8d259767146>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class InstanceofExpression extends EditableSyntax {

  private EditableSyntax $_left_operand;
  private EditableSyntax $_operator;
  private EditableSyntax $_right_operand;

  public function __construct(
    EditableSyntax $left_operand,
    EditableSyntax $operator,
    EditableSyntax $right_operand,
  ) {
    parent::__construct('instanceof_expression');
    $this->_left_operand = $left_operand;
    $this->_operator = $operator;
    $this->_right_operand = $right_operand;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $left_operand = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['instanceof_left_operand'],
      $position,
      $source,
    );
    $position += $left_operand->getWidth();
    $operator = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['instanceof_operator'],
      $position,
      $source,
    );
    $position += $operator->getWidth();
    $right_operand = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['instanceof_right_operand'],
      $position,
      $source,
    );
    $position += $right_operand->getWidth();
    return new self($left_operand, $operator, $right_operand);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'left_operand' => $this->_left_operand;
    yield 'operator' => $this->_operator;
    yield 'right_operand' => $this->_right_operand;
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
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
    return new self($left_operand, $operator, $right_operand);
  }

  public function getLeftOperandUNTYPED(): EditableSyntax {
    return $this->_left_operand;
  }

  public function withLeftOperand(EditableSyntax $value): this {
    if ($value === $this->_left_operand) {
      return $this;
    }
    return new self($value, $this->_operator, $this->_right_operand);
  }

  public function hasLeftOperand(): bool {
    return !$this->_left_operand->isMissing();
  }

  /**
   * @returns VariableExpression | SubscriptExpression | FunctionCallExpression
   * | ParenthesizedExpression | MemberSelectionExpression |
   * ObjectCreationExpression | ScopeResolutionExpression | AnonymousFunction |
   * LiteralExpression
   */
  public function getLeftOperand(): EditableSyntax {
    return TypeAssert\instance_of(EditableSyntax::class, $this->_left_operand);
  }

  public function getOperatorUNTYPED(): EditableSyntax {
    return $this->_operator;
  }

  public function withOperator(EditableSyntax $value): this {
    if ($value === $this->_operator) {
      return $this;
    }
    return new self($this->_left_operand, $value, $this->_right_operand);
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

  public function getRightOperandUNTYPED(): EditableSyntax {
    return $this->_right_operand;
  }

  public function withRightOperand(EditableSyntax $value): this {
    if ($value === $this->_right_operand) {
      return $this;
    }
    return new self($this->_left_operand, $this->_operator, $value);
  }

  public function hasRightOperand(): bool {
    return !$this->_right_operand->isMissing();
  }

  /**
   * @returns QualifiedNameExpression | VariableExpression |
   * ScopeResolutionExpression | SubscriptExpression |
   * MemberSelectionExpression | ParenthesizedExpression
   */
  public function getRightOperand(): EditableSyntax {
    return TypeAssert\instance_of(EditableSyntax::class, $this->_right_operand);
  }
}
