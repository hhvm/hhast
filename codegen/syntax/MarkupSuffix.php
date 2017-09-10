<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<e81073b0e3c6b131433b6d0a37621a13>>
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

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'less_than_question' => $this->_less_than_question;
    yield 'name' => $this->_name;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $less_than_question =
      $this->_less_than_question->rewrite($rewriter, $child_parents);
    $name = $this->_name->rewrite($rewriter, $child_parents);
    if (
      $less_than_question === $this->_less_than_question &&
      $name === $this->_name
    ) {
      $node = $this;
    } else {
      $node = new self($less_than_question, $name);
    }
    return $rewriter($node, $parents);
  }

  public function less_than_question(): LessThanQuestionToken {
    return $this->less_than_questionx();
  }

  public function less_than_questionx(): LessThanQuestionToken {
    return TypeAssert::isInstanceOf(
      LessThanQuestionToken::class,
      $this->_less_than_question,
    );
  }

  public function raw_less_than_question(): EditableSyntax {
    return $this->_less_than_question;
  }

  public function with_less_than_question(EditableSyntax $value): this {
    return new self($value, $this->_name);
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
    return new self($this->_less_than_question, $value);
  }
}
