/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<e8688eae0c4b6f699eae009140205c28>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class BinaryExpression
  extends Node
  implements IHasOperator, ILambdaBody, IExpression {

  const string SYNTAX_KIND = 'binary_expression';

  private IExpression $_left_operand;
  private Token $_operator;
  private IExpression $_right_operand;

  public function __construct(
    IExpression $left_operand,
    Token $operator,
    IExpression $right_operand,
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
      ($json['binary_left_operand']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'IExpression',
    );
    $left_operand = $left_operand as nonnull;
    $offset += $left_operand->getWidth();
    $operator = Node::fromJSON(
      ($json['binary_operator']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'Token',
    );
    $operator = $operator as nonnull;
    $offset += $operator->getWidth();
    $right_operand = Node::fromJSON(
      ($json['binary_right_operand']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'IExpression',
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
      $left_operand as IExpression,
      $operator as Token,
      $right_operand as IExpression,
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
   * @return AnonymousFunction | AsExpression | AwaitableCreationExpression |
   * BinaryExpression | CastExpression | CollectionLiteralExpression |
   * DarrayIntrinsicExpression | DictionaryIntrinsicExpression |
   * FunctionCallExpression | FunctionPointerExpression | IsExpression |
   * IssetExpression | KeysetIntrinsicExpression | ListExpression |
   * LiteralExpression | MemberSelectionExpression | ObjectCreationExpression |
   * ParenthesizedExpression | PipeVariableExpression | PostfixUnaryExpression
   * | PrefixUnaryExpression | QualifiedName | SafeMemberSelectionExpression |
   * ScopeResolutionExpression | SubscriptExpression | NameToken |
   * TupleExpression | VariableExpression | VarrayIntrinsicExpression |
   * VectorIntrinsicExpression
   */
  public function getLeftOperand(): IExpression {
    return TypeAssert\instance_of(IExpression::class, $this->_left_operand);
  }

  /**
   * @return AnonymousFunction | AsExpression | AwaitableCreationExpression |
   * BinaryExpression | CastExpression | CollectionLiteralExpression |
   * DarrayIntrinsicExpression | DictionaryIntrinsicExpression |
   * FunctionCallExpression | FunctionPointerExpression | IsExpression |
   * IssetExpression | KeysetIntrinsicExpression | ListExpression |
   * LiteralExpression | MemberSelectionExpression | ObjectCreationExpression |
   * ParenthesizedExpression | PipeVariableExpression | PostfixUnaryExpression
   * | PrefixUnaryExpression | QualifiedName | SafeMemberSelectionExpression |
   * ScopeResolutionExpression | SubscriptExpression | NameToken |
   * TupleExpression | VariableExpression | VarrayIntrinsicExpression |
   * VectorIntrinsicExpression
   */
  public function getLeftOperandx(): IExpression {
    return $this->getLeftOperand();
  }

  public function getOperatorUNTYPED(): ?Node {
    return $this->_operator;
  }

  public function withOperator(Token $value): this {
    if ($value === $this->_operator) {
      return $this;
    }
    return new static($this->_left_operand, $value, $this->_right_operand);
  }

  public function hasOperator(): bool {
    return true;
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
   * CaratToken | CaratEqualToken | BarToken | BarEqualToken |
   * BarGreaterThanToken | BarBarToken
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
   * CaratToken | CaratEqualToken | BarToken | BarEqualToken |
   * BarGreaterThanToken | BarBarToken
   */
  public function getOperatorx(): Token {
    return $this->getOperator();
  }

  public function getRightOperandUNTYPED(): ?Node {
    return $this->_right_operand;
  }

  public function withRightOperand(IExpression $value): this {
    if ($value === $this->_right_operand) {
      return $this;
    }
    return new static($this->_left_operand, $this->_operator, $value);
  }

  public function hasRightOperand(): bool {
    return true;
  }

  /**
   * @return AnonymousFunction | AsExpression | AwaitableCreationExpression |
   * BinaryExpression | CastExpression | CollectionLiteralExpression |
   * ConditionalExpression | DarrayIntrinsicExpression |
   * DictionaryIntrinsicExpression | EnumClassLabelExpression | EvalExpression
   * | FunctionCallExpression | FunctionPointerExpression | InclusionExpression
   * | IsExpression | IssetExpression | KeysetIntrinsicExpression |
   * LambdaExpression | LiteralExpression | MemberSelectionExpression |
   * NullableAsExpression | ObjectCreationExpression | ParenthesizedExpression
   * | PipeVariableExpression | PostfixUnaryExpression | PrefixUnaryExpression
   * | PrefixedStringExpression | QualifiedName | SafeMemberSelectionExpression
   * | ScopeResolutionExpression | ShapeExpression | SubscriptExpression |
   * NameToken | TupleExpression | VariableExpression |
   * VarrayIntrinsicExpression | VectorIntrinsicExpression | XHPExpression |
   * YieldExpression
   */
  public function getRightOperand(): IExpression {
    return TypeAssert\instance_of(IExpression::class, $this->_right_operand);
  }

  /**
   * @return AnonymousFunction | AsExpression | AwaitableCreationExpression |
   * BinaryExpression | CastExpression | CollectionLiteralExpression |
   * ConditionalExpression | DarrayIntrinsicExpression |
   * DictionaryIntrinsicExpression | EnumClassLabelExpression | EvalExpression
   * | FunctionCallExpression | FunctionPointerExpression | InclusionExpression
   * | IsExpression | IssetExpression | KeysetIntrinsicExpression |
   * LambdaExpression | LiteralExpression | MemberSelectionExpression |
   * NullableAsExpression | ObjectCreationExpression | ParenthesizedExpression
   * | PipeVariableExpression | PostfixUnaryExpression | PrefixUnaryExpression
   * | PrefixedStringExpression | QualifiedName | SafeMemberSelectionExpression
   * | ScopeResolutionExpression | ShapeExpression | SubscriptExpression |
   * NameToken | TupleExpression | VariableExpression |
   * VarrayIntrinsicExpression | VectorIntrinsicExpression | XHPExpression |
   * YieldExpression
   */
  public function getRightOperandx(): IExpression {
    return $this->getRightOperand();
  }
}
