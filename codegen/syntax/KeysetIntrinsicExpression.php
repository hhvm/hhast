<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<11d2995fea10050be5587f8099a4224b>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class KeysetIntrinsicExpression extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_left_bracket;
  private EditableSyntax $_members;
  private EditableSyntax $_right_bracket;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $left_bracket,
    EditableSyntax $members,
    EditableSyntax $right_bracket,
  ) {
    parent::__construct('keyset_intrinsic_expression');
    $this->_keyword = $keyword;
    $this->_left_bracket = $left_bracket;
    $this->_members = $members;
    $this->_right_bracket = $right_bracket;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['keyset_intrinsic_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $left_bracket = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['keyset_intrinsic_left_bracket'],
      $position,
      $source,
    );
    $position += $left_bracket->width();
    $members = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['keyset_intrinsic_members'],
      $position,
      $source,
    );
    $position += $members->width();
    $right_bracket = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['keyset_intrinsic_right_bracket'],
      $position,
      $source,
    );
    $position += $right_bracket->width();
    return new self($keyword, $left_bracket, $members, $right_bracket);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'left_bracket' => $this->_left_bracket;
    yield 'members' => $this->_members;
    yield 'right_bracket' => $this->_right_bracket;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $left_bracket = $this->_left_bracket->rewrite($rewriter, $child_parents);
    $members = $this->_members->rewrite($rewriter, $child_parents);
    $right_bracket = $this->_right_bracket->rewrite($rewriter, $child_parents);
    if (
      $keyword === $this->_keyword &&
      $left_bracket === $this->_left_bracket &&
      $members === $this->_members &&
      $right_bracket === $this->_right_bracket
    ) {
      $node = $this;
    } else {
      $node = new self($keyword, $left_bracket, $members, $right_bracket);
    }
    return $rewriter($node, $parents);
  }

  public function keyword(): KeysetToken {
    return $this->keywordx();
  }

  public function keywordx(): KeysetToken {
    return TypeAssert::isInstanceOf(KeysetToken::class, $this->_keyword);
  }

  public function raw_keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self(
      $value,
      $this->_left_bracket,
      $this->_members,
      $this->_right_bracket,
    );
  }

  public function left_bracket(): LeftBracketToken {
    return $this->left_bracketx();
  }

  public function left_bracketx(): LeftBracketToken {
    return
      TypeAssert::isInstanceOf(LeftBracketToken::class, $this->_left_bracket);
  }

  public function raw_left_bracket(): EditableSyntax {
    return $this->_left_bracket;
  }

  public function with_left_bracket(EditableSyntax $value): this {
    return
      new self($this->_keyword, $value, $this->_members, $this->_right_bracket);
  }

  public function members(): ?EditableList {
    return $this->_members->is_missing()
      ? null
      : TypeAssert::isInstanceOf(EditableList::class, $this->_members);
  }

  public function membersx(): EditableList {
    return TypeAssert::isInstanceOf(EditableList::class, $this->_members);
  }

  public function raw_members(): EditableSyntax {
    return $this->_members;
  }

  public function with_members(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_bracket,
      $value,
      $this->_right_bracket,
    );
  }

  public function right_bracket(): RightBracketToken {
    return $this->right_bracketx();
  }

  public function right_bracketx(): RightBracketToken {
    return
      TypeAssert::isInstanceOf(RightBracketToken::class, $this->_right_bracket);
  }

  public function raw_right_bracket(): EditableSyntax {
    return $this->_right_bracket;
  }

  public function with_right_bracket(EditableSyntax $value): this {
    return
      new self($this->_keyword, $this->_left_bracket, $this->_members, $value);
  }
}
