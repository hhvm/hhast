<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<c7b8c683e16afba5261586710c0d0a8a>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class ClassishBody extends EditableSyntax {

  private EditableSyntax $_left_brace;
  private EditableSyntax $_elements;
  private EditableSyntax $_right_brace;

  public function __construct(
    EditableSyntax $left_brace,
    EditableSyntax $elements,
    EditableSyntax $right_brace,
  ) {
    parent::__construct('classish_body');
    $this->_left_brace = $left_brace;
    $this->_elements = $elements;
    $this->_right_brace = $right_brace;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $left_brace = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['classish_body_left_brace'],
      $position,
      $source,
    );
    $position += $left_brace->width();
    $elements = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['classish_body_elements'],
      $position,
      $source,
    );
    $position += $elements->width();
    $right_brace = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['classish_body_right_brace'],
      $position,
      $source,
    );
    $position += $right_brace->width();
    return new self($left_brace, $elements, $right_brace);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'left_brace' => $this->_left_brace;
    yield 'elements' => $this->_elements;
    yield 'right_brace' => $this->_right_brace;
  }

  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $left_brace = $this->_left_brace->rewrite($rewriter, $parents);
    $elements = $this->_elements->rewrite($rewriter, $parents);
    $right_brace = $this->_right_brace->rewrite($rewriter, $parents);
    if (
      $left_brace === $this->_left_brace &&
      $elements === $this->_elements &&
      $right_brace === $this->_right_brace
    ) {
      return $this;
    }
    return new self($left_brace, $elements, $right_brace);
  }

  public function left_brace(): ?LeftBraceToken {
    return $this->_left_brace->is_missing() ? null : TypeAssert::isInstanceOf(LeftBraceToken::class, $this->_left_brace);
  }

  public function left_bracex(): LeftBraceToken {
    return TypeAssert::isInstanceOf(LeftBraceToken::class, $this->_left_brace);
  }

  public function raw_left_brace(): EditableSyntax {
    return $this->_left_brace;
  }

  public function with_left_brace(EditableSyntax $value): this {
    return new self($value, $this->_elements, $this->_right_brace);
  }

  public function elements(): ?EditableList {
    return $this->_elements->is_missing() ? null : TypeAssert::isInstanceOf(EditableList::class, $this->_elements);
  }

  public function elementsx(): EditableList {
    return TypeAssert::isInstanceOf(EditableList::class, $this->_elements);
  }

  public function raw_elements(): EditableSyntax {
    return $this->_elements;
  }

  public function with_elements(EditableSyntax $value): this {
    return new self($this->_left_brace, $value, $this->_right_brace);
  }

  public function right_brace(): ?RightBraceToken {
    return $this->_right_brace->is_missing() ? null : TypeAssert::isInstanceOf(RightBraceToken::class, $this->_right_brace);
  }

  public function right_bracex(): RightBraceToken {
    return TypeAssert::isInstanceOf(RightBraceToken::class, $this->_right_brace);
  }

  public function raw_right_brace(): EditableSyntax {
    return $this->_right_brace;
  }

  public function with_right_brace(EditableSyntax $value): this {
    return new self($this->_left_brace, $this->_elements, $value);
  }
}
