<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<edba7e41d19190bc69ad6729c69b2d29>>
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

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $question = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['nullable_question'],
      $position,
      $source,
    );
    $position += $question->getWidth();
    $type = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['nullable_type'],
      $position,
      $source,
    );
    $position += $type->getWidth();
    return new self($question, $type);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'question' => $this->_question;
    yield 'type' => $this->_type;
  }

  <<__Override>>
  public function rewriteDescendants(
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

  public function getQuestionUNTYPED(): EditableSyntax {
    return $this->_question;
  }

  public function withQuestion(EditableSyntax $value): this {
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
    return TypeAssert::isInstanceOf(QuestionToken::class, $this->_question);
  }

  public function getTypeUNTYPED(): EditableSyntax {
    return $this->_type;
  }

  public function withType(EditableSyntax $value): this {
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
  public function getType(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_type);
  }
}
