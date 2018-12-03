<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<b820c0bbfaa01d1a99e9c55f1f0852aa>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class FieldSpecifier extends EditableNode {

  private EditableNode $_question;
  private EditableNode $_name;
  private EditableNode $_arrow;
  private EditableNode $_type;

  public function __construct(
    EditableNode $question,
    EditableNode $name,
    EditableNode $arrow,
    EditableNode $type,
  ) {
    parent::__construct('field_specifier');
    $this->_question = $question;
    $this->_name = $name;
    $this->_arrow = $arrow;
    $this->_type = $type;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
  ): this {
    $question = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['field_question'],
      $file,
      $offset,
      $source,
    );
    $offset += $question->getWidth();
    $name = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['field_name'],
      $file,
      $offset,
      $source,
    );
    $offset += $name->getWidth();
    $arrow = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['field_arrow'],
      $file,
      $offset,
      $source,
    );
    $offset += $arrow->getWidth();
    $type = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['field_type'],
      $file,
      $offset,
      $source,
    );
    $offset += $type->getWidth();
    return new static($question, $name, $arrow, $type);
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
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?vec<EditableNode> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $question = $this->_question->rewrite($rewriter, $parents);
    $name = $this->_name->rewrite($rewriter, $parents);
    $arrow = $this->_arrow->rewrite($rewriter, $parents);
    $type = $this->_type->rewrite($rewriter, $parents);
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
    return TypeAssert\instance_of(QuestionToken::class, $this->_question);
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
  public function getName(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_name);
  }

  /**
   * @return LiteralExpression | ScopeResolutionExpression
   */
  public function getNamex(): EditableNode {
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
   * TypeConstant | VectorTypeSpecifier
   */
  public function getType(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_type);
  }

  /**
   * @return ClosureTypeSpecifier | GenericTypeSpecifier |
   * NullableTypeSpecifier | ShapeTypeSpecifier | SimpleTypeSpecifier |
   * TypeConstant | VectorTypeSpecifier
   */
  public function getTypex(): EditableNode {
    return $this->getType();
  }
}
