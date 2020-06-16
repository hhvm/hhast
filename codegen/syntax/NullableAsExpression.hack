/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<bf598b138bee78ac85338e970f649dfd>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class NullableAsExpression
  extends Node
  implements ILambdaBody, IExpression {

  const string SYNTAX_KIND = 'nullable_as_expression';

  private IExpression $_left_operand;
  private QuestionAsToken $_operator;
  private ITypeSpecifier $_right_operand;

  public function __construct(
    IExpression $left_operand,
    QuestionAsToken $operator,
    ITypeSpecifier $right_operand,
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
      /* HH_FIXME[4110] */ $json['nullable_as_left_operand'],
      $file,
      $offset,
      $source,
      'IExpression',
    );
    $left_operand = $left_operand as nonnull;
    $offset += $left_operand->getWidth();
    $operator = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['nullable_as_operator'],
      $file,
      $offset,
      $source,
      'QuestionAsToken',
    );
    $operator = $operator as nonnull;
    $offset += $operator->getWidth();
    $right_operand = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['nullable_as_right_operand'],
      $file,
      $offset,
      $source,
      'ITypeSpecifier',
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
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
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
   * @return FunctionCallExpression | VariableExpression
   */
  public function getLeftOperand(): IExpression {
    return TypeAssert\instance_of(IExpression::class, $this->_left_operand);
  }

  /**
   * @return FunctionCallExpression | VariableExpression
   */
  public function getLeftOperandx(): IExpression {
    return $this->getLeftOperand();
  }

  public function getOperatorUNTYPED(): ?Node {
    return $this->_operator;
  }

  public function withOperator(QuestionAsToken $value): this {
    if ($value === $this->_operator) {
      return $this;
    }
    return new static($this->_left_operand, $value, $this->_right_operand);
  }

  public function hasOperator(): bool {
    return $this->_operator !== null;
  }

  /**
   * @return QuestionAsToken
   */
  public function getOperator(): QuestionAsToken {
    return TypeAssert\instance_of(QuestionAsToken::class, $this->_operator);
  }

  /**
   * @return QuestionAsToken
   */
  public function getOperatorx(): QuestionAsToken {
    return $this->getOperator();
  }

  public function getRightOperandUNTYPED(): ?Node {
    return $this->_right_operand;
  }

  public function withRightOperand(ITypeSpecifier $value): this {
    if ($value === $this->_right_operand) {
      return $this;
    }
    return new static($this->_left_operand, $this->_operator, $value);
  }

  public function hasRightOperand(): bool {
    return $this->_right_operand !== null;
  }

  /**
   * @return SimpleTypeSpecifier | VectorTypeSpecifier
   */
  public function getRightOperand(): ITypeSpecifier {
    return TypeAssert\instance_of(ITypeSpecifier::class, $this->_right_operand);
  }

  /**
   * @return SimpleTypeSpecifier | VectorTypeSpecifier
   */
  public function getRightOperandx(): ITypeSpecifier {
    return $this->getRightOperand();
  }
}
