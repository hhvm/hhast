<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<fda538f26ad441dcb56085272567f800>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class ListExpression extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_left_paren;
  private EditableSyntax $_members;
  private EditableSyntax $_right_paren;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $left_paren,
    EditableSyntax $members,
    EditableSyntax $right_paren,
  ) {
    parent::__construct('list_expression');
    $this->_keyword = $keyword;
    $this->_left_paren = $left_paren;
    $this->_members = $members;
    $this->_right_paren = $right_paren;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['list_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $left_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['list_left_paren'],
      $position,
      $source,
    );
    $position += $left_paren->width();
    $members = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['list_members'],
      $position,
      $source,
    );
    $position += $members->width();
    $right_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['list_right_paren'],
      $position,
      $source,
    );
    $position += $right_paren->width();
    return new self($keyword, $left_paren, $members, $right_paren);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'left_paren' => $this->_left_paren;
    yield 'members' => $this->_members;
    yield 'right_paren' => $this->_right_paren;
  }

  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $parents);
    $left_paren = $this->_left_paren->rewrite($rewriter, $parents);
    $members = $this->_members->rewrite($rewriter, $parents);
    $right_paren = $this->_right_paren->rewrite($rewriter, $parents);
    if (
      $keyword === $this->_keyword &&
      $left_paren === $this->_left_paren &&
      $members === $this->_members &&
      $right_paren === $this->_right_paren
    ) {
      return $this;
    }
    return new self($keyword, $left_paren, $members, $right_paren);
  }

  public function keyword(): ListToken {
    return $this->keywordx();
  }

  public function keywordx(): ListToken {
    return TypeAssert::isInstanceOf(ListToken::class, $this->_keyword);
  }

  public function raw_keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self($value, $this->_left_paren, $this->_members, $this->_right_paren);
  }

  public function left_paren(): LeftParenToken {
    return $this->left_parenx();
  }

  public function left_parenx(): LeftParenToken {
    return TypeAssert::isInstanceOf(LeftParenToken::class, $this->_left_paren);
  }

  public function raw_left_paren(): EditableSyntax {
    return $this->_left_paren;
  }

  public function with_left_paren(EditableSyntax $value): this {
    return new self($this->_keyword, $value, $this->_members, $this->_right_paren);
  }

  public function members(): ?EditableList {
    return $this->_members->is_missing() ? null : TypeAssert::isInstanceOf(EditableList::class, $this->_members);
  }

  public function membersx(): EditableList {
    return TypeAssert::isInstanceOf(EditableList::class, $this->_members);
  }

  public function raw_members(): EditableSyntax {
    return $this->_members;
  }

  public function with_members(EditableSyntax $value): this {
    return new self($this->_keyword, $this->_left_paren, $value, $this->_right_paren);
  }

  public function right_paren(): RightParenToken {
    return $this->right_parenx();
  }

  public function right_parenx(): RightParenToken {
    return TypeAssert::isInstanceOf(RightParenToken::class, $this->_right_paren);
  }

  public function raw_right_paren(): EditableSyntax {
    return $this->_right_paren;
  }

  public function with_right_paren(EditableSyntax $value): this {
    return new self($this->_keyword, $this->_left_paren, $this->_members, $value);
  }
}
