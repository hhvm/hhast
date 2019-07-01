/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<0f4adc1a69a70757f002c2ae241ab4f5>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class PrefixUnaryExpression
  extends Node
  implements IHasOperator, ILambdaBody, IExpression {

  const string SYNTAX_KIND = 'prefix_unary_expression';

  private Node $_operator;
  private Node $_operand;

  public function __construct(
    Node $operator,
    Node $operand,
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
    $offset += $operator->getWidth();
    $operand = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['prefix_unary_operand'],
      $file,
      $offset,
      $source,
      'IExpression',
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
  public function getChildren(): dict<string, Node> {
    return dict[
      'operator' => $this->_operator,
      'operand' => $this->_operand,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $operator = $rewriter($this->_operator, $parents);
    $operand = $rewriter($this->_operand, $parents);
    if ($operator === $this->_operator && $operand === $this->_operand) {
      return $this;
    }
    return new static($operator, $operand);
  }

  public function getOperatorUNTYPED(): Node {
    return $this->_operator;
  }

  public function withOperator(Node $value): this {
    if ($value === $this->_operator) {
      return $this;
    }
    return new static($value, $this->_operand);
  }

  public function hasOperator(): bool {
    return !$this->_operator->isMissing();
  }

  /**
   * @return ExclamationToken | AmpersandToken | PlusToken | PlusPlusToken |
   * MinusToken | MinusMinusToken | AtToken | AwaitToken | CloneToken |
   * PrintToken | TildeToken
   */
  public function getOperator(): Token {
    return TypeAssert\instance_of(Token::class, $this->_operator);
  }

  /**
   * @return ExclamationToken | AmpersandToken | PlusToken | PlusPlusToken |
   * MinusToken | MinusMinusToken | AtToken | AwaitToken | CloneToken |
   * PrintToken | TildeToken
   */
  public function getOperatorx(): Token {
    return $this->getOperator();
  }

  public function getOperandUNTYPED(): Node {
    return $this->_operand;
  }

  public function withOperand(Node $value): this {
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
   * AwaitableCreationExpression | BinaryExpression | CastExpression |
   * ConditionalExpression | EvalExpression | FunctionCallExpression |
   * InclusionExpression | InstanceofExpression | IsExpression |
   * IssetExpression | LiteralExpression | MemberSelectionExpression |
   * ObjectCreationExpression | ParenthesizedExpression |
   * PostfixUnaryExpression | PrefixUnaryExpression | QualifiedName |
   * ScopeResolutionExpression | SubscriptExpression | NameToken |
   * VariableExpression
   */
  public function getOperand(): IExpression {
    return TypeAssert\instance_of(IExpression::class, $this->_operand);
  }

  /**
   * @return AnonymousFunction | ArrayIntrinsicExpression |
   * AwaitableCreationExpression | BinaryExpression | CastExpression |
   * ConditionalExpression | EvalExpression | FunctionCallExpression |
   * InclusionExpression | InstanceofExpression | IsExpression |
   * IssetExpression | LiteralExpression | MemberSelectionExpression |
   * ObjectCreationExpression | ParenthesizedExpression |
   * PostfixUnaryExpression | PrefixUnaryExpression | QualifiedName |
   * ScopeResolutionExpression | SubscriptExpression | NameToken |
   * VariableExpression
   */
  public function getOperandx(): IExpression {
    return $this->getOperand();
  }
}
