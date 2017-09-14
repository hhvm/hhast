<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<29a2bbb731e781d60a7a8808db234d14>>
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

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['keyset_intrinsic_keyword'],
      $position,
      $source,
    );
    $position += $keyword->getWidth();
    $left_bracket = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['keyset_intrinsic_left_bracket'],
      $position,
      $source,
    );
    $position += $left_bracket->getWidth();
    $members = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['keyset_intrinsic_members'],
      $position,
      $source,
    );
    $position += $members->getWidth();
    $right_bracket = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['keyset_intrinsic_right_bracket'],
      $position,
      $source,
    );
    $position += $right_bracket->getWidth();
    return new self($keyword, $left_bracket, $members, $right_bracket);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'left_bracket' => $this->_left_bracket;
    yield 'members' => $this->_members;
    yield 'right_bracket' => $this->_right_bracket;
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $parents);
    $left_bracket = $this->_left_bracket->rewrite($rewriter, $parents);
    $members = $this->_members->rewrite($rewriter, $parents);
    $right_bracket = $this->_right_bracket->rewrite($rewriter, $parents);
    if (
      $keyword === $this->_keyword &&
      $left_bracket === $this->_left_bracket &&
      $members === $this->_members &&
      $right_bracket === $this->_right_bracket
    ) {
      return $this;
    }
    return new self($keyword, $left_bracket, $members, $right_bracket);
  }

  public function getKeywordUNTYPED(): EditableSyntax {
    return $this->_keyword;
  }

  public function withKeyword(EditableSyntax $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new self($value, $this->_left_bracket, $this->_members, $this->_right_bracket);
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  /**
   * @returns KeysetToken
   */
  public function getKeyword(): KeysetToken {
    return TypeAssert::isInstanceOf(KeysetToken::class, $this->_keyword);
  }

  public function getLeftBracketUNTYPED(): EditableSyntax {
    return $this->_left_bracket;
  }

  public function withLeftBracket(EditableSyntax $value): this {
    if ($value === $this->_left_bracket) {
      return $this;
    }
    return new self($this->_keyword, $value, $this->_members, $this->_right_bracket);
  }

  public function hasLeftBracket(): bool {
    return !$this->_left_bracket->isMissing();
  }

  /**
   * @returns LeftBracketToken
   */
  public function getLeftBracket(): LeftBracketToken {
    return TypeAssert::isInstanceOf(LeftBracketToken::class, $this->_left_bracket);
  }

  public function getMembersUNTYPED(): EditableSyntax {
    return $this->_members;
  }

  public function withMembers(EditableSyntax $value): this {
    if ($value === $this->_members) {
      return $this;
    }
    return new self($this->_keyword, $this->_left_bracket, $value, $this->_right_bracket);
  }

  public function hasMembers(): bool {
    return !$this->_members->isMissing();
  }

  /**
   * @returns EditableList
   */
  public function getMembers(): ?EditableList {
    if ($this->_members->isMissing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(EditableList::class, $this->_members);
  }

  /**
   * @returns EditableList
   */
  public function getMembersx(): EditableList {
    return TypeAssert::isInstanceOf(EditableList::class, $this->_members);
  }

  public function getRightBracketUNTYPED(): EditableSyntax {
    return $this->_right_bracket;
  }

  public function withRightBracket(EditableSyntax $value): this {
    if ($value === $this->_right_bracket) {
      return $this;
    }
    return new self($this->_keyword, $this->_left_bracket, $this->_members, $value);
  }

  public function hasRightBracket(): bool {
    return !$this->_right_bracket->isMissing();
  }

  /**
   * @returns RightBracketToken
   */
  public function getRightBracket(): RightBracketToken {
    return TypeAssert::isInstanceOf(RightBracketToken::class, $this->_right_bracket);
  }
}
