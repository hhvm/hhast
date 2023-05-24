/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<17181cb4a47c13c80c83a97f089530ae>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;
/* HHAST_IGNORE_ALL[5607] 5607 is ignored because of false positives when comparing a generic to a typed value */
/* HHAST_IGNORE_ALL[5624] HHAST_IGNORE_ALL[5639] 5624 and 5639 are ignored because they insist on using co(tra)variant generics. Could this break external consumers? */

<<__ConsistentConstruct>>
final class IsExpression extends Node implements ILambdaBody, IExpression {

  const string SYNTAX_KIND = 'is_expression';

  private IExpression $_left_operand;
  private IsToken $_operator;
  private ITypeSpecifier $_right_operand;

  public function __construct(
    IExpression $left_operand,
    IsToken $operator,
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
    dict<arraykey, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
    string $_type_hint,
  ): this {
    $offset = $initial_offset;
    $left_operand = Node::fromJSON(
      ($json['is_left_operand']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'IExpression',
    );
    $left_operand = $left_operand as nonnull;
    $offset += $left_operand->getWidth();
    $operator = Node::fromJSON(
      ($json['is_operator']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'IsToken',
    );
    $operator = $operator as nonnull;
    $offset += $operator->getWidth();
    $right_operand = Node::fromJSON(
      ($json['is_right_operand']) as dict<_, _>,
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
      $left_operand as IExpression,
      $operator as IsToken,
      $right_operand as ITypeSpecifier,
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
      $left_operand as IExpression,
      $operator as IsToken,
      $right_operand as ITypeSpecifier,
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
    return true;
  }

  /**
   * @return AnonymousFunction | AsExpression | FunctionCallExpression |
   * LiteralExpression | MemberSelectionExpression | ObjectCreationExpression |
   * ParenthesizedExpression | PipeVariableExpression | PrefixUnaryExpression |
   * ScopeResolutionExpression | ShapeExpression | SubscriptExpression |
   * TupleExpression | VariableExpression
   */
  public function getLeftOperand(): IExpression {
    return TypeAssert\instance_of(IExpression::class, $this->_left_operand);
  }

  /**
   * @return AnonymousFunction | AsExpression | FunctionCallExpression |
   * LiteralExpression | MemberSelectionExpression | ObjectCreationExpression |
   * ParenthesizedExpression | PipeVariableExpression | PrefixUnaryExpression |
   * ScopeResolutionExpression | ShapeExpression | SubscriptExpression |
   * TupleExpression | VariableExpression
   */
  public function getLeftOperandx(): IExpression {
    return $this->getLeftOperand();
  }

  public function getOperatorUNTYPED(): ?Node {
    return $this->_operator;
  }

  public function withOperator(IsToken $value): this {
    if ($value === $this->_operator) {
      return $this;
    }
    return new static($this->_left_operand, $value, $this->_right_operand);
  }

  public function hasOperator(): bool {
    return true;
  }

  /**
   * @return IsToken
   */
  public function getOperator(): IsToken {
    return TypeAssert\instance_of(IsToken::class, $this->_operator);
  }

  /**
   * @return IsToken
   */
  public function getOperatorx(): IsToken {
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
    return true;
  }

  /**
   * @return DictionaryTypeSpecifier | GenericTypeSpecifier |
   * KeysetTypeSpecifier | NullableTypeSpecifier | ShapeTypeSpecifier |
   * SimpleTypeSpecifier | TupleTypeSpecifier | TypeConstant |
   * VectorTypeSpecifier
   */
  public function getRightOperand(): ITypeSpecifier {
    return TypeAssert\instance_of(ITypeSpecifier::class, $this->_right_operand);
  }

  /**
   * @return DictionaryTypeSpecifier | GenericTypeSpecifier |
   * KeysetTypeSpecifier | NullableTypeSpecifier | ShapeTypeSpecifier |
   * SimpleTypeSpecifier | TupleTypeSpecifier | TypeConstant |
   * VectorTypeSpecifier
   */
  public function getRightOperandx(): ITypeSpecifier {
    return $this->getRightOperand();
  }
}
