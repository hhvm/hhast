/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<221434eb4d3d29c2ba10d08d95a4c669>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class MarkupSuffix extends Node {

  const string SYNTAX_KIND = 'markup_suffix';

  private Node $_less_than_question;
  private Node $_name;

  public function __construct(
    Node $less_than_question,
    Node $name,
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
    string $_type_hint,
  ): this {
    $offset = $initial_offset;
    $less_than_question = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['markup_suffix_less_than_question'],
      $file,
      $offset,
      $source,
      'LessThanQuestionToken',
    );
    $offset += $less_than_question->getWidth();
    $name = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['markup_suffix_name'],
      $file,
      $offset,
      $source,
      'NameToken',
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
  public function getChildren(): dict<string, Node> {
    return dict[
      'less_than_question' => $this->_less_than_question,
      'name' => $this->_name,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
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

  public function getLessThanQuestionUNTYPED(): Node {
    return $this->_less_than_question;
  }

  public function withLessThanQuestion(Node $value): this {
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

  public function getNameUNTYPED(): Node {
    return $this->_name;
  }

  public function withName(Node $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new static($this->_less_than_question, $value);
  }

  public function hasName(): bool {
    return !$this->_name->isMissing();
  }

  /**
   * @return NameToken
   */
  public function getName(): NameToken {
    return TypeAssert\instance_of(NameToken::class, $this->_name);
  }

  /**
   * @return NameToken
   */
  public function getNamex(): NameToken {
    return $this->getName();
  }
}
