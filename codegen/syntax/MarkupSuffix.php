<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<0cb89ff686e2e4e75029dd2bfa9a1c58>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class MarkupSuffix extends EditableSyntax {

  private EditableSyntax $_less_than_question;
  private EditableSyntax $_name;

  public function __construct(
    EditableSyntax $less_than_question,
    EditableSyntax $name,
  ) {
    parent::__construct('markup_suffix');
    $this->_less_than_question = $less_than_question;
    $this->_name = $name;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $less_than_question = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['markup_suffix_less_than_question'],
      $position,
      $source,
    );
    $position += $less_than_question->getWidth();
    $name = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['markup_suffix_name'],
      $position,
      $source,
    );
    $position += $name->getWidth();
    return new self($less_than_question, $name);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'less_than_question' => $this->_less_than_question;
    yield 'name' => $this->_name;
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
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
    return new self($less_than_question, $name);
  }

  public function getLessThanQuestionUNTYPED(): EditableSyntax {
    return $this->_less_than_question;
  }

  public function withLessThanQuestion(EditableSyntax $value): this {
    if ($value === $this->_less_than_question) {
      return $this;
    }
    return new self($value, $this->_name);
  }

  public function hasLessThanQuestion(): bool {
    return !$this->_less_than_question->isMissing();
  }

  /**
   * @returns LessThanQuestionToken
   */
  public function getLessThanQuestion(): LessThanQuestionToken {
    return TypeAssert::isInstanceOf(
      LessThanQuestionToken::class,
      $this->_less_than_question,
    );
  }

  public function getNameUNTYPED(): EditableSyntax {
    return $this->_name;
  }

  public function withName(EditableSyntax $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new self($this->_less_than_question, $value);
  }

  public function hasName(): bool {
    return !$this->_name->isMissing();
  }

  /**
   * @returns Missing | NameToken | EqualToken
   */
  public function getName(): ?EditableToken {
    if ($this->_name->isMissing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(EditableToken::class, $this->_name);
  }

  /**
   * @returns NameToken | EqualToken
   */
  public function getNamex(): EditableToken {
    return TypeAssert::isInstanceOf(EditableToken::class, $this->_name);
  }
}
