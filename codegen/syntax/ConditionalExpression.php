<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<8507211ceb30499dc0fb4fce3c17f96d>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class ConditionalExpression extends EditableSyntax {

  private EditableSyntax $_test;
  private EditableSyntax $_question;
  private EditableSyntax $_consequence;
  private EditableSyntax $_colon;
  private EditableSyntax $_alternative;

  public function __construct(
    EditableSyntax $test,
    EditableSyntax $question,
    EditableSyntax $consequence,
    EditableSyntax $colon,
    EditableSyntax $alternative,
  ) {
    parent::__construct('conditional_expression');
    $this->_test = $test;
    $this->_question = $question;
    $this->_consequence = $consequence;
    $this->_colon = $colon;
    $this->_alternative = $alternative;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $test = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['conditional_test'],
      $position,
      $source,
    );
    $position += $test->getWidth();
    $question = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['conditional_question'],
      $position,
      $source,
    );
    $position += $question->getWidth();
    $consequence = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['conditional_consequence'],
      $position,
      $source,
    );
    $position += $consequence->getWidth();
    $colon = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['conditional_colon'],
      $position,
      $source,
    );
    $position += $colon->getWidth();
    $alternative = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['conditional_alternative'],
      $position,
      $source,
    );
    $position += $alternative->getWidth();
    return new self($test, $question, $consequence, $colon, $alternative);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'test' => $this->_test;
    yield 'question' => $this->_question;
    yield 'consequence' => $this->_consequence;
    yield 'colon' => $this->_colon;
    yield 'alternative' => $this->_alternative;
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $test = $this->_test->rewrite($rewriter, $parents);
    $question = $this->_question->rewrite($rewriter, $parents);
    $consequence = $this->_consequence->rewrite($rewriter, $parents);
    $colon = $this->_colon->rewrite($rewriter, $parents);
    $alternative = $this->_alternative->rewrite($rewriter, $parents);
    if (
      $test === $this->_test &&
      $question === $this->_question &&
      $consequence === $this->_consequence &&
      $colon === $this->_colon &&
      $alternative === $this->_alternative
    ) {
      return $this;
    }
    return new self($test, $question, $consequence, $colon, $alternative);
  }

  public function getTestUNTYPED(): EditableSyntax {
    return $this->_test;
  }

  public function withTest(EditableSyntax $value): this {
    if ($value === $this->_test) {
      return $this;
    }
    return new self(
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
   * @returns ParenthesizedExpression | IssetExpression | VariableExpression |
   * FunctionCallExpression | EmptyExpression | QualifiedNameExpression |
   * BinaryExpression | LiteralExpression | MemberSelectionExpression |
   * SubscriptExpression | PostfixUnaryExpression | ScopeResolutionExpression |
   * ConditionalExpression | PrefixUnaryExpression | InstanceofExpression |
   * LessThanToken | ColonToken
   */
  public function getTest(): EditableSyntax {
    return TypeAssert\instance_of(EditableSyntax::class, $this->_test);
  }

  public function getQuestionUNTYPED(): EditableSyntax {
    return $this->_question;
  }

  public function withQuestion(EditableSyntax $value): this {
    if ($value === $this->_question) {
      return $this;
    }
    return new self(
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
   * @returns QuestionToken
   */
  public function getQuestion(): QuestionToken {
    return TypeAssert\instance_of(QuestionToken::class, $this->_question);
  }

  public function getConsequenceUNTYPED(): EditableSyntax {
    return $this->_consequence;
  }

  public function withConsequence(EditableSyntax $value): this {
    if ($value === $this->_consequence) {
      return $this;
    }
    return new self(
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
   * @returns LiteralExpression | SubscriptExpression | Missing |
   * ScopeResolutionExpression | VariableExpression | QualifiedNameExpression |
   * FunctionCallExpression | ArrayIntrinsicExpression |
   * ObjectCreationExpression | PrefixUnaryExpression | BinaryExpression |
   * ParenthesizedExpression | CastExpression | CollectionLiteralExpression |
   * MemberSelectionExpression | ArrayCreationExpression | LambdaExpression
   */
  public function getConsequence(): EditableSyntax {
    return TypeAssert\instance_of(EditableSyntax::class, $this->_consequence);
  }

  public function getColonUNTYPED(): EditableSyntax {
    return $this->_colon;
  }

  public function withColon(EditableSyntax $value): this {
    if ($value === $this->_colon) {
      return $this;
    }
    return new self(
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
   * @returns ColonToken | Missing
   */
  public function getColon(): ?ColonToken {
    if ($this->_colon->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(ColonToken::class, $this->_colon);
  }

  /**
   * @returns ColonToken
   */
  public function getColonx(): ColonToken {
    return TypeAssert\instance_of(ColonToken::class, $this->_colon);
  }

  public function getAlternativeUNTYPED(): EditableSyntax {
    return $this->_alternative;
  }

  public function withAlternative(EditableSyntax $value): this {
    if ($value === $this->_alternative) {
      return $this;
    }
    return new self(
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
   * @returns LiteralExpression | VariableExpression |
   * ScopeResolutionExpression | QualifiedNameExpression |
   * PrefixUnaryExpression | ObjectCreationExpression |
   * ArrayIntrinsicExpression | FunctionCallExpression | TupleExpression |
   * BinaryExpression | ParenthesizedExpression | ArrayCreationExpression |
   * SubscriptExpression | Missing | IssetExpression | CastExpression |
   * AnonymousFunction | LambdaExpression | MemberSelectionExpression
   */
  public function getAlternative(): EditableSyntax {
    return TypeAssert\instance_of(EditableSyntax::class, $this->_alternative);
  }
}
