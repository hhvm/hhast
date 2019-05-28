/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<e2d0c6d6becbbeb63563d95b6cd1e824>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class NullableTypeSpecifier
  extends EditableNode
  implements ITypeSpecifier {

  const string SYNTAX_KIND = 'nullable_type_specifier';

  private EditableNode $_question;
  private EditableNode $_type;

  public function __construct(
    EditableNode $question,
    EditableNode $type,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_question = $question;
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
      /* HH_FIXME[4110] */ $json['nullable_question'],
      $file,
      $offset,
      $source,
    );
    $offset += $question->getWidth();
    $type = EditableNode::fromJSON(
      /* HH_FIXME[4110] */ $json['nullable_type'],
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
    return new static($question, $type, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'question' => $this->_question,
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
    $type = $rewriter($this->_type, $parents);
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
   * GenericTypeSpecifier | LikeTypeSpecifier | MapArrayTypeSpecifier |
   * ShapeTypeSpecifier | SimpleTypeSpecifier | SoftTypeSpecifier |
   * TupleTypeSpecifier | TypeConstant | VectorArrayTypeSpecifier |
   * VectorTypeSpecifier
   */
  public function getType(): ITypeSpecifier {
    return TypeAssert\instance_of(ITypeSpecifier::class, $this->_type);
  }

  /**
   * @return ClosureTypeSpecifier | DictionaryTypeSpecifier |
   * GenericTypeSpecifier | LikeTypeSpecifier | MapArrayTypeSpecifier |
   * ShapeTypeSpecifier | SimpleTypeSpecifier | SoftTypeSpecifier |
   * TupleTypeSpecifier | TypeConstant | VectorArrayTypeSpecifier |
   * VectorTypeSpecifier
   */
  public function getTypex(): ITypeSpecifier {
    return $this->getType();
  }
}
