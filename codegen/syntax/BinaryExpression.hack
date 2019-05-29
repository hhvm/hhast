/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<6382921cce40ad3541583a130546d198>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class BinaryExpression
  extends Node
  implements IHasOperator, ILambdaBody, IExpression {

  const string SYNTAX_KIND = 'binary_expression';

  private Node $_left_operand;
  private Node $_operator;
  private Node $_right_operand;

  public function __construct(
    Node $left_operand,
    Node $operator,
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
  ): this {
    $offset = $initial_offset;
    $left_operand = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['binary_left_operand'],
      $file,
      $offset,
      $source,
    );
    $offset += $left_operand->getWidth();
    $operator = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['binary_operator'],
      $file,
      $offset,
      $source,
    );
    $offset += $operator->getWidth();
    $right_operand = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['binary_right_operand'],
      $file,
      $offset,
      $source,
    );
    $offset += $right_operand->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static($left_operand, $operator, $right_operand, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'left_operand' => $this->_left_operand,
      'operator' => $this->_operator,
      'right_operand' => $this->_right_operand,
    ];
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
    return new static($left_operand, $operator, $right_operand);
  }

  public function getLeftOperandUNTYPED(): Node {
    return $this->_left_operand;
  }

  public function withLeftOperand(Node $value): this {
    if ($value === $this->_left_operand) {
      return $this;
    }
    return new static($value, $this->_operator, $this->_right_operand);
  }

  public function hasLeftOperand(): bool {
    return !$this->_left_operand->isMissing();
  }

  /**
   * @return ArrayCreationExpression | ArrayIntrinsicExpression |
   * AwaitableCreationExpression | BinaryExpression | CastExpression |
   * CollectionLiteralExpression | DarrayIntrinsicExpression |
   * DictionaryIntrinsicExpression | EmptyExpression | FunctionCallExpression |
   * InstanceofExpression | IsExpression | IssetExpression |
   * KeysetIntrinsicExpression | ListExpression | LiteralExpression |
   * MemberSelectionExpression | ObjectCreationExpression |
   * ParenthesizedExpression | PipeVariableExpression | PostfixUnaryExpression
   * | PrefixUnaryExpression | QualifiedName | ScopeResolutionExpression |
   * SubscriptExpression | NameToken | VariableExpression |
   * VarrayIntrinsicExpression | VectorIntrinsicExpression
   */
  <<__Memoize>>
  public function getLeftOperand(): IExpression {
    return __Private\Wrap\wrap_IExpression($this->_left_operand);
  }

  /**
   * @return ArrayCreationExpression | ArrayIntrinsicExpression |
   * AwaitableCreationExpression | BinaryExpression | CastExpression |
   * CollectionLiteralExpression | DarrayIntrinsicExpression |
   * DictionaryIntrinsicExpression | EmptyExpression | FunctionCallExpression |
   * InstanceofExpression | IsExpression | IssetExpression |
   * KeysetIntrinsicExpression | ListExpression | LiteralExpression |
   * MemberSelectionExpression | ObjectCreationExpression |
   * ParenthesizedExpression | PipeVariableExpression | PostfixUnaryExpression
   * | PrefixUnaryExpression | QualifiedName | ScopeResolutionExpression |
   * SubscriptExpression | NameToken | VariableExpression |
   * VarrayIntrinsicExpression | VectorIntrinsicExpression
   */
  public function getLeftOperandx(): IExpression {
    return $this->getLeftOperand();
  }

  public function getOperatorUNTYPED(): Node {
    return $this->_operator;
  }

  public function withOperator(Node $value): this {
    if ($value === $this->_operator) {
      return $this;
    }
    return new static($this->_left_operand, $value, $this->_right_operand);
  }

  public function hasOperator(): bool {
    return !$this->_operator->isMissing();
  }

  /**
   * @return ExclamationEqualToken | ExclamationEqualEqualToken | PercentToken
   * | PercentEqualToken | AmpersandToken | AmpersandAmpersandToken |
   * AmpersandEqualToken | StarToken | StarStarToken | StarStarEqualToken |
   * StarEqualToken | PlusToken | PlusEqualToken | MinusToken | MinusEqualToken
   * | DotToken | DotEqualToken | SlashToken | SlashEqualToken | LessThanToken
   * | LessThanLessThanToken | LessThanLessThanEqualToken | LessThanEqualToken
   * | LessThanEqualGreaterThanToken | EqualToken | EqualEqualToken |
   * EqualEqualEqualToken | GreaterThanToken | GreaterThanEqualToken |
   * GreaterThanGreaterThanToken | GreaterThanGreaterThanEqualToken |
   * QuestionColonToken | QuestionQuestionToken | QuestionQuestionEqualToken |
   * CaratToken | CaratEqualToken | AndToken | OrToken | XorToken | BarToken |
   * BarEqualToken | BarGreaterThanToken | BarBarToken
   */
  public function getOperator(): Token {
    return TypeAssert\instance_of(Token::class, $this->_operator);
  }

  /**
   * @return ExclamationEqualToken | ExclamationEqualEqualToken | PercentToken
   * | PercentEqualToken | AmpersandToken | AmpersandAmpersandToken |
   * AmpersandEqualToken | StarToken | StarStarToken | StarStarEqualToken |
   * StarEqualToken | PlusToken | PlusEqualToken | MinusToken | MinusEqualToken
   * | DotToken | DotEqualToken | SlashToken | SlashEqualToken | LessThanToken
   * | LessThanLessThanToken | LessThanLessThanEqualToken | LessThanEqualToken
   * | LessThanEqualGreaterThanToken | EqualToken | EqualEqualToken |
   * EqualEqualEqualToken | GreaterThanToken | GreaterThanEqualToken |
   * GreaterThanGreaterThanToken | GreaterThanGreaterThanEqualToken |
   * QuestionColonToken | QuestionQuestionToken | QuestionQuestionEqualToken |
   * CaratToken | CaratEqualToken | AndToken | OrToken | XorToken | BarToken |
   * BarEqualToken | BarGreaterThanToken | BarBarToken
   */
  public function getOperatorx(): Token {
    return $this->getOperator();
  }

  public function getRightOperandUNTYPED(): Node {
    return $this->_right_operand;
  }

  public function withRightOperand(Node $value): this {
    if ($value === $this->_right_operand) {
      return $this;
    }
    return new static($this->_left_operand, $this->_operator, $value);
  }

  public function hasRightOperand(): bool {
    return !$this->_right_operand->isMissing();
  }

  /**
   * @return AnonymousFunction | ArrayCreationExpression |
   * ArrayIntrinsicExpression | AsExpression | AwaitableCreationExpression |
   * BinaryExpression | CastExpression | CollectionLiteralExpression |
   * ConditionalExpression | DarrayIntrinsicExpression |
   * DictionaryIntrinsicExpression | EmptyExpression | EvalExpression |
   * FunctionCallExpression | InclusionExpression | InstanceofExpression |
   * IsExpression | IssetExpression | KeysetIntrinsicExpression |
   * LambdaExpression | LiteralExpression | MemberSelectionExpression |
   * NullableAsExpression | ObjectCreationExpression | ParenthesizedExpression
   * | Php7AnonymousFunction | PipeVariableExpression | PostfixUnaryExpression
   * | PrefixUnaryExpression | PrefixedStringExpression | QualifiedName |
   * RecordCreationExpression | SafeMemberSelectionExpression |
   * ScopeResolutionExpression | ShapeExpression | SubscriptExpression |
   * NameToken | TupleExpression | VariableExpression |
   * VarrayIntrinsicExpression | VectorIntrinsicExpression | XHPExpression |
   * YieldExpression | YieldFromExpression
   */
  <<__Memoize>>
  public function getRightOperand(): IExpression {
    return __Private\Wrap\wrap_IExpression($this->_right_operand);
  }

  /**
   * @return AnonymousFunction | ArrayCreationExpression |
   * ArrayIntrinsicExpression | AsExpression | AwaitableCreationExpression |
   * BinaryExpression | CastExpression | CollectionLiteralExpression |
   * ConditionalExpression | DarrayIntrinsicExpression |
   * DictionaryIntrinsicExpression | EmptyExpression | EvalExpression |
   * FunctionCallExpression | InclusionExpression | InstanceofExpression |
   * IsExpression | IssetExpression | KeysetIntrinsicExpression |
   * LambdaExpression | LiteralExpression | MemberSelectionExpression |
   * NullableAsExpression | ObjectCreationExpression | ParenthesizedExpression
   * | Php7AnonymousFunction | PipeVariableExpression | PostfixUnaryExpression
   * | PrefixUnaryExpression | PrefixedStringExpression | QualifiedName |
   * RecordCreationExpression | SafeMemberSelectionExpression |
   * ScopeResolutionExpression | ShapeExpression | SubscriptExpression |
   * NameToken | TupleExpression | VariableExpression |
   * VarrayIntrinsicExpression | VectorIntrinsicExpression | XHPExpression |
   * YieldExpression | YieldFromExpression
   */
  public function getRightOperandx(): IExpression {
    return $this->getRightOperand();
  }
}
