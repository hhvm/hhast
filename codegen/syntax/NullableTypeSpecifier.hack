/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<b2330eebfc237bbd6a5d1d92e196dd98>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class NullableTypeSpecifier extends Node implements ITypeSpecifier {

  const string SYNTAX_KIND = 'nullable_type_specifier';

  private Node $_question;
  private Node $_type;

  public function __construct(
    Node $question,
    Node $type,
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
    string $_type_hint,
  ): this {
    $offset = $initial_offset;
    $question = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['nullable_question'],
      $file,
      $offset,
      $source,
      'QuestionToken',
    );
    $offset += $question->getWidth();
    $type = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['nullable_type'],
      $file,
      $offset,
      $source,
      'ITypeSpecifier',
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
  public function getChildren(): dict<string, Node> {
    return dict[
      'question' => $this->_question,
      'type' => $this->_type,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $question = $rewriter($this->_question, $parents);
    $type = $rewriter($this->_type, $parents);
    if ($question === $this->_question && $type === $this->_type) {
      return $this;
    }
    return new static($question, $type);
  }

  public function getQuestionUNTYPED(): Node {
    return $this->_question;
  }

  public function withQuestion(QuestionToken $value): this {
    if ($value === $this->_question) {
      return $this;
    }
    return new static($value ?? Missing(), $this->_type);
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

  public function getTypeUNTYPED(): Node {
    return $this->_type;
  }

  public function withType(ITypeSpecifier $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return new static($this->_question, $value ?? Missing());
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
