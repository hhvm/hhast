/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<b96101f1d07b0d3348c39835b67ca75f>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;
/* HHAST_IGNORE_ALL[5607] 5607 is ignored because of false positives when comparing a generic to a typed value */
/* HHAST_IGNORE_ALL[5624] HHAST_IGNORE_ALL[5639] 5624 and 5639 are ignored because they insist on using co(tra)variant generics. Could this break external consumers? */

<<__ConsistentConstruct>>
final class ConditionalExpression
  extends Node
  implements ILambdaBody, IExpression {

  const string SYNTAX_KIND = 'conditional_expression';

  private IExpression $_test;
  private QuestionToken $_question;
  private IExpression $_consequence;
  private ColonToken $_colon;
  private IExpression $_alternative;

  public function __construct(
    IExpression $test,
    QuestionToken $question,
    IExpression $consequence,
    ColonToken $colon,
    IExpression $alternative,
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
    dict<arraykey, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
    string $_type_hint,
  ): this {
    $offset = $initial_offset;
    $test = Node::fromJSON(
      ($json['conditional_test']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'IExpression',
    );
    $test = $test as nonnull;
    $offset += $test->getWidth();
    $question = Node::fromJSON(
      ($json['conditional_question']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'QuestionToken',
    );
    $question = $question as nonnull;
    $offset += $question->getWidth();
    $consequence = Node::fromJSON(
      ($json['conditional_consequence']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'IExpression',
    );
    $consequence = $consequence as nonnull;
    $offset += $consequence->getWidth();
    $colon = Node::fromJSON(
      ($json['conditional_colon']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'ColonToken',
    );
    $colon = $colon as nonnull;
    $offset += $colon->getWidth();
    $alternative = Node::fromJSON(
      ($json['conditional_alternative']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'IExpression',
    );
    $alternative = $alternative as nonnull;
    $offset += $alternative->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $test,
      /* HH_IGNORE_ERROR[4110] */ $question,
      /* HH_IGNORE_ERROR[4110] */ $consequence,
      /* HH_IGNORE_ERROR[4110] */ $colon,
      /* HH_IGNORE_ERROR[4110] */ $alternative,
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
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
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
    return new static(
      $test as IExpression,
      $question as QuestionToken,
      $consequence as IExpression,
      $colon as ColonToken,
      $alternative as IExpression,
    );
  }

  public function getTestUNTYPED(): ?Node {
    return $this->_test;
  }

  public function withTest(IExpression $value): this {
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
    return true;
  }

  /**
   * @return BinaryExpression | FunctionCallExpression | IsExpression |
   * IssetExpression | LiteralExpression | MemberSelectionExpression |
   * ParenthesizedExpression | PipeVariableExpression | PrefixUnaryExpression |
   * ScopeResolutionExpression | SubscriptExpression | NameToken |
   * VariableExpression
   */
  public function getTest(): IExpression {
    return TypeAssert\instance_of(IExpression::class, $this->_test);
  }

  /**
   * @return BinaryExpression | FunctionCallExpression | IsExpression |
   * IssetExpression | LiteralExpression | MemberSelectionExpression |
   * ParenthesizedExpression | PipeVariableExpression | PrefixUnaryExpression |
   * ScopeResolutionExpression | SubscriptExpression | NameToken |
   * VariableExpression
   */
  public function getTestx(): IExpression {
    return $this->getTest();
  }

  public function getQuestionUNTYPED(): ?Node {
    return $this->_question;
  }

  public function withQuestion(QuestionToken $value): this {
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
    return true;
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

  public function getConsequenceUNTYPED(): ?Node {
    return $this->_consequence;
  }

  public function withConsequence(IExpression $value): this {
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
    return true;
  }

  /**
   * @return BinaryExpression | CastExpression | CollectionLiteralExpression |
   * DarrayIntrinsicExpression | FunctionCallExpression |
   * FunctionPointerExpression | KeysetIntrinsicExpression | LambdaExpression |
   * LiteralExpression | MemberSelectionExpression | ObjectCreationExpression |
   * ParenthesizedExpression | PrefixUnaryExpression |
   * ScopeResolutionExpression | ShapeExpression | SubscriptExpression |
   * NameToken | VariableExpression | VarrayIntrinsicExpression
   */
  public function getConsequence(): IExpression {
    return TypeAssert\instance_of(IExpression::class, $this->_consequence);
  }

  /**
   * @return BinaryExpression | CastExpression | CollectionLiteralExpression |
   * DarrayIntrinsicExpression | FunctionCallExpression |
   * FunctionPointerExpression | KeysetIntrinsicExpression | LambdaExpression |
   * LiteralExpression | MemberSelectionExpression | ObjectCreationExpression |
   * ParenthesizedExpression | PrefixUnaryExpression |
   * ScopeResolutionExpression | ShapeExpression | SubscriptExpression |
   * NameToken | VariableExpression | VarrayIntrinsicExpression
   */
  public function getConsequencex(): IExpression {
    return $this->getConsequence();
  }

  public function getColonUNTYPED(): ?Node {
    return $this->_colon;
  }

  public function withColon(ColonToken $value): this {
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
    return true;
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

  public function getAlternativeUNTYPED(): ?Node {
    return $this->_alternative;
  }

  public function withAlternative(IExpression $value): this {
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
    return true;
  }

  /**
   * @return BinaryExpression | CastExpression | CollectionLiteralExpression |
   * DarrayIntrinsicExpression | DictionaryIntrinsicExpression |
   * FunctionCallExpression | FunctionPointerExpression | LambdaExpression |
   * LiteralExpression | MemberSelectionExpression | ObjectCreationExpression |
   * ParenthesizedExpression | PrefixUnaryExpression |
   * ScopeResolutionExpression | SubscriptExpression | NameToken |
   * VariableExpression | VarrayIntrinsicExpression | VectorIntrinsicExpression
   */
  public function getAlternative(): IExpression {
    return TypeAssert\instance_of(IExpression::class, $this->_alternative);
  }

  /**
   * @return BinaryExpression | CastExpression | CollectionLiteralExpression |
   * DarrayIntrinsicExpression | DictionaryIntrinsicExpression |
   * FunctionCallExpression | FunctionPointerExpression | LambdaExpression |
   * LiteralExpression | MemberSelectionExpression | ObjectCreationExpression |
   * ParenthesizedExpression | PrefixUnaryExpression |
   * ScopeResolutionExpression | SubscriptExpression | NameToken |
   * VariableExpression | VarrayIntrinsicExpression | VectorIntrinsicExpression
   */
  public function getAlternativex(): IExpression {
    return $this->getAlternative();
  }
}
