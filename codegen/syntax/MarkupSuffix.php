<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<23a63a099ef274410d1e04c5ea064bc6>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class MarkupSuffix extends EditableNode {

  private EditableNode $_less_than_question;
  private EditableNode $_name;

  public function __construct(
    EditableNode $less_than_question,
    EditableNode $name,
  ) {
    parent::__construct('markup_suffix');
    $this->_less_than_question = $less_than_question;
    $this->_name = $name;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
  ): this {
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
    return new static($less_than_question, $name);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'less_than_question' => $this->_less_than_question,
      'name' => $this->_name,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?vec<EditableNode> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $less_than_question =
      $this->_less_than_question->rewrite($rewriter, $parents);
    $name = $this->_name->rewrite($rewriter, $parents);
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
   * @returns LessThanQuestionToken
   */
  public function getLessThanQuestion(): LessThanQuestionToken {
    return TypeAssert\instance_of(
      LessThanQuestionToken::class,
      $this->_less_than_question,
    );
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
   * @returns NameToken | EqualToken | Missing
   */
  public function getName(): ?EditableToken {
    if ($this->_name->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableToken::class, $this->_name);
  }

  /**
   * @returns NameToken | EqualToken
   */
  public function getNamex(): EditableToken {
    return TypeAssert\instance_of(EditableToken::class, $this->_name);
  }
}
