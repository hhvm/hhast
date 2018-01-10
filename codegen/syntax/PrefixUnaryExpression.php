<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<15737a0b9c3e25a5949dd5eeec93fa4f>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class PrefixUnaryExpression extends EditableNode {

  private EditableNode $_operator;
  private EditableNode $_operand;

  public function __construct(EditableNode $operator, EditableNode $operand) {
    parent::__construct('prefix_unary_expression');
    $this->_operator = $operator;
    $this->_operand = $operand;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
  ): this {
    $operator = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['prefix_unary_operator'],
      $file,
      $offset,
      $source,
    );
    $offset += $operator->getWidth();
    $operand = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['prefix_unary_operand'],
      $file,
      $offset,
      $source,
    );
    $offset += $operand->getWidth();
    return new static($operator, $operand);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'operator' => $this->_operator,
      'operand' => $this->_operand,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?vec<EditableNode> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $operator = $this->_operator->rewrite($rewriter, $parents);
    $operand = $this->_operand->rewrite($rewriter, $parents);
    if ($operator === $this->_operator && $operand === $this->_operand) {
      return $this;
    }
    return new static($operator, $operand);
  }

  public function getOperatorUNTYPED(): EditableNode {
    return $this->_operator;
  }

  public function withOperator(EditableNode $value): this {
    if ($value === $this->_operator) {
      return $this;
    }
    return new static($value, $this->_operand);
  }

  public function hasOperator(): bool {
    return !$this->_operator->isMissing();
  }

  /**
   * @returns ExclamationToken | MinusToken | TildeToken | PrintToken |
   * PlusPlusToken | MinusMinusToken | DollarToken | AmpersandToken |
   * CloneToken | AtToken | AwaitToken | PlusToken | SuspendToken
   */
  public function getOperator(): EditableToken {
    return TypeAssert\instance_of(EditableToken::class, $this->_operator);
  }

  public function getOperandUNTYPED(): EditableNode {
    return $this->_operand;
  }

  public function withOperand(EditableNode $value): this {
    if ($value === $this->_operand) {
      return $this;
    }
    return new static($this->_operator, $value);
  }

  public function hasOperand(): bool {
    return !$this->_operand->isMissing();
  }

  /**
   * @returns VariableExpression | LiteralExpression |
   * MemberSelectionExpression | NameToken | FunctionCallExpression |
   * IssetExpression | ParenthesizedExpression | SubscriptExpression |
   * BinaryExpression | VariableToken | BracedExpression |
   * ScopeResolutionExpression | ObjectCreationExpression |
   * PostfixUnaryExpression | InclusionExpression | PrefixUnaryExpression |
   * CastExpression | EmptyExpression | ConditionalExpression |
   * DefineExpression | InstanceofExpression | ArrayIntrinsicExpression |
   * EndOfFileToken | EvalExpression | SafeMemberSelectionExpression |
   * PipeVariableExpression
   */
  public function getOperand(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_operand);
  }
}
