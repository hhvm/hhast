/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<2d389c5ff95ea1b0216ad181d5212fe8>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class ConditionalExpression extends EditableNode implements IExpression {

  private EditableNode $_test;
  private EditableNode $_question;
  private EditableNode $_consequence;
  private EditableNode $_colon;
  private EditableNode $_alternative;

  public function __construct(
    EditableNode $test,
    EditableNode $question,
    EditableNode $consequence,
    EditableNode $colon,
    EditableNode $alternative,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_test = $test;
    $this->_question = $question;
    $this->_consequence = $consequence;
    $this->_colon = $colon;
    $this->_alternative = $alternative;
    parent::__construct('conditional_expression', $source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
  ): this {
    $offset = $initial_offset;
    $test = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['conditional_test'],
      $file,
      $offset,
      $source,
    );
    $test = $test->isMissing() ? $test : __Private\Wrap\wrap_IExpression($test);
    $offset += $test->getWidth();
    $question = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['conditional_question'],
      $file,
      $offset,
      $source,
    );
    $offset += $question->getWidth();
    $consequence = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['conditional_consequence'],
      $file,
      $offset,
      $source,
    );
    $consequence = $consequence->isMissing()
      ? $consequence
      : __Private\Wrap\wrap_IExpression($consequence);
    $offset += $consequence->getWidth();
    $colon = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['conditional_colon'],
      $file,
      $offset,
      $source,
    );
    $offset += $colon->getWidth();
    $alternative = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['conditional_alternative'],
      $file,
      $offset,
      $source,
    );
    $alternative = $alternative->isMissing()
      ? $alternative
      : __Private\Wrap\wrap_IExpression($alternative);
    $offset += $alternative->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      $test,
      $question,
      $consequence,
      $colon,
      $alternative,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'test' => $this->_test,
      'question' => $this->_question,
      'consequence' => $this->_consequence,
      'colon' => $this->_colon,
      'alternative' => $this->_alternative,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<EditableNode> $parents = vec[],
  ): this {
    $parents[] = $this;
    $test = $rewriter($this->_test, $parents);
    $question = $rewriter($this->_question, $parents);
    $consequence = $rewriter($this->_consequence, $parents);
    $colon = $rewriter($this->_colon, $parents);
    $alternative = $rewriter($this->_alternative, $parents);
    if (
      $test === $this->_test &&
      $question === $this->_question &&
      $consequence === $this->_consequence &&
      $colon === $this->_colon &&
      $alternative === $this->_alternative
    ) {
      return $this;
    }
    return new static($test, $question, $consequence, $colon, $alternative);
  }

  public function getTestUNTYPED(): EditableNode {
    return $this->_test;
  }

  public function withTest(EditableNode $value): this {
    if ($value === $this->_test) {
      return $this;
    }
    return new static(
      $value,
      $this->_question,
      $this->_consequence,
      $this->_colon,
      $this->_alternative,
    );
  }

  public function hasTest(): bool {
    return !$this->_test->isMissing();
  }

  /**
   * @return BinaryExpression | ConditionalExpression | EmptyExpression |
   * FunctionCallExpression | InstanceofExpression | IsExpression |
   * IssetExpression | LiteralExpression | MemberSelectionExpression |
   * ParenthesizedExpression | PipeVariableExpression | PostfixUnaryExpression
   * | PrefixUnaryExpression | ScopeResolutionExpression | SubscriptExpression
   * | NameToken | VariableExpression
   */
  public function getTest(): IExpression {
    return TypeAssert\instance_of(IExpression::class, $this->_test);
  }

  /**
   * @return BinaryExpression | ConditionalExpression | EmptyExpression |
   * FunctionCallExpression | InstanceofExpression | IsExpression |
   * IssetExpression | LiteralExpression | MemberSelectionExpression |
   * ParenthesizedExpression | PipeVariableExpression | PostfixUnaryExpression
   * | PrefixUnaryExpression | ScopeResolutionExpression | SubscriptExpression
   * | NameToken | VariableExpression
   */
  public function getTestx(): IExpression {
    return $this->getTest();
  }

  public function getQuestionUNTYPED(): EditableNode {
    return $this->_question;
  }

  public function withQuestion(EditableNode $value): this {
    if ($value === $this->_question) {
      return $this;
    }
    return new static(
      $this->_test,
      $value,
      $this->_consequence,
      $this->_colon,
      $this->_alternative,
    );
  }

  public function hasQuestion(): bool {
    return !$this->_question->isMissing();
  }

  /**
   * @return QuestionToken
   */
  public function getQuestion(): QuestionToken {
    return TypeAssert\instance_of(QuestionToken::class, $this->_question);
  }

  /**
   * @return QuestionToken
   */
  public function getQuestionx(): QuestionToken {
    return $this->getQuestion();
  }

  public function getConsequenceUNTYPED(): EditableNode {
    return $this->_consequence;
  }

  public function withConsequence(EditableNode $value): this {
    if ($value === $this->_consequence) {
      return $this;
    }
    return new static(
      $this->_test,
      $this->_question,
      $value,
      $this->_colon,
      $this->_alternative,
    );
  }

  public function hasConsequence(): bool {
    return !$this->_consequence->isMissing();
  }

  /**
   * @return ArrayCreationExpression | ArrayIntrinsicExpression |
   * BinaryExpression | CastExpression | CollectionLiteralExpression |
   * FunctionCallExpression | LambdaExpression | LiteralExpression |
   * MemberSelectionExpression | null | ObjectCreationExpression |
   * ParenthesizedExpression | PrefixUnaryExpression |
   * ScopeResolutionExpression | ShapeExpression | SubscriptExpression |
   * NameToken | VariableExpression
   */
  public function getConsequence(): ?IExpression {
    if ($this->_consequence->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(IExpression::class, $this->_consequence);
  }

  /**
   * @return ArrayCreationExpression | ArrayIntrinsicExpression |
   * BinaryExpression | CastExpression | CollectionLiteralExpression |
   * FunctionCallExpression | LambdaExpression | LiteralExpression |
   * MemberSelectionExpression | ObjectCreationExpression |
   * ParenthesizedExpression | PrefixUnaryExpression |
   * ScopeResolutionExpression | ShapeExpression | SubscriptExpression |
   * NameToken | VariableExpression
   */
  public function getConsequencex(): IExpression {
    return TypeAssert\instance_of(IExpression::class, $this->_consequence);
  }

  public function getColonUNTYPED(): EditableNode {
    return $this->_colon;
  }

  public function withColon(EditableNode $value): this {
    if ($value === $this->_colon) {
      return $this;
    }
    return new static(
      $this->_test,
      $this->_question,
      $this->_consequence,
      $value,
      $this->_alternative,
    );
  }

  public function hasColon(): bool {
    return !$this->_colon->isMissing();
  }

  /**
   * @return ColonToken
   */
  public function getColon(): ColonToken {
    return TypeAssert\instance_of(ColonToken::class, $this->_colon);
  }

  /**
   * @return ColonToken
   */
  public function getColonx(): ColonToken {
    return $this->getColon();
  }

  public function getAlternativeUNTYPED(): EditableNode {
    return $this->_alternative;
  }

  public function withAlternative(EditableNode $value): this {
    if ($value === $this->_alternative) {
      return $this;
    }
    return new static(
      $this->_test,
      $this->_question,
      $this->_consequence,
      $this->_colon,
      $value,
    );
  }

  public function hasAlternative(): bool {
    return !$this->_alternative->isMissing();
  }

  /**
   * @return ArrayCreationExpression | ArrayIntrinsicExpression |
   * BinaryExpression | CastExpression | CollectionLiteralExpression |
   * DarrayIntrinsicExpression | FunctionCallExpression | IssetExpression |
   * LambdaExpression | LiteralExpression | MemberSelectionExpression |
   * ObjectCreationExpression | ParenthesizedExpression | PrefixUnaryExpression
   * | ScopeResolutionExpression | SubscriptExpression | NameToken |
   * VariableExpression
   */
  public function getAlternative(): IExpression {
    return TypeAssert\instance_of(IExpression::class, $this->_alternative);
  }

  /**
   * @return ArrayCreationExpression | ArrayIntrinsicExpression |
   * BinaryExpression | CastExpression | CollectionLiteralExpression |
   * DarrayIntrinsicExpression | FunctionCallExpression | IssetExpression |
   * LambdaExpression | LiteralExpression | MemberSelectionExpression |
   * ObjectCreationExpression | ParenthesizedExpression | PrefixUnaryExpression
   * | ScopeResolutionExpression | SubscriptExpression | NameToken |
   * VariableExpression
   */
  public function getAlternativex(): IExpression {
    return $this->getAlternative();
  }
}
