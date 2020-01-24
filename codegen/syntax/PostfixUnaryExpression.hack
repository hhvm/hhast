/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<a4073bb8c2f541f1e6bcc8d2f04853d5>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class PostfixUnaryExpression
  extends Node
  implements IHasOperator, ILambdaBody, IExpression {

  const string SYNTAX_KIND = 'postfix_unary_expression';

  private IExpression $_operand;
  private Token $_operator;

  public function __construct(
    IExpression $operand,
    Token $operator,
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
    string $_type_hint,
  ): this {
    $offset = $initial_offset;
    $operand = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['postfix_unary_operand'],
      $file,
      $offset,
      $source,
      'IExpression',
    );
    $operand = $operand as nonnull;
    $offset += $operand->getWidth();
    $operator = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['postfix_unary_operator'],
      $file,
      $offset,
      $source,
      'Token',
    );
    $operator = $operator as nonnull;
    $offset += $operator->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $operand,
      /* HH_IGNORE_ERROR[4110] */ $operator,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'operand' => $this->_operand,
      'operator' => $this->_operator,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $operand = $rewriter($this->_operand, $parents);
    $operator = $rewriter($this->_operator, $parents);
    if ($operand === $this->_operand && $operator === $this->_operator) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $operand,
      /* HH_FIXME[4110] use `as` */ $operator,
    );
  }

  public function getOperandUNTYPED(): ?Node {
    return $this->_operand;
  }

  public function withOperand(IExpression $value): this {
    if ($value === $this->_operand) {
      return $this;
    }
    return new static($value, $this->_operator);
  }

  public function hasOperand(): bool {
    return $this->_operand !== null;
  }

  /**
   * @return MemberSelectionExpression | ScopeResolutionExpression |
   * SubscriptExpression | NameToken | VariableExpression
   */
  public function getOperand(): IExpression {
    return TypeAssert\instance_of(IExpression::class, $this->_operand);
  }

  /**
   * @return MemberSelectionExpression | ScopeResolutionExpression |
   * SubscriptExpression | NameToken | VariableExpression
   */
  public function getOperandx(): IExpression {
    return $this->getOperand();
  }

  public function getOperatorUNTYPED(): ?Node {
    return $this->_operator;
  }

  public function withOperator(Token $value): this {
    if ($value === $this->_operator) {
      return $this;
    }
    return new static($this->_operand, $value);
  }

  public function hasOperator(): bool {
    return $this->_operator !== null;
  }

  /**
   * @return StarToken | PlusPlusToken | MinusMinusToken | QuestionToken
   */
  public function getOperator(): Token {
    return TypeAssert\instance_of(Token::class, $this->_operator);
  }

  /**
   * @return StarToken | PlusPlusToken | MinusMinusToken | QuestionToken
   */
  public function getOperatorx(): Token {
    return $this->getOperator();
  }
}
