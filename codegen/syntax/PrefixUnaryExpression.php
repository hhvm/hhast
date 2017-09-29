<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<36fbff0ce93652519b225a64f329f2aa>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

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
    return new self($operator, $operand);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableNode> {
    return dict[
      'operator' => $this->_operator,
      'operand' => $this->_operand,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?Traversable<EditableNode> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $operator = $this->_operator->rewrite($rewriter, $parents);
    $operand = $this->_operand->rewrite($rewriter, $parents);
    if ($operator === $this->_operator && $operand === $this->_operand) {
      return $this;
    }
    return new self($operator, $operand);
  }

  public function getOperatorUNTYPED(): EditableNode {
    return $this->_operator;
  }

  public function withOperator(EditableNode $value): this {
    if ($value === $this->_operator) {
      return $this;
    }
    return new self($value, $this->_operand);
  }

  public function hasOperator(): bool {
    return !$this->_operator->isMissing();
  }

  /**
   * @returns PrintToken | MinusToken | AmpersandToken | TildeToken |
   * ExclamationToken | DollarToken | PlusPlusToken | MinusMinusToken | AtToken
   * | AwaitToken | CloneToken | PlusToken
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
    return new self($this->_operator, $value);
  }

  public function hasOperand(): bool {
    return !$this->_operand->isMissing();
  }

  /**
   * @returns LiteralExpression | VariableExpression | QualifiedNameExpression
   * | FunctionCallExpression | IssetExpression | BracedExpression |
   * BinaryExpression | ScopeResolutionExpression | SubscriptExpression |
   * ParenthesizedExpression | VariableToken | MemberSelectionExpression |
   * ObjectCreationExpression | PostfixUnaryExpression | PrefixUnaryExpression
   * | InclusionExpression | CastExpression | EmptyExpression |
   * ConditionalExpression | EvalExpression | DefineExpression |
   * SafeMemberSelectionExpression | PipeVariableExpression |
   * ArrayIntrinsicExpression | EndOfFileToken | LessThanToken |
   * InstanceofExpression
   */
  public function getOperand(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_operand);
  }
}
