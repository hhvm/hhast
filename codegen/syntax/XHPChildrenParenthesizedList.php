<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<326523ebd6f0ce2cbe71a1eeb8b2e26f>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class XHPChildrenParenthesizedList extends EditableSyntax {

  private EditableSyntax $_left_paren;
  private EditableSyntax $_xhp_children;
  private EditableSyntax $_right_paren;

  public function __construct(
    EditableSyntax $left_paren,
    EditableSyntax $xhp_children,
    EditableSyntax $right_paren,
  ) {
    parent::__construct('xhp_children_parenthesized_list');
    $this->_left_paren = $left_paren;
    $this->_xhp_children = $xhp_children;
    $this->_right_paren = $right_paren;
  }

  <<__Override>>
  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $left_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['xhp_children_list_left_paren'],
      $position,
      $source,
    );
    $position += $left_paren->getWidth();
    $xhp_children = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['xhp_children_list_xhp_children'],
      $position,
      $source,
    );
    $position += $xhp_children->getWidth();
    $right_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['xhp_children_list_right_paren'],
      $position,
      $source,
    );
    $position += $right_paren->getWidth();
    return new self($left_paren, $xhp_children, $right_paren);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'left_paren' => $this->_left_paren;
    yield 'xhp_children' => $this->_xhp_children;
    yield 'right_paren' => $this->_right_paren;
  }

  <<__Override>>
  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $left_paren = $this->_left_paren->rewrite($rewriter, $parents);
    $xhp_children = $this->_xhp_children->rewrite($rewriter, $parents);
    $right_paren = $this->_right_paren->rewrite($rewriter, $parents);
    if (
      $left_paren === $this->_left_paren &&
      $xhp_children === $this->_xhp_children &&
      $right_paren === $this->_right_paren
    ) {
      return $this;
    }
    return new self($left_paren, $xhp_children, $right_paren);
  }

  public function getLeftParenUNTYPED(): EditableSyntax {
    return $this->_left_paren;
  }

  public function withLeftParen(EditableSyntax $value): this {
    if ($value === $this->_left_paren) {
      return $this;
    }
    return new self($value, $this->_xhp_children, $this->_right_paren);
  }

  public function hasLeftParen(): bool {
    return !$this->_left_paren->isMissing();
  }

  public function getLeftParen(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_left_paren);
  }

  public function getXhpChildrenUNTYPED(): EditableSyntax {
    return $this->_xhp_children;
  }

  public function withXhpChildren(EditableSyntax $value): this {
    if ($value === $this->_xhp_children) {
      return $this;
    }
    return new self($this->_left_paren, $value, $this->_right_paren);
  }

  public function hasXhpChildren(): bool {
    return !$this->_xhp_children->isMissing();
  }

  public function getXhpChildren(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_xhp_children);
  }

  public function getRightParenUNTYPED(): EditableSyntax {
    return $this->_right_paren;
  }

  public function withRightParen(EditableSyntax $value): this {
    if ($value === $this->_right_paren) {
      return $this;
    }
    return new self($this->_left_paren, $this->_xhp_children, $value);
  }

  public function hasRightParen(): bool {
    return !$this->_right_paren->isMissing();
  }

  public function getRightParen(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_right_paren);
  }
}
