<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<82a68d061652e99285475c415327eb2e>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class NullableTypeSpecifier extends EditableSyntax {

  private EditableSyntax $_question;
  private EditableSyntax $_type;

  public function __construct(EditableSyntax $question, EditableSyntax $type) {
    parent::__construct('nullable_type_specifier');
    $this->_question = $question;
    $this->_type = $type;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $question = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['nullable_question'],
      $position,
      $source,
    );
    $position += $question->width();
    $type = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['nullable_type'],
      $position,
      $source,
    );
    $position += $type->width();
    return new self($question, $type);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'question' => $this->_question;
    yield 'type' => $this->_type;
  }

  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $question = $this->_question->rewrite($rewriter, $parents);
    $type = $this->_type->rewrite($rewriter, $parents);
    if (
      $question === $this->_question &&
      $type === $this->_type
    ) {
      return $this;
    }
    return new self($question, $type);
  }

  public function question(): QuestionToken {
    return $this->questionx();
  }

  public function questionx(): QuestionToken {
    return TypeAssert::isInstanceOf(QuestionToken::class, $this->_question);
  }

  public function raw_question(): EditableSyntax {
    return $this->_question;
  }

  public function with_question(EditableSyntax $value): this {
    return new self($value, $this->_type);
  }

  public function type(): EditableSyntax {
    return $this->typex();
  }

  public function typex(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_type);
  }

  public function raw_type(): EditableSyntax {
    return $this->_type;
  }

  public function with_type(EditableSyntax $value): this {
    return new self($this->_question, $value);
  }
}
