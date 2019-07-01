/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<cab82213df2fa282f6103f3ea01f9abd>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class InstanceofExpression
  extends Node
  implements ILambdaBody, IExpression {

  const string SYNTAX_KIND = 'instanceof_expression';

  private IExpression $_left_operand;
  private InstanceofToken $_operator;
  private Node $_right_operand;

  public function __construct(
    IExpression $left_operand,
    InstanceofToken $operator,
    Node $right_operand,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_left_operand = $left_operand;
    $this->_operator = $operator;
    $this->_right_operand = $right_operand;
    parent::__construct($source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
    string $_type_hint,
  ): this {
    $offset = $initial_offset;
    $left_operand = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['instanceof_left_operand'],
      $file,
      $offset,
      $source,
      'IExpression',
    );
    $left_operand = $left_operand as nonnull;
    $offset += $left_operand->getWidth();
    $operator = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['instanceof_operator'],
      $file,
      $offset,
      $source,
      'InstanceofToken',
    );
    $operator = $operator as nonnull;
    $offset += $operator->getWidth();
    $right_operand = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['instanceof_right_operand'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $right_operand = $right_operand as nonnull;
    $offset += $right_operand->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $left_operand,
      /* HH_IGNORE_ERROR[4110] */ $operator,
      /* HH_IGNORE_ERROR[4110] */ $right_operand,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'left_operand' => $this->_left_operand,
      'operator' => $this->_operator,
      'right_operand' => $this->_right_operand,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
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
    return new static(
      /* HH_FIXME[4110] use `as` */ $left_operand,
      /* HH_FIXME[4110] use `as` */ $operator,
      /* HH_FIXME[4110] use `as` */ $right_operand,
    );
  }

  public function getLeftOperandUNTYPED(): ?Node {
    return $this->_left_operand;
  }

  public function withLeftOperand(IExpression $value): this {
    if ($value === $this->_left_operand) {
      return $this;
    }
    return new static($value, $this->_operator, $this->_right_operand);
  }

  public function hasLeftOperand(): bool {
    return $this->_left_operand !== null;
  }

  /**
   * @return AnonymousFunction | CastExpression | FunctionCallExpression |
   * LiteralExpression | MemberSelectionExpression | ObjectCreationExpression |
   * ParenthesizedExpression | PipeVariableExpression | PrefixUnaryExpression |
   * ScopeResolutionExpression | SubscriptExpression | VariableExpression
   */
  public function getLeftOperand(): IExpression {
    return TypeAssert\instance_of(IExpression::class, $this->_left_operand);
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

  public function getOperatorUNTYPED(): ?Node {
    return $this->_operator;
  }

  public function withOperator(InstanceofToken $value): this {
    if ($value === $this->_operator) {
      return $this;
    }
    return new static($this->_left_operand, $value, $this->_right_operand);
  }

  public function hasOperator(): bool {
    return $this->_operator !== null;
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

  public function getRightOperandUNTYPED(): ?Node {
    return $this->_right_operand;
  }

  public function withRightOperand(Node $value): this {
    if ($value === $this->_right_operand) {
      return $this;
    }
    return new static($this->_left_operand, $this->_operator, $value);
  }

  public function hasRightOperand(): bool {
    return $this->_right_operand !== null;
  }

  /**
   * @return member_selection_expression | parenthesized_expression |
   * qualified_name | scope_resolution_expression | subscript_expression |
   * token:name | variable
   */
  public function getRightOperand(): Node {
    return $this->_right_operand;
  }

  /**
   * @return member_selection_expression | parenthesized_expression |
   * qualified_name | scope_resolution_expression | subscript_expression |
   * token:name | variable
   */
  public function getRightOperandx(): Node {
    return $this->getRightOperand();
  }
}
