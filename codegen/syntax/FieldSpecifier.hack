/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<afed3fb3995c1310e0c23e141fedbf44>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class FieldSpecifier extends EditableNode implements ITypeSpecifier {

  const string SYNTAX_KIND = 'field_specifier';

  private EditableNode $_question;
  private EditableNode $_name;
  private EditableNode $_arrow;
  private EditableNode $_type;

  public function __construct(
    EditableNode $question,
    EditableNode $name,
    EditableNode $arrow,
    EditableNode $type,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_question = $question;
    $this->_name = $name;
    $this->_arrow = $arrow;
    $this->_type = $type;
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
    $question = EditableNode::fromJSON(
      /* HH_FIXME[4110] */ $json['field_question'],
      $file,
      $offset,
      $source,
    );
    $offset += $question->getWidth();
    $name = EditableNode::fromJSON(
      /* HH_FIXME[4110] */ $json['field_name'],
      $file,
      $offset,
      $source,
    );
    $offset += $name->getWidth();
    $arrow = EditableNode::fromJSON(
      /* HH_FIXME[4110] */ $json['field_arrow'],
      $file,
      $offset,
      $source,
    );
    $offset += $arrow->getWidth();
    $type = EditableNode::fromJSON(
      /* HH_FIXME[4110] */ $json['field_type'],
      $file,
      $offset,
      $source,
    );
    $offset += $type->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static($question, $name, $arrow, $type, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'question' => $this->_question,
      'name' => $this->_name,
      'arrow' => $this->_arrow,
      'type' => $this->_type,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<EditableNode> $parents = vec[],
  ): this {
    $parents[] = $this;
    $question = $rewriter($this->_question, $parents);
    $name = $rewriter($this->_name, $parents);
    $arrow = $rewriter($this->_arrow, $parents);
    $type = $rewriter($this->_type, $parents);
    if (
      $question === $this->_question &&
      $name === $this->_name &&
      $arrow === $this->_arrow &&
      $type === $this->_type
    ) {
      return $this;
    }
    return new static($question, $name, $arrow, $type);
  }

  public function getQuestionUNTYPED(): EditableNode {
    return $this->_question;
  }

  public function withQuestion(EditableNode $value): this {
    if ($value === $this->_question) {
      return $this;
    }
    return new static($value, $this->_name, $this->_arrow, $this->_type);
  }

  public function hasQuestion(): bool {
    return !$this->_question->isMissing();
  }

  /**
   * @return null | QuestionToken
   */
  public function getQuestion(): ?QuestionToken {
    if ($this->_question->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(QuestionToken::class, $this->_question);
  }

  /**
   * @return QuestionToken
   */
  public function getQuestionx(): QuestionToken {
    return TypeAssert\not_null($this->getQuestion());
  }

  public function getNameUNTYPED(): EditableNode {
    return $this->_name;
  }

  public function withName(EditableNode $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new static($this->_question, $value, $this->_arrow, $this->_type);
  }

  public function hasName(): bool {
    return !$this->_name->isMissing();
  }

  /**
   * @return LiteralExpression | ScopeResolutionExpression
   */
  <<__Memoize>>
  public function getName(): IExpression {
    return __Private\Wrap\wrap_IExpression($this->_name);
  }

  /**
   * @return LiteralExpression | ScopeResolutionExpression
   */
  public function getNamex(): IExpression {
    return $this->getName();
  }

  public function getArrowUNTYPED(): EditableNode {
    return $this->_arrow;
  }

  public function withArrow(EditableNode $value): this {
    if ($value === $this->_arrow) {
      return $this;
    }
    return new static($this->_question, $this->_name, $value, $this->_type);
  }

  public function hasArrow(): bool {
    return !$this->_arrow->isMissing();
  }

  /**
   * @return EqualGreaterThanToken
   */
  public function getArrow(): EqualGreaterThanToken {
    return TypeAssert\instance_of(EqualGreaterThanToken::class, $this->_arrow);
  }

  /**
   * @return EqualGreaterThanToken
   */
  public function getArrowx(): EqualGreaterThanToken {
    return $this->getArrow();
  }

  public function getTypeUNTYPED(): EditableNode {
    return $this->_type;
  }

  public function withType(EditableNode $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return new static($this->_question, $this->_name, $this->_arrow, $value);
  }

  public function hasType(): bool {
    return !$this->_type->isMissing();
  }

  /**
   * @return ClosureTypeSpecifier | GenericTypeSpecifier |
   * NullableTypeSpecifier | ShapeTypeSpecifier | SimpleTypeSpecifier |
   * SoftTypeSpecifier | TupleTypeSpecifier | TypeConstant | VectorTypeSpecifier
   */
  public function getType(): ITypeSpecifier {
    return TypeAssert\instance_of(ITypeSpecifier::class, $this->_type);
  }

  /**
   * @return ClosureTypeSpecifier | GenericTypeSpecifier |
   * NullableTypeSpecifier | ShapeTypeSpecifier | SimpleTypeSpecifier |
   * SoftTypeSpecifier | TupleTypeSpecifier | TypeConstant | VectorTypeSpecifier
   */
  public function getTypex(): ITypeSpecifier {
    return $this->getType();
  }
}
