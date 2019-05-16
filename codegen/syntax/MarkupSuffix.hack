/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<86347c07e0fb4e0dbb104c5c66f9204a>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class MarkupSuffix extends EditableNode {

  const string SYNTAX_KIND = 'markup_suffix';

  private EditableNode $_less_than_question;
  private EditableNode $_name;

  public function __construct(
    EditableNode $less_than_question,
    EditableNode $name,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_less_than_question = $less_than_question;
    $this->_name = $name;
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
    $less_than_question = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['markup_suffix_less_than_question'],
      $file,
      $offset,
      $source,
    );
    $offset += $less_than_question->getWidth();
    $name = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['markup_suffix_name'],
      $file,
      $offset,
      $source,
    );
    $offset += $name->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static($less_than_question, $name, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'less_than_question' => $this->_less_than_question,
      'name' => $this->_name,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<EditableNode> $parents = vec[],
  ): this {
    $parents[] = $this;
    $less_than_question = $rewriter($this->_less_than_question, $parents);
    $name = $rewriter($this->_name, $parents);
    if (
      $less_than_question === $this->_less_than_question &&
      $name === $this->_name
    ) {
      return $this;
    }
    return new static($less_than_question, $name);
  }

  public function getLessThanQuestionUNTYPED(): EditableNode {
    return $this->_less_than_question;
  }

  public function withLessThanQuestion(EditableNode $value): this {
    if ($value === $this->_less_than_question) {
      return $this;
    }
    return new static($value, $this->_name);
  }

  public function hasLessThanQuestion(): bool {
    return !$this->_less_than_question->isMissing();
  }

  /**
   * @return LessThanQuestionToken
   */
  public function getLessThanQuestion(): LessThanQuestionToken {
    return TypeAssert\instance_of(
      LessThanQuestionToken::class,
      $this->_less_than_question,
    );
  }

  /**
   * @return LessThanQuestionToken
   */
  public function getLessThanQuestionx(): LessThanQuestionToken {
    return $this->getLessThanQuestion();
  }

  public function getNameUNTYPED(): EditableNode {
    return $this->_name;
  }

  public function withName(EditableNode $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new static($this->_less_than_question, $value);
  }

  public function hasName(): bool {
    return !$this->_name->isMissing();
  }

  /**
   * @return null | NameToken
   */
  public function getName(): ?NameToken {
    if ($this->_name->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(NameToken::class, $this->_name);
  }

  /**
   * @return NameToken
   */
  public function getNamex(): NameToken {
    return TypeAssert\not_null($this->getName());
  }
}
