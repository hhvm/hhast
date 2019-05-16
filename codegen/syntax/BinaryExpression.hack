/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<2850e1e94e4d41735603c475d15128b2>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class BinaryExpression
  extends EditableNode
  implements IHasOperator, ILambdaBody, IExpression {

  const string SYNTAX_KIND = 'binary_expression';

  private EditableNode $_left_operand;
  private EditableNode $_operator;
  private EditableNode $_right_operand;

  public function __construct(
    EditableNode $left_operand,
    EditableNode $operator,
    EditableNode $right_operand,
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
    $left_operand = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['binary_left_operand'],
      $file,
      $offset,
      $source,
    );
    $offset += $left_operand->getWidth();
    $operator = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['binary_operator'],
      $file,
      $offset,
      $source,
    );
    $offset += $operator->getWidth();
    $right_operand = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['binary_right_operand'],
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
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'left_operand' => $this->_left_operand,
      'operator' => $this->_operator,
      'right_operand' => $this->_right_operand,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<EditableNode> $parents = vec[],
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

  public function getLeftOperandUNTYPED(): EditableNode {
    return $this->_left_operand;
  }

  public function withLeftOperand(EditableNode $value): this {
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

  public function getOperatorUNTYPED(): EditableNode {
    return $this->_operator;
  }

  public function withOperator(EditableNode $value): this {
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
  public function getOperator(): EditableToken {
    return TypeAssert\instance_of(EditableToken::class, $this->_operator);
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
  public function getOperatorx(): EditableToken {
    return $this->getOperator();
  }

  public function getRightOperandUNTYPED(): EditableNode {
    return $this->_right_operand;
  }

  public function withRightOperand(EditableNode $value): this {
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
