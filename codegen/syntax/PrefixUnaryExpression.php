<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<761fcb4cc7929fed745572261da643d5>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class PrefixUnaryExpression extends EditableSyntax {

  private EditableSyntax $_operator;
  private EditableSyntax $_operand;

  public function __construct(
    EditableSyntax $operator,
    EditableSyntax $operand,
  ) {
    parent::__construct('prefix_unary_expression');
    $this->_operator = $operator;
    $this->_operand = $operand;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $operator = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['prefix_unary_operator'],
      $position,
      $source,
    );
    $position += $operator->getWidth();
    $operand = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['prefix_unary_operand'],
      $position,
      $source,
    );
    $position += $operand->getWidth();
    return new self($operator, $operand);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'operator' => $this->_operator;
    yield 'operand' => $this->_operand;
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
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

  public function getOperatorUNTYPED(): EditableSyntax {
    return $this->_operator;
  }

  public function withOperator(EditableSyntax $value): this {
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

  public function getOperandUNTYPED(): EditableSyntax {
    return $this->_operand;
  }

  public function withOperand(EditableSyntax $value): this {
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
  public function getOperand(): EditableSyntax {
    return TypeAssert\instance_of(EditableSyntax::class, $this->_operand);
  }
}
