/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<184e0182a1ce32c7e1b46cd9ad2cc966>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class PrefixUnaryExpression
  extends Node
  implements IHasOperator, ILambdaBody, IExpression {

  const string SYNTAX_KIND = 'prefix_unary_expression';

  private Token $_operator;
  private IExpression $_operand;

  public function __construct(
    Token $operator,
    IExpression $operand,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_operator = $operator;
    $this->_operand = $operand;
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
    $operator = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['prefix_unary_operator'],
      $file,
      $offset,
      $source,
      'Token',
    );
    $operator = $operator as nonnull;
    $offset += $operator->getWidth();
    $operand = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['prefix_unary_operand'],
      $file,
      $offset,
      $source,
      'IExpression',
    );
    $operand = $operand as nonnull;
    $offset += $operand->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $operator,
      /* HH_IGNORE_ERROR[4110] */ $operand,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'operator' => $this->_operator,
      'operand' => $this->_operand,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $operator = $rewriter($this->_operator, $parents);
    $operand = $rewriter($this->_operand, $parents);
    if ($operator === $this->_operator && $operand === $this->_operand) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $operator,
      /* HH_FIXME[4110] use `as` */ $operand,
    );
  }

  public function getOperatorUNTYPED(): ?Node {
    return $this->_operator;
  }

  public function withOperator(Token $value): this {
    if ($value === $this->_operator) {
      return $this;
    }
    return new static($value, $this->_operand);
  }

  public function hasOperator(): bool {
    return $this->_operator !== null;
  }

  /**
   * @return ExclamationToken | PlusToken | PlusPlusToken | MinusToken |
   * MinusMinusToken | AtToken | AwaitToken | CloneToken | PrintToken |
   * TildeToken
   */
  public function getOperator(): Token {
    return TypeAssert\instance_of(Token::class, $this->_operator);
  }

  /**
   * @return ExclamationToken | PlusToken | PlusPlusToken | MinusToken |
   * MinusMinusToken | AtToken | AwaitToken | CloneToken | PrintToken |
   * TildeToken
   */
  public function getOperatorx(): Token {
    return $this->getOperator();
  }

  public function getOperandUNTYPED(): ?Node {
    return $this->_operand;
  }

  public function withOperand(IExpression $value): this {
    if ($value === $this->_operand) {
      return $this;
    }
    return new static($this->_operator, $value);
  }

  public function hasOperand(): bool {
    return $this->_operand !== null;
  }

  /**
   * @return AnonymousFunction | AwaitableCreationExpression | BinaryExpression
   * | CastExpression | ConditionalExpression | DarrayIntrinsicExpression |
   * EvalExpression | FunctionCallExpression | IsExpression | IssetExpression |
   * LiteralExpression | MemberSelectionExpression | ObjectCreationExpression |
   * ParenthesizedExpression | PostfixUnaryExpression | PrefixUnaryExpression |
   * QualifiedName | ScopeResolutionExpression | SubscriptExpression |
   * NameToken | VariableExpression | VarrayIntrinsicExpression
   */
  public function getOperand(): IExpression {
    return TypeAssert\instance_of(IExpression::class, $this->_operand);
  }

  /**
   * @return AnonymousFunction | AwaitableCreationExpression | BinaryExpression
   * | CastExpression | ConditionalExpression | DarrayIntrinsicExpression |
   * EvalExpression | FunctionCallExpression | IsExpression | IssetExpression |
   * LiteralExpression | MemberSelectionExpression | ObjectCreationExpression |
   * ParenthesizedExpression | PostfixUnaryExpression | PrefixUnaryExpression |
   * QualifiedName | ScopeResolutionExpression | SubscriptExpression |
   * NameToken | VariableExpression | VarrayIntrinsicExpression
   */
  public function getOperandx(): IExpression {
    return $this->getOperand();
  }
}
