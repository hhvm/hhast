<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<7e3dbaec9bb044d089958b17b5b4ced1>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

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
    int $position,
    string $source,
  ): this {
    $left_operand = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['binary_left_operand'],
      $position,
      $source,
    );
    $position += $left_operand->getWidth();
    $operator = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['binary_operator'],
      $position,
      $source,
    );
    $position += $operator->getWidth();
    $right_operand = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['binary_right_operand'],
      $position,
      $source,
    );
    $position += $right_operand->getWidth();
    return new self($left_operand, $operator, $right_operand);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableNode> {
    return dict[
      'left_operand' => $this->_left_operand,
      'operator' => $this->_operator,
      'right_operand' => $this->_right_operand,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?Traversable<EditableNode> $parents = null,
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
    return new self($left_operand, $operator, $right_operand);
  }

  public function getLeftOperandUNTYPED(): EditableNode {
    return $this->_left_operand;
  }

  public function withLeftOperand(EditableNode $value): this {
    if ($value === $this->_left_operand) {
      return $this;
    }
    return new self($value, $this->_operator, $this->_right_operand);
  }

  public function hasLeftOperand(): bool {
    return !$this->_left_operand->isMissing();
  }

  /**
   * @returns BinaryExpression | LiteralExpression | VariableExpression |
   * SubscriptExpression | MemberSelectionExpression | FunctionCallExpression |
   * ParenthesizedExpression | ScopeResolutionExpression | IssetExpression |
   * QualifiedNameExpression | ArrayIntrinsicExpression | ListExpression |
   * PrefixUnaryExpression | PostfixUnaryExpression | XHPExpression |
   * CastExpression | CollectionLiteralExpression | InstanceofExpression |
   * ObjectCreationExpression | DictionaryIntrinsicExpression |
   * ArrayCreationExpression | EmptyExpression | PercentToken | LessThanToken |
   * KeysetIntrinsicExpression | SafeMemberSelectionExpression |
   * VectorIntrinsicExpression | RightParenToken | EqualGreaterThanToken |
   * AnonymousFunction | PipeVariableExpression
   */
  public function getLeftOperand(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_left_operand);
  }

  public function getOperatorUNTYPED(): EditableNode {
    return $this->_operator;
  }

  public function withOperator(EditableNode $value): this {
    if ($value === $this->_operator) {
      return $this;
    }
    return new self($this->_left_operand, $value, $this->_right_operand);
  }

  public function hasOperator(): bool {
    return !$this->_operator->isMissing();
  }

  /**
   * @returns DotToken | EqualToken | EqualEqualToken | AmpersandAmpersandToken
   * | DotEqualToken | PercentToken | GreaterThanToken | AmpersandToken |
   * PlusToken | LessThanToken | EqualEqualEqualToken | LessThanEqualToken |
   * ExclamationEqualEqualToken | ExclamationEqualToken | GreaterThanEqualToken
   * | LessThanEqualGreaterThanToken | PlusEqualToken |
   * GreaterThanGreaterThanEqualToken | MinusEqualToken | CaratToken | BarToken
   * | BarEqualToken | AmpersandEqualToken | CaratEqualToken | StarEqualToken |
   * LessThanLessThanToken | StarToken | MinusToken | XorToken | BarBarToken |
   * StarStarToken | SlashToken | QuestionQuestionToken | BarGreaterThanToken |
   * AndToken | GreaterThanGreaterThanToken | SlashEqualToken |
   * StarStarEqualToken | PercentEqualToken | LessThanLessThanEqualToken |
   * LessThanGreaterThanToken | OrToken
   */
  public function getOperator(): EditableToken {
    return TypeAssert\instance_of(EditableToken::class, $this->_operator);
  }

  public function getRightOperandUNTYPED(): EditableNode {
    return $this->_right_operand;
  }

  public function withRightOperand(EditableNode $value): this {
    if ($value === $this->_right_operand) {
      return $this;
    }
    return new self($this->_left_operand, $this->_operator, $value);
  }

  public function hasRightOperand(): bool {
    return !$this->_right_operand->isMissing();
  }

  /**
   * @returns LiteralExpression | FunctionCallExpression |
   * ObjectCreationExpression | VariableExpression | PrefixUnaryExpression |
   * ArrayIntrinsicExpression | BinaryExpression | ParenthesizedExpression |
   * MemberSelectionExpression | CollectionLiteralExpression |
   * AnonymousFunction | VectorIntrinsicExpression |
   * DictionaryIntrinsicExpression | KeysetIntrinsicExpression |
   * SubscriptExpression | ConditionalExpression | CastExpression |
   * ArrayCreationExpression | ScopeResolutionExpression |
   * QualifiedNameExpression | YieldExpression | IssetExpression |
   * EmptyExpression | EvalExpression | PostfixUnaryExpression |
   * InclusionExpression | LambdaExpression | ShapeExpression | Missing |
   * XHPExpression | AwaitableCreationExpression | InstanceofExpression |
   * LeftBraceToken | CommaToken | TupleExpression |
   * SafeMemberSelectionExpression | PipeVariableExpression | EndOfFileToken |
   * QuestionToken
   */
  public function getRightOperand(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_right_operand);
  }
}
