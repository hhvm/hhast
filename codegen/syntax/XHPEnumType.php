<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<242e0e25177f83e125e2566ef30c005e>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class XHPEnumType extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_left_brace;
  private EditableSyntax $_values;
  private EditableSyntax $_right_brace;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $left_brace,
    EditableSyntax $values,
    EditableSyntax $right_brace,
  ) {
    parent::__construct('xhp_enum_type');
    $this->_keyword = $keyword;
    $this->_left_brace = $left_brace;
    $this->_values = $values;
    $this->_right_brace = $right_brace;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['xhp_enum_keyword'],
      $position,
      $source,
    );
    $position += $keyword->getWidth();
    $left_brace = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['xhp_enum_left_brace'],
      $position,
      $source,
    );
    $position += $left_brace->getWidth();
    $values = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['xhp_enum_values'],
      $position,
      $source,
    );
    $position += $values->getWidth();
    $right_brace = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['xhp_enum_right_brace'],
      $position,
      $source,
    );
    $position += $right_brace->getWidth();
    return new self($keyword, $left_brace, $values, $right_brace);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'left_brace' => $this->_left_brace;
    yield 'values' => $this->_values;
    yield 'right_brace' => $this->_right_brace;
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $parents);
    $left_brace = $this->_left_brace->rewrite($rewriter, $parents);
    $values = $this->_values->rewrite($rewriter, $parents);
    $right_brace = $this->_right_brace->rewrite($rewriter, $parents);
    if (
      $keyword === $this->_keyword &&
      $left_brace === $this->_left_brace &&
      $values === $this->_values &&
      $right_brace === $this->_right_brace
    ) {
      return $this;
    }
    return new self($keyword, $left_brace, $values, $right_brace);
  }

  public function getKeywordUNTYPED(): EditableSyntax {
    return $this->_keyword;
  }

  public function withKeyword(EditableSyntax $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new self($value, $this->_left_brace, $this->_values, $this->_right_brace);
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  /**
   * @returns EnumToken
   */
  public function getKeyword(): EnumToken {
    return TypeAssert::isInstanceOf(EnumToken::class, $this->_keyword);
  }

  public function getLeftBraceUNTYPED(): EditableSyntax {
    return $this->_left_brace;
  }

  public function withLeftBrace(EditableSyntax $value): this {
    if ($value === $this->_left_brace) {
      return $this;
    }
    return new self($this->_keyword, $value, $this->_values, $this->_right_brace);
  }

  public function hasLeftBrace(): bool {
    return !$this->_left_brace->isMissing();
  }

  /**
   * @returns LeftBraceToken
   */
  public function getLeftBrace(): LeftBraceToken {
    return TypeAssert::isInstanceOf(LeftBraceToken::class, $this->_left_brace);
  }

  public function getValuesUNTYPED(): EditableSyntax {
    return $this->_values;
  }

  public function withValues(EditableSyntax $value): this {
    if ($value === $this->_values) {
      return $this;
    }
    return new self($this->_keyword, $this->_left_brace, $value, $this->_right_brace);
  }

  public function hasValues(): bool {
    return !$this->_values->isMissing();
  }

  /**
   * @returns EditableList
   */
  public function getValues(): EditableList {
    return TypeAssert::isInstanceOf(EditableList::class, $this->_values);
  }

  public function getRightBraceUNTYPED(): EditableSyntax {
    return $this->_right_brace;
  }

  public function withRightBrace(EditableSyntax $value): this {
    if ($value === $this->_right_brace) {
      return $this;
    }
    return new self($this->_keyword, $this->_left_brace, $this->_values, $value);
  }

  public function hasRightBrace(): bool {
    return !$this->_right_brace->isMissing();
  }

  /**
   * @returns RightBraceToken
   */
  public function getRightBrace(): RightBraceToken {
    return TypeAssert::isInstanceOf(RightBraceToken::class, $this->_right_brace);
  }
}
