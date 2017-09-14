<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<9f8a69de7a108c151973252c3f385bbc>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class ArrayCreationExpression extends EditableSyntax {

  private EditableSyntax $_left_bracket;
  private EditableSyntax $_members;
  private EditableSyntax $_right_bracket;

  public function __construct(
    EditableSyntax $left_bracket,
    EditableSyntax $members,
    EditableSyntax $right_bracket,
  ) {
    parent::__construct('array_creation_expression');
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
    $left_bracket = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['array_creation_left_bracket'],
      $position,
      $source,
    );
    $position += $left_bracket->getWidth();
    $members = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['array_creation_members'],
      $position,
      $source,
    );
    $position += $members->getWidth();
    $right_bracket = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['array_creation_right_bracket'],
      $position,
      $source,
    );
    $position += $right_bracket->getWidth();
    return new self($left_bracket, $members, $right_bracket);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
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
    $left_bracket = $this->_left_bracket->rewrite($rewriter, $parents);
    $members = $this->_members->rewrite($rewriter, $parents);
    $right_bracket = $this->_right_bracket->rewrite($rewriter, $parents);
    if (
      $left_bracket === $this->_left_bracket &&
      $members === $this->_members &&
      $right_bracket === $this->_right_bracket
    ) {
      return $this;
    }
    return new self($left_bracket, $members, $right_bracket);
  }

  public function getLeftBracketUNTYPED(): EditableSyntax {
    return $this->_left_bracket;
  }

  public function withLeftBracket(EditableSyntax $value): this {
    if ($value === $this->_left_bracket) {
      return $this;
    }
    return new self($value, $this->_members, $this->_right_bracket);
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
    return new self($this->_left_bracket, $value, $this->_right_bracket);
  }

  public function hasMembers(): bool {
    return !$this->_members->isMissing();
  }

  /**
   * @returns EditableList | Missing
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
    return new self($this->_left_bracket, $this->_members, $value);
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
