/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<0bea6749ad282b20a3ce20c943ba9b0e>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class ConditionalExpression
  extends Node
  implements ILambdaBody, IExpression {

  const string SYNTAX_KIND = 'conditional_expression';

  private Node $_test;
  private Node $_question;
  private Node $_consequence;
  private Node $_colon;
  private Node $_alternative;

  public function __construct(
    Node $test,
    Node $question,
    Node $consequence,
    Node $colon,
    Node $alternative,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_test = $test;
    $this->_question = $question;
    $this->_consequence = $consequence;
    $this->_colon = $colon;
    $this->_alternative = $alternative;
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
    $test = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['conditional_test'],
      $file,
      $offset,
      $source,
    );
    $offset += $test->getWidth();
    $question = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['conditional_question'],
      $file,
      $offset,
      $source,
    );
    $offset += $question->getWidth();
    $consequence = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['conditional_consequence'],
      $file,
      $offset,
      $source,
    );
    $offset += $consequence->getWidth();
    $colon = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['conditional_colon'],
      $file,
      $offset,
      $source,
    );
    $offset += $colon->getWidth();
    $alternative = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['conditional_alternative'],
      $file,
      $offset,
      $source,
    );
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
  public function getChildren(): dict<string, Node> {
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
    vec<Node> $parents = vec[],
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

  public function getTestUNTYPED(): Node {
    return $this->_test;
  }

  public function withTest(Node $value): this {
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
   * @return BinaryExpression | ConditionalExpression | FunctionCallExpression
   * | InstanceofExpression | IsExpression | IssetExpression |
   * LiteralExpression | MemberSelectionExpression | ParenthesizedExpression |
   * PipeVariableExpression | PostfixUnaryExpression | PrefixUnaryExpression |
   * ScopeResolutionExpression | SubscriptExpression | NameToken |
   * VariableExpression
   */
  <<__Memoize>>
  public function getTest(): IExpression {
    return __Private\Wrap\wrap_IExpression($this->_test);
  }

  /**
   * @return BinaryExpression | ConditionalExpression | FunctionCallExpression
   * | InstanceofExpression | IsExpression | IssetExpression |
   * LiteralExpression | MemberSelectionExpression | ParenthesizedExpression |
   * PipeVariableExpression | PostfixUnaryExpression | PrefixUnaryExpression |
   * ScopeResolutionExpression | SubscriptExpression | NameToken |
   * VariableExpression
   */
  public function getTestx(): IExpression {
    return $this->getTest();
  }

  public function getQuestionUNTYPED(): Node {
    return $this->_question;
  }

  public function withQuestion(Node $value): this {
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

  public function getConsequenceUNTYPED(): Node {
    return $this->_consequence;
  }

  public function withConsequence(Node $value): this {
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
  <<__Memoize>>
  public function getConsequence(): ?IExpression {
    if ($this->_consequence->isMissing()) {
      return null;
    }
    return __Private\Wrap\wrap_IExpression($this->_consequence);
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
    return TypeAssert\not_null($this->getConsequence());
  }

  public function getColonUNTYPED(): Node {
    return $this->_colon;
  }

  public function withColon(Node $value): this {
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

  public function getAlternativeUNTYPED(): Node {
    return $this->_alternative;
  }

  public function withAlternative(Node $value): this {
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
  <<__Memoize>>
  public function getAlternative(): IExpression {
    return __Private\Wrap\wrap_IExpression($this->_alternative);
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
