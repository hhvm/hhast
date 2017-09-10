<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<2d321831b84924ff14a1e05c8a695743>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class FieldSpecifier extends EditableSyntax {

  private EditableSyntax $_question;
  private EditableSyntax $_name;
  private EditableSyntax $_arrow;
  private EditableSyntax $_type;

  public function __construct(
    EditableSyntax $question,
    EditableSyntax $name,
    EditableSyntax $arrow,
    EditableSyntax $type,
  ) {
    parent::__construct('field_specifier');
    $this->_question = $question;
    $this->_name = $name;
    $this->_arrow = $arrow;
    $this->_type = $type;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $question = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['field_question'],
      $position,
      $source,
    );
    $position += $question->width();
    $name = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['field_name'],
      $position,
      $source,
    );
    $position += $name->width();
    $arrow = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['field_arrow'],
      $position,
      $source,
    );
    $position += $arrow->width();
    $type = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['field_type'],
      $position,
      $source,
    );
    $position += $type->width();
    return new self($question, $name, $arrow, $type);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'question' => $this->_question;
    yield 'name' => $this->_name;
    yield 'arrow' => $this->_arrow;
    yield 'type' => $this->_type;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $question = $this->_question->rewrite($rewriter, $child_parents);
    $name = $this->_name->rewrite($rewriter, $child_parents);
    $arrow = $this->_arrow->rewrite($rewriter, $child_parents);
    $type = $this->_type->rewrite($rewriter, $child_parents);
    if (
      $question === $this->_question &&
      $name === $this->_name &&
      $arrow === $this->_arrow &&
      $type === $this->_type
    ) {
      $node = $this;
    } else {
      $node = new self($question, $name, $arrow, $type);
    }
    return $rewriter($node, $parents);
  }

  public function question(): ?QuestionToken {
    return $this->_question->is_missing()
      ? null
      : TypeAssert::isInstanceOf(QuestionToken::class, $this->_question);
  }

  public function questionx(): QuestionToken {
    return TypeAssert::isInstanceOf(QuestionToken::class, $this->_question);
  }

  public function raw_question(): EditableSyntax {
    return $this->_question;
  }

  public function with_question(EditableSyntax $value): this {
    return new self($value, $this->_name, $this->_arrow, $this->_type);
  }

  public function name(): EditableSyntax {
    return $this->namex();
  }

  public function namex(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_name);
  }

  public function raw_name(): EditableSyntax {
    return $this->_name;
  }

  public function with_name(EditableSyntax $value): this {
    return new self($this->_question, $value, $this->_arrow, $this->_type);
  }

  public function arrow(): EqualGreaterThanToken {
    return $this->arrowx();
  }

  public function arrowx(): EqualGreaterThanToken {
    return
      TypeAssert::isInstanceOf(EqualGreaterThanToken::class, $this->_arrow);
  }

  public function raw_arrow(): EditableSyntax {
    return $this->_arrow;
  }

  public function with_arrow(EditableSyntax $value): this {
    return new self($this->_question, $this->_name, $value, $this->_type);
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
    return new self($this->_question, $this->_name, $this->_arrow, $value);
  }
}
