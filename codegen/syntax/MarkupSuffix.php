<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<c1f917ca70d81b3afaabfc57a142fcd7>>
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
  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $less_than_question = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['markup_suffix_less_than_question'],
      $position,
      $source,
    );
    $position += $less_than_question->width();
    $name = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['markup_suffix_name'],
      $position,
      $source,
    );
    $position += $name->width();
    return new self($less_than_question, $name);
  }

  <<__Override>>
  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'less_than_question' => $this->_less_than_question;
    yield 'name' => $this->_name;
  }

  <<__Override>>
  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $less_than_question = $this->_less_than_question->rewrite($rewriter, $parents);
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
    return !$this->_less_than_question->is_missing();
  }

  public function getLessThanQuestion(): LessThanQuestionToken {
    return TypeAssert::isInstanceOf(LessThanQuestionToken::class, $this->_less_than_question);
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
    return !$this->_name->is_missing();
  }

  public function getName(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_name);
  }
}
