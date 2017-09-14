<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<584ec9752cda100caba3636245b7e68e>>
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

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $left_brace = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['classish_body_left_brace'],
      $position,
      $source,
    );
    $position += $left_brace->getWidth();
    $elements = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['classish_body_elements'],
      $position,
      $source,
    );
    $position += $elements->getWidth();
    $right_brace = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['classish_body_right_brace'],
      $position,
      $source,
    );
    $position += $right_brace->getWidth();
    return new self($left_brace, $elements, $right_brace);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'left_brace' => $this->_left_brace;
    yield 'elements' => $this->_elements;
    yield 'right_brace' => $this->_right_brace;
  }

  <<__Override>>
  public function rewriteDescendants(
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

  public function getLeftBraceUNTYPED(): EditableSyntax {
    return $this->_left_brace;
  }

  public function withLeftBrace(EditableSyntax $value): this {
    if ($value === $this->_left_brace) {
      return $this;
    }
    return new self($value, $this->_elements, $this->_right_brace);
  }

  public function hasLeftBrace(): bool {
    return !$this->_left_brace->isMissing();
  }

  /**
   * @returns LeftBraceToken | Missing
   */
  public function getLeftBrace(): ?LeftBraceToken {
    if ($this->_left_brace->isMissing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(LeftBraceToken::class, $this->_left_brace);
  }

  /**
   * @returns LeftBraceToken
   */
  public function getLeftBracex(): LeftBraceToken {
    return TypeAssert::isInstanceOf(LeftBraceToken::class, $this->_left_brace);
  }

  public function getElementsUNTYPED(): EditableSyntax {
    return $this->_elements;
  }

  public function withElements(EditableSyntax $value): this {
    if ($value === $this->_elements) {
      return $this;
    }
    return new self($this->_left_brace, $value, $this->_right_brace);
  }

  public function hasElements(): bool {
    return !$this->_elements->isMissing();
  }

  /**
   * @returns EditableList | Missing
   */
  public function getElements(): ?EditableList {
    if ($this->_elements->isMissing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(EditableList::class, $this->_elements);
  }

  /**
   * @returns EditableList
   */
  public function getElementsx(): EditableList {
    return TypeAssert::isInstanceOf(EditableList::class, $this->_elements);
  }

  public function getRightBraceUNTYPED(): EditableSyntax {
    return $this->_right_brace;
  }

  public function withRightBrace(EditableSyntax $value): this {
    if ($value === $this->_right_brace) {
      return $this;
    }
    return new self($this->_left_brace, $this->_elements, $value);
  }

  public function hasRightBrace(): bool {
    return !$this->_right_brace->isMissing();
  }

  /**
   * @returns RightBraceToken | Missing
   */
  public function getRightBrace(): ?RightBraceToken {
    if ($this->_right_brace->isMissing()) {
      return null;
    }
    return
      TypeAssert::isInstanceOf(RightBraceToken::class, $this->_right_brace);
  }

  /**
   * @returns RightBraceToken
   */
  public function getRightBracex(): RightBraceToken {
    return
      TypeAssert::isInstanceOf(RightBraceToken::class, $this->_right_brace);
  }
}
