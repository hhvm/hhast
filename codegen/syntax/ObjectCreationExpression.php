<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<a8b8cabb790c874f7b6a5788cf3a19a6>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class ObjectCreationExpression extends EditableSyntax {

  private EditableSyntax $_new_keyword;
  private EditableSyntax $_type;
  private EditableSyntax $_left_paren;
  private EditableSyntax $_argument_list;
  private EditableSyntax $_right_paren;

  public function __construct(
    EditableSyntax $new_keyword,
    EditableSyntax $type,
    EditableSyntax $left_paren,
    EditableSyntax $argument_list,
    EditableSyntax $right_paren,
  ) {
    parent::__construct('object_creation_expression');
    $this->_new_keyword = $new_keyword;
    $this->_type = $type;
    $this->_left_paren = $left_paren;
    $this->_argument_list = $argument_list;
    $this->_right_paren = $right_paren;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $new_keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['object_creation_new_keyword'],
      $position,
      $source,
    );
    $position += $new_keyword->width();
    $type = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['object_creation_type'],
      $position,
      $source,
    );
    $position += $type->width();
    $left_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['object_creation_left_paren'],
      $position,
      $source,
    );
    $position += $left_paren->width();
    $argument_list = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['object_creation_argument_list'],
      $position,
      $source,
    );
    $position += $argument_list->width();
    $right_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['object_creation_right_paren'],
      $position,
      $source,
    );
    $position += $right_paren->width();
    return new self(
      $new_keyword,
      $type,
      $left_paren,
      $argument_list,
      $right_paren,
    );
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'new_keyword' => $this->_new_keyword;
    yield 'type' => $this->_type;
    yield 'left_paren' => $this->_left_paren;
    yield 'argument_list' => $this->_argument_list;
    yield 'right_paren' => $this->_right_paren;
  }

  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $new_keyword = $this->_new_keyword->rewrite($rewriter, $parents);
    $type = $this->_type->rewrite($rewriter, $parents);
    $left_paren = $this->_left_paren->rewrite($rewriter, $parents);
    $argument_list = $this->_argument_list->rewrite($rewriter, $parents);
    $right_paren = $this->_right_paren->rewrite($rewriter, $parents);
    if (
      $new_keyword === $this->_new_keyword &&
      $type === $this->_type &&
      $left_paren === $this->_left_paren &&
      $argument_list === $this->_argument_list &&
      $right_paren === $this->_right_paren
    ) {
      return $this;
    }
    return new self($new_keyword, $type, $left_paren, $argument_list, $right_paren);
  }

  public function raw_new_keyword(): EditableSyntax {
    return $this->_new_keyword;
  }

  public function with_new_keyword(EditableSyntax $value): this {
    if ($value === $this->_new_keyword) {
      return $this;
    }
    return new self(
      $value,
      $this->_type,
      $this->_left_paren,
      $this->_argument_list,
      $this->_right_paren,
    );
  }

  public function hasNewKeyword(): bool {
    return !$this->_new_keyword->is_missing();
  }

  public function new_keyword(): NewToken {
    return TypeAssert::isInstanceOf(NewToken::class, $this->_new_keyword);
  }

  public function raw_type(): EditableSyntax {
    return $this->_type;
  }

  public function with_type(EditableSyntax $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return new self(
      $this->_new_keyword,
      $value,
      $this->_left_paren,
      $this->_argument_list,
      $this->_right_paren,
    );
  }

  public function hasType(): bool {
    return !$this->_type->is_missing();
  }

  public function type(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_type);
  }

  public function raw_left_paren(): EditableSyntax {
    return $this->_left_paren;
  }

  public function with_left_paren(EditableSyntax $value): this {
    if ($value === $this->_left_paren) {
      return $this;
    }
    return new self(
      $this->_new_keyword,
      $this->_type,
      $value,
      $this->_argument_list,
      $this->_right_paren,
    );
  }

  public function hasLeftParen(): bool {
    return !$this->_left_paren->is_missing();
  }

  public function left_paren(): ?LeftParenToken {
    if ($this->_left_paren->is_missing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(LeftParenToken::class, $this->_left_paren);
  }

  public function left_parenx(): LeftParenToken {
    return TypeAssert::isInstanceOf(LeftParenToken::class, $this->_left_paren);
  }

  public function raw_argument_list(): EditableSyntax {
    return $this->_argument_list;
  }

  public function with_argument_list(EditableSyntax $value): this {
    if ($value === $this->_argument_list) {
      return $this;
    }
    return new self(
      $this->_new_keyword,
      $this->_type,
      $this->_left_paren,
      $value,
      $this->_right_paren,
    );
  }

  public function hasArgumentList(): bool {
    return !$this->_argument_list->is_missing();
  }

  public function argument_list(): ?EditableList {
    if ($this->_argument_list->is_missing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(EditableList::class, $this->_argument_list);
  }

  public function argument_listx(): EditableList {
    return TypeAssert::isInstanceOf(EditableList::class, $this->_argument_list);
  }

  public function raw_right_paren(): EditableSyntax {
    return $this->_right_paren;
  }

  public function with_right_paren(EditableSyntax $value): this {
    if ($value === $this->_right_paren) {
      return $this;
    }
    return new self(
      $this->_new_keyword,
      $this->_type,
      $this->_left_paren,
      $this->_argument_list,
      $value,
    );
  }

  public function hasRightParen(): bool {
    return !$this->_right_paren->is_missing();
  }

  public function right_paren(): ?RightParenToken {
    if ($this->_right_paren->is_missing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(RightParenToken::class, $this->_right_paren);
  }

  public function right_parenx(): RightParenToken {
    return TypeAssert::isInstanceOf(RightParenToken::class, $this->_right_paren);
  }
}
