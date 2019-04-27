/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<3ac39f33d10c4581c0d662ccc6ea5033>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class PostfixUnaryExpression extends EditableNode {

  private EditableNode $_operand;
  private EditableNode $_operator;

  public function __construct(
    EditableNode $operand,
    EditableNode $operator,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_operand = $operand;
    $this->_operator = $operator;
    parent::__construct('postfix_unary_expression', $source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
  ): this {
    $offset = $initial_offset;
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
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static($operand, $operator, $source_ref);
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
    vec<EditableNode> $parents = vec[],
  ): this {
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
   * @return MemberSelectionExpression | ScopeResolutionExpression |
   * SubscriptExpression | VariableExpression
   */
  public function getOperand(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_operand);
  }

  /**
   * @return MemberSelectionExpression | ScopeResolutionExpression |
   * SubscriptExpression | VariableExpression
   */
  public function getOperandx(): EditableNode {
    return $this->getOperand();
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
   * @return PlusPlusToken | MinusMinusToken
   */
  public function getOperator(): EditableToken {
    return TypeAssert\instance_of(EditableToken::class, $this->_operator);
  }

  /**
   * @return PlusPlusToken | MinusMinusToken
   */
  public function getOperatorx(): EditableToken {
    return $this->getOperator();
  }
}
