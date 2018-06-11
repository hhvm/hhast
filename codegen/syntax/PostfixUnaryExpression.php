<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<48dd922cad87d153dfed84da46bc720d>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class PostfixUnaryExpression extends EditableNode {

  private EditableNode $_operand;
  private EditableNode $_operator;

  public function __construct(EditableNode $operand, EditableNode $operator) {
    parent::__construct('postfix_unary_expression');
    $this->_operand = $operand;
    $this->_operator = $operator;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
  ): this {
    $operand = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['postfix_unary_operand'],
      $file,
      $offset,
      $source,
    );
    $offset += $operand->getWidth();
    $operator = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['postfix_unary_operator'],
      $file,
      $offset,
      $source,
    );
    $offset += $operator->getWidth();
    return new static($operand, $operator);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'operand' => $this->_operand,
      'operator' => $this->_operator,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?vec<EditableNode> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $operand = $this->_operand->rewrite($rewriter, $parents);
    $operator = $this->_operator->rewrite($rewriter, $parents);
    if ($operand === $this->_operand && $operator === $this->_operator) {
      return $this;
    }
    return new static($operand, $operator);
  }

  public function getOperandUNTYPED(): EditableNode {
    return $this->_operand;
  }

  public function withOperand(EditableNode $value): this {
    if ($value === $this->_operand) {
      return $this;
    }
    return new static($value, $this->_operator);
  }

  public function hasOperand(): bool {
    return !$this->_operand->isMissing();
  }

  /**
   * @returns MemberSelectionExpression | PrefixUnaryExpression |
   * ScopeResolutionExpression | SubscriptExpression | VariableExpression
   */
  public function getOperand(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_operand);
  }

  public function getOperatorUNTYPED(): EditableNode {
    return $this->_operator;
  }

  public function withOperator(EditableNode $value): this {
    if ($value === $this->_operator) {
      return $this;
    }
    return new static($this->_operand, $value);
  }

  public function hasOperator(): bool {
    return !$this->_operator->isMissing();
  }

  /**
   * @returns PlusPlusToken | MinusMinusToken
   */
  public function getOperator(): EditableToken {
    return TypeAssert\instance_of(EditableToken::class, $this->_operator);
  }
}
