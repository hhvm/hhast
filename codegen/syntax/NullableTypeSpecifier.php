<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<54671d8dab3acfa7d4ea77395a7f6cb0>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
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
    string $file,
    int $offset,
    string $source,
  ): this {
    $question = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['nullable_question'],
      $file,
      $offset,
      $source,
    );
    $offset += $question->getWidth();
    $type = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['nullable_type'],
      $file,
      $offset,
      $source,
    );
    $offset += $type->getWidth();
    return new static($question, $type);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'question' => $this->_question,
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
    $type = $this->_type->rewrite($rewriter, $parents);
    if ($question === $this->_question && $type === $this->_type) {
      return $this;
    }
    return new static($question, $type);
  }

  public function getQuestionUNTYPED(): EditableNode {
    return $this->_question;
  }

  public function withQuestion(EditableNode $value): this {
    if ($value === $this->_question) {
      return $this;
    }
    return new static($value, $this->_type);
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

  public function getTypeUNTYPED(): EditableNode {
    return $this->_type;
  }

  public function withType(EditableNode $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return new static($this->_question, $value);
  }

  public function hasType(): bool {
    return !$this->_type->isMissing();
  }

  /**
   * @return ClosureTypeSpecifier | DictionaryTypeSpecifier |
   * GenericTypeSpecifier | KeysetTypeSpecifier | MapArrayTypeSpecifier |
   * ShapeTypeSpecifier | SimpleTypeSpecifier | SoftTypeSpecifier |
   * TupleTypeSpecifier | TypeConstant | VectorArrayTypeSpecifier |
   * VectorTypeSpecifier
   */
  public function getType(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_type);
  }

  /**
   * @return ClosureTypeSpecifier | DictionaryTypeSpecifier |
   * GenericTypeSpecifier | KeysetTypeSpecifier | MapArrayTypeSpecifier |
   * ShapeTypeSpecifier | SimpleTypeSpecifier | SoftTypeSpecifier |
   * TupleTypeSpecifier | TypeConstant | VectorArrayTypeSpecifier |
   * VectorTypeSpecifier
   */
  public function getTypex(): EditableNode {
    return $this->getType();
  }
}
