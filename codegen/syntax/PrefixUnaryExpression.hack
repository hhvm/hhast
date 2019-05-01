/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<25bd7ba2eb189c391e73b376b38972ae>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class PrefixUnaryExpression extends EditableNode {

  private EditableNode $_operator;
  private EditableNode $_operand;

  public function __construct(
    EditableNode $operator,
    EditableNode $operand,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_operator = $operator;
    $this->_operand = $operand;
    parent::__construct('prefix_unary_expression', $source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
  ): this {
    $offset = $initial_offset;
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
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static($operator, $operand, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'operator' => $this->_operator,
      'operand' => $this->_operand,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<EditableNode> $parents = vec[],
  ): this {
    $parents[] = $this;
    $operator = $rewriter($this->_operator, $parents);
    $operand = $rewriter($this->_operand, $parents);
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
   * @return ExclamationToken | DollarToken | AmpersandToken | PlusToken |
   * PlusPlusToken | MinusToken | MinusMinusToken | AtToken | AwaitToken |
   * CloneToken | PrintToken | TildeToken
   */
  public function getOperator(): EditableToken {
    return TypeAssert\instance_of(EditableToken::class, $this->_operator);
  }

  /**
   * @return ExclamationToken | DollarToken | AmpersandToken | PlusToken |
   * PlusPlusToken | MinusToken | MinusMinusToken | AtToken | AwaitToken |
   * CloneToken | PrintToken | TildeToken
   */
  public function getOperatorx(): EditableToken {
    return $this->getOperator();
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
   * @return AnonymousFunction | ArrayIntrinsicExpression |
   * AwaitableCreationExpression | BinaryExpression | BracedExpression |
   * CastExpression | ConditionalExpression | EmptyExpression | EvalExpression
   * | FunctionCallExpression | InclusionExpression | InstanceofExpression |
   * IsExpression | IssetExpression | LiteralExpression |
   * MemberSelectionExpression | ObjectCreationExpression |
   * ParenthesizedExpression | PipeVariableExpression | PostfixUnaryExpression
   * | PrefixUnaryExpression | QualifiedName | ScopeResolutionExpression |
   * SubscriptExpression | NameToken | VariableExpression
   */
  public function getOperand(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_operand);
  }

  /**
   * @return AnonymousFunction | ArrayIntrinsicExpression |
   * AwaitableCreationExpression | BinaryExpression | BracedExpression |
   * CastExpression | ConditionalExpression | EmptyExpression | EvalExpression
   * | FunctionCallExpression | InclusionExpression | InstanceofExpression |
   * IsExpression | IssetExpression | LiteralExpression |
   * MemberSelectionExpression | ObjectCreationExpression |
   * ParenthesizedExpression | PipeVariableExpression | PostfixUnaryExpression
   * | PrefixUnaryExpression | QualifiedName | ScopeResolutionExpression |
   * SubscriptExpression | NameToken | VariableExpression
   */
  public function getOperandx(): EditableNode {
    return $this->getOperand();
  }
}
