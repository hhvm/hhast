<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<ab9b6d955d8ff11df4723b873825710b>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class NullableTypeSpecifier extends EditableNode {

  private EditableNode $_question;
  private EditableNode $_type;

  public function __construct(EditableNode $question, EditableNode $type) {
    parent::__construct('nullable_type_specifier');
    $this->_question = $question;
    $this->_type = $type;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $question = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['nullable_question'],
      $position,
      $source,
    );
    $position += $question->getWidth();
    $type = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['nullable_type'],
      $position,
      $source,
    );
    $position += $type->getWidth();
    return new self($question, $type);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableNode> {
    return dict['question' => $this->_question, 'type' => $this->_type];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?Traversable<EditableNode> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $question = $this->_question->rewrite($rewriter, $parents);
    $type = $this->_type->rewrite($rewriter, $parents);
    if ($question === $this->_question && $type === $this->_type) {
      return $this;
    }
    return new self($question, $type);
  }

  public function getQuestionUNTYPED(): EditableNode {
    return $this->_question;
  }

  public function withQuestion(EditableNode $value): this {
    if ($value === $this->_question) {
      return $this;
    }
    return new self($value, $this->_type);
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

  public function getTypeUNTYPED(): EditableNode {
    return $this->_type;
  }

  public function withType(EditableNode $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return new self($this->_question, $value);
  }

  public function hasType(): bool {
    return !$this->_type->isMissing();
  }

  /**
   * @returns SimpleTypeSpecifier | GenericTypeSpecifier | TupleTypeSpecifier |
   * MapArrayTypeSpecifier | DictionaryTypeSpecifier | ShapeTypeSpecifier |
   * TypeConstant | ClosureTypeSpecifier | VectorArrayTypeSpecifier |
   * KeysetTypeSpecifier | VectorTypeSpecifier
   */
  public function getType(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_type);
  }
}
