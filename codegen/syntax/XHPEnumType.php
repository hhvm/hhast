<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<e751969d5539573e377fee1991eb7b72>>
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

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['xhp_enum_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $left_brace = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['xhp_enum_left_brace'],
      $position,
      $source,
    );
    $position += $left_brace->width();
    $values = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['xhp_enum_values'],
      $position,
      $source,
    );
    $position += $values->width();
    $right_brace = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['xhp_enum_right_brace'],
      $position,
      $source,
    );
    $position += $right_brace->width();
    return new self($keyword, $left_brace, $values, $right_brace);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'left_brace' => $this->_left_brace;
    yield 'values' => $this->_values;
    yield 'right_brace' => $this->_right_brace;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $left_brace = $this->_left_brace->rewrite($rewriter, $child_parents);
    $values = $this->_values->rewrite($rewriter, $child_parents);
    $right_brace = $this->_right_brace->rewrite($rewriter, $child_parents);
    if (
      $keyword === $this->_keyword &&
      $left_brace === $this->_left_brace &&
      $values === $this->_values &&
      $right_brace === $this->_right_brace
    ) {
      $node = $this;
    } else {
      $node = new self($keyword, $left_brace, $values, $right_brace);
    }
    return $rewriter($node, $parents);
  }

  public function keyword(): EnumToken {
    return $this->keywordx();
  }

  public function keywordx(): EnumToken {
    return TypeAssert::isInstanceOf(EnumToken::class, $this->_keyword);
  }

  public function raw_keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return
      new self($value, $this->_left_brace, $this->_values, $this->_right_brace);
  }

  public function left_brace(): LeftBraceToken {
    return $this->left_bracex();
  }

  public function left_bracex(): LeftBraceToken {
    return TypeAssert::isInstanceOf(LeftBraceToken::class, $this->_left_brace);
  }

  public function raw_left_brace(): EditableSyntax {
    return $this->_left_brace;
  }

  public function with_left_brace(EditableSyntax $value): this {
    return
      new self($this->_keyword, $value, $this->_values, $this->_right_brace);
  }

  public function values(): EditableList {
    return $this->valuesx();
  }

  public function valuesx(): EditableList {
    return TypeAssert::isInstanceOf(EditableList::class, $this->_values);
  }

  public function raw_values(): EditableSyntax {
    return $this->_values;
  }

  public function with_values(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_brace,
      $value,
      $this->_right_brace,
    );
  }

  public function right_brace(): RightBraceToken {
    return $this->right_bracex();
  }

  public function right_bracex(): RightBraceToken {
    return
      TypeAssert::isInstanceOf(RightBraceToken::class, $this->_right_brace);
  }

  public function raw_right_brace(): EditableSyntax {
    return $this->_right_brace;
  }

  public function with_right_brace(EditableSyntax $value): this {
    return
      new self($this->_keyword, $this->_left_brace, $this->_values, $value);
  }
}
