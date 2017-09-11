<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<69eb60f07006f5d83fb2b9c4b3121658>>
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

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $left_bracket = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['array_creation_left_bracket'],
      $position,
      $source,
    );
    $position += $left_bracket->width();
    $members = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['array_creation_members'],
      $position,
      $source,
    );
    $position += $members->width();
    $right_bracket = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['array_creation_right_bracket'],
      $position,
      $source,
    );
    $position += $right_bracket->width();
    return new self($left_bracket, $members, $right_bracket);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'left_bracket' => $this->_left_bracket;
    yield 'members' => $this->_members;
    yield 'right_bracket' => $this->_right_bracket;
  }

  public function rewrite_children(
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

  public function raw_left_bracket(): EditableSyntax {
    return $this->_left_bracket;
  }

  public function with_left_bracket(EditableSyntax $value): this {
    if ($value === $this->_left_bracket) {
      return $this;
    }
    return new self($value, $this->_members, $this->_right_bracket);
  }

  public function left_bracket(): LeftBracketToken {
    return TypeAssert::isInstanceOf(LeftBracketToken::class, $this->_left_bracket);
  }

  public function raw_members(): EditableSyntax {
    return $this->_members;
  }

  public function with_members(EditableSyntax $value): this {
    if ($value === $this->_members) {
      return $this;
    }
    return new self($this->_left_bracket, $value, $this->_right_bracket);
  }

  public function members(): ?EditableList {
    if ($this->_members->is_missing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(EditableList::class, $this->_members);
  }

  public function membersx(): EditableList {
    return TypeAssert::isInstanceOf(EditableList::class, $this->_members);
  }

  public function raw_right_bracket(): EditableSyntax {
    return $this->_right_bracket;
  }

  public function with_right_bracket(EditableSyntax $value): this {
    if ($value === $this->_right_bracket) {
      return $this;
    }
    return new self($this->_left_bracket, $this->_members, $value);
  }

  public function right_bracket(): RightBracketToken {
    return TypeAssert::isInstanceOf(RightBracketToken::class, $this->_right_bracket);
  }
}
