<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<4b64b7c045c3c5337ac53972b559cff1>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class BinaryExpression extends EditableNode {

  private EditableNode $_left_operand;
  private EditableNode $_operator;
  private EditableNode $_right_operand;

  public function __construct(
    EditableNode $left_operand,
    EditableNode $operator,
    EditableNode $right_operand,
  ) {
    parent::__construct('binary_expression');
    $this->_left_operand = $left_operand;
    $this->_operator = $operator;
    $this->_right_operand = $right_operand;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
  ): this {
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
    return new static($left_operand, $operator, $right_operand);
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
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?vec<EditableNode> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $left_operand = $this->_left_operand->rewrite($rewriter, $parents);
    $operator = $this->_operator->rewrite($rewriter, $parents);
    $right_operand = $this->_right_operand->rewrite($rewriter, $parents);
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
   * @returns AnonymousFunction | ArrayCreationExpression |
   * ArrayIntrinsicExpression | BinaryExpression | CastExpression |
   * CollectionLiteralExpression | DarrayIntrinsicExpression |
   * DictionaryIntrinsicExpression | EmptyExpression | FunctionCallExpression |
   * InstanceofExpression | IssetExpression | KeysetIntrinsicExpression |
   * ListExpression | LiteralExpression | MemberSelectionExpression |
   * ObjectCreationExpression | ParenthesizedExpression |
   * PipeVariableExpression | PostfixUnaryExpression | PrefixUnaryExpression |
   * QualifiedName | ScopeResolutionExpression | SubscriptExpression |
   * LessThanToken | NameToken | RightBraceToken | VariableExpression |
   * VarrayIntrinsicExpression | VectorIntrinsicExpression | XHPExpression
   */
  public function getLeftOperand(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_left_operand);
  }

  /**
   * @returns AnonymousFunction | ArrayCreationExpression |
   * ArrayIntrinsicExpression | BinaryExpression | CastExpression |
   * CollectionLiteralExpression | DarrayIntrinsicExpression |
   * DictionaryIntrinsicExpression | EmptyExpression | FunctionCallExpression |
   * InstanceofExpression | IssetExpression | KeysetIntrinsicExpression |
   * ListExpression | LiteralExpression | MemberSelectionExpression |
   * ObjectCreationExpression | ParenthesizedExpression |
   * PipeVariableExpression | PostfixUnaryExpression | PrefixUnaryExpression |
   * QualifiedName | ScopeResolutionExpression | SubscriptExpression |
   * LessThanToken | NameToken | RightBraceToken | VariableExpression |
   * VarrayIntrinsicExpression | VectorIntrinsicExpression | XHPExpression
   */
  public function getLeftOperandx(): EditableNode {
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
   * @returns ExclamationEqualToken | ExclamationEqualEqualToken | PercentToken
   * | PercentEqualToken | AmpersandToken | AmpersandAmpersandToken |
   * AmpersandEqualToken | StarToken | StarStarToken | StarStarEqualToken |
   * StarEqualToken | PlusToken | PlusEqualToken | MinusToken | MinusEqualToken
   * | DotToken | DotEqualToken | SlashToken | SlashEqualToken | LessThanToken
   * | LessThanLessThanToken | LessThanLessThanEqualToken | LessThanEqualToken
   * | LessThanEqualGreaterThanToken | LessThanGreaterThanToken | EqualToken |
   * EqualEqualToken | EqualEqualEqualToken | GreaterThanToken |
   * GreaterThanEqualToken | GreaterThanGreaterThanToken |
   * GreaterThanGreaterThanEqualToken | QuestionColonToken |
   * QuestionQuestionToken | QuestionQuestionEqualToken | CaratToken |
   * CaratEqualToken | AndToken | OrToken | XorToken | BarToken | BarEqualToken
   * | BarGreaterThanToken | BarBarToken
   */
  public function getOperator(): EditableToken {
    return TypeAssert\instance_of(EditableToken::class, $this->_operator);
  }

  /**
   * @returns ExclamationEqualToken | ExclamationEqualEqualToken | PercentToken
   * | PercentEqualToken | AmpersandToken | AmpersandAmpersandToken |
   * AmpersandEqualToken | StarToken | StarStarToken | StarStarEqualToken |
   * StarEqualToken | PlusToken | PlusEqualToken | MinusToken | MinusEqualToken
   * | DotToken | DotEqualToken | SlashToken | SlashEqualToken | LessThanToken
   * | LessThanLessThanToken | LessThanLessThanEqualToken | LessThanEqualToken
   * | LessThanEqualGreaterThanToken | LessThanGreaterThanToken | EqualToken |
   * EqualEqualToken | EqualEqualEqualToken | GreaterThanToken |
   * GreaterThanEqualToken | GreaterThanGreaterThanToken |
   * GreaterThanGreaterThanEqualToken | QuestionColonToken |
   * QuestionQuestionToken | QuestionQuestionEqualToken | CaratToken |
   * CaratEqualToken | AndToken | OrToken | XorToken | BarToken | BarEqualToken
   * | BarGreaterThanToken | BarBarToken
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
   * @returns AnonymousFunction | ArrayCreationExpression |
   * ArrayIntrinsicExpression | AsExpression | AwaitableCreationExpression |
   * BinaryExpression | CastExpression | CollectionLiteralExpression |
   * ConditionalExpression | DarrayIntrinsicExpression |
   * DictionaryIntrinsicExpression | EmptyExpression | EvalExpression |
   * FunctionCallExpression | FunctionCallWithTypeArgumentsExpression |
   * InclusionExpression | InstanceofExpression | IssetExpression |
   * KeysetIntrinsicExpression | LambdaExpression | LiteralExpression |
   * MemberSelectionExpression | Missing | NullableAsExpression |
   * ObjectCreationExpression | ParenthesizedExpression | Php7AnonymousFunction
   * | PipeVariableExpression | PostfixUnaryExpression | PrefixUnaryExpression
   * | PrefixedStringExpression | QualifiedName | SafeMemberSelectionExpression
   * | ScopeResolutionExpression | ShapeExpression | SubscriptExpression |
   * SemicolonToken | QuestionToken | EndOfFileToken | NameToken |
   * TupleExpression | VariableExpression | VarrayIntrinsicExpression |
   * VectorIntrinsicExpression | XHPExpression | YieldExpression |
   * YieldFromExpression
   */
  public function getRightOperand(): ?EditableNode {
    if ($this->_right_operand->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableNode::class, $this->_right_operand);
  }

  /**
   * @returns AnonymousFunction | ArrayCreationExpression |
   * ArrayIntrinsicExpression | AsExpression | AwaitableCreationExpression |
   * BinaryExpression | CastExpression | CollectionLiteralExpression |
   * ConditionalExpression | DarrayIntrinsicExpression |
   * DictionaryIntrinsicExpression | EmptyExpression | EvalExpression |
   * FunctionCallExpression | FunctionCallWithTypeArgumentsExpression |
   * InclusionExpression | InstanceofExpression | IssetExpression |
   * KeysetIntrinsicExpression | LambdaExpression | LiteralExpression |
   * MemberSelectionExpression | NullableAsExpression |
   * ObjectCreationExpression | ParenthesizedExpression | Php7AnonymousFunction
   * | PipeVariableExpression | PostfixUnaryExpression | PrefixUnaryExpression
   * | PrefixedStringExpression | QualifiedName | SafeMemberSelectionExpression
   * | ScopeResolutionExpression | ShapeExpression | SubscriptExpression |
   * SemicolonToken | QuestionToken | EndOfFileToken | NameToken |
   * TupleExpression | VariableExpression | VarrayIntrinsicExpression |
   * VectorIntrinsicExpression | XHPExpression | YieldExpression |
   * YieldFromExpression
   */
  public function getRightOperandx(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_right_operand);
  }
}
