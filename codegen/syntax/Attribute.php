<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<2d2134bc652ac653590ce689de5b1484>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class Attribute extends EditableSyntax {

  private EditableSyntax $_name;
  private EditableSyntax $_left_paren;
  private EditableSyntax $_values;
  private EditableSyntax $_right_paren;

  public function __construct(
    EditableSyntax $name,
    EditableSyntax $left_paren,
    EditableSyntax $values,
    EditableSyntax $right_paren,
  ) {
    parent::__construct('attribute');
    $this->_name = $name;
    $this->_left_paren = $left_paren;
    $this->_values = $values;
    $this->_right_paren = $right_paren;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $name = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['attribute_name'],
      $position,
      $source,
    );
    $position += $name->getWidth();
    $left_paren = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['attribute_left_paren'],
      $position,
      $source,
    );
    $position += $left_paren->getWidth();
    $values = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['attribute_values'],
      $position,
      $source,
    );
    $position += $values->getWidth();
    $right_paren = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['attribute_right_paren'],
      $position,
      $source,
    );
    $position += $right_paren->getWidth();
    return new self($name, $left_paren, $values, $right_paren);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'name' => $this->_name;
    yield 'left_paren' => $this->_left_paren;
    yield 'values' => $this->_values;
    yield 'right_paren' => $this->_right_paren;
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $name = $this->_name->rewrite($rewriter, $parents);
    $left_paren = $this->_left_paren->rewrite($rewriter, $parents);
    $values = $this->_values->rewrite($rewriter, $parents);
    $right_paren = $this->_right_paren->rewrite($rewriter, $parents);
    if (
      $name === $this->_name &&
      $left_paren === $this->_left_paren &&
      $values === $this->_values &&
      $right_paren === $this->_right_paren
    ) {
      return $this;
    }
    return new self($name, $left_paren, $values, $right_paren);
  }

  public function getNameUNTYPED(): EditableSyntax {
    return $this->_name;
  }

  public function withName(EditableSyntax $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new self($value, $this->_left_paren, $this->_values, $this->_right_paren);
  }

  public function hasName(): bool {
    return !$this->_name->isMissing();
  }

  public function getName(): NameToken {
    return TypeAssert::isInstanceOf(NameToken::class, $this->_name);
  }

  public function getLeftParenUNTYPED(): EditableSyntax {
    return $this->_left_paren;
  }

  public function withLeftParen(EditableSyntax $value): this {
    if ($value === $this->_left_paren) {
      return $this;
    }
    return new self($this->_name, $value, $this->_values, $this->_right_paren);
  }

  public function hasLeftParen(): bool {
    return !$this->_left_paren->isMissing();
  }

  public function getLeftParen(): ?LeftParenToken {
    if ($this->_left_paren->isMissing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(LeftParenToken::class, $this->_left_paren);
  }

  public function getLeftParenx(): LeftParenToken {
    return TypeAssert::isInstanceOf(LeftParenToken::class, $this->_left_paren);
  }

  public function getValuesUNTYPED(): EditableSyntax {
    return $this->_values;
  }

  public function withValues(EditableSyntax $value): this {
    if ($value === $this->_values) {
      return $this;
    }
    return new self($this->_name, $this->_left_paren, $value, $this->_right_paren);
  }

  public function hasValues(): bool {
    return !$this->_values->isMissing();
  }

  public function getValues(): ?EditableList {
    if ($this->_values->isMissing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(EditableList::class, $this->_values);
  }

  public function getValuesx(): EditableList {
    return TypeAssert::isInstanceOf(EditableList::class, $this->_values);
  }

  public function getRightParenUNTYPED(): EditableSyntax {
    return $this->_right_paren;
  }

  public function withRightParen(EditableSyntax $value): this {
    if ($value === $this->_right_paren) {
      return $this;
    }
    return new self($this->_name, $this->_left_paren, $this->_values, $value);
  }

  public function hasRightParen(): bool {
    return !$this->_right_paren->isMissing();
  }

  public function getRightParen(): ?RightParenToken {
    if ($this->_right_paren->isMissing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(RightParenToken::class, $this->_right_paren);
  }

  public function getRightParenx(): RightParenToken {
    return TypeAssert::isInstanceOf(RightParenToken::class, $this->_right_paren);
  }
}
