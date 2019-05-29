/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<457b099fcd9365daaad94cb88172851f>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class PostfixUnaryExpression
  extends Node
  implements IHasOperator, ILambdaBody, IExpression {

  const string SYNTAX_KIND = 'postfix_unary_expression';

  private Node $_operand;
  private Node $_operator;

  public function __construct(
    Node $operand,
    Node $operator,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_operand = $operand;
    $this->_operator = $operator;
    parent::__construct($source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
  ): this {
    $offset = $initial_offset;
    $operand = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['postfix_unary_operand'],
      $file,
      $offset,
      $source,
    );
    $offset += $operand->getWidth();
    $operator = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['postfix_unary_operator'],
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
  public function getChildren(): dict<string, Node> {
    return dict[
      'operand' => $this->_operand,
      'operator' => $this->_operator,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $operand = $rewriter($this->_operand, $parents);
    $operator = $rewriter($this->_operator, $parents);
    if ($operand === $this->_operand && $operator === $this->_operator) {
      return $this;
    }
    return new static($operand, $operator);
  }

  public function getOperandUNTYPED(): Node {
    return $this->_operand;
  }

  public function withOperand(Node $value): this {
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
  <<__Memoize>>
  public function getOperand(): IExpression {
    return __Private\Wrap\wrap_IExpression($this->_operand);
  }

  /**
   * @return MemberSelectionExpression | ScopeResolutionExpression |
   * SubscriptExpression | VariableExpression
   */
  public function getOperandx(): IExpression {
    return $this->getOperand();
  }

  public function getOperatorUNTYPED(): Node {
    return $this->_operator;
  }

  public function withOperator(Node $value): this {
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
  public function getOperator(): Token {
    return TypeAssert\instance_of(Token::class, $this->_operator);
  }

  /**
   * @return PlusPlusToken | MinusMinusToken
   */
  public function getOperatorx(): Token {
    return $this->getOperator();
  }
}
