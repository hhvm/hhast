<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<9986eb77b998320a30a1d0f4b7307263>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class XHPChildrenParenthesizedList extends EditableNode {

  private EditableNode $_left_paren;
  private EditableNode $_xhp_children;
  private EditableNode $_right_paren;

  public function __construct(
    EditableNode $left_paren,
    EditableNode $xhp_children,
    EditableNode $right_paren,
  ) {
    parent::__construct('xhp_children_parenthesized_list');
    $this->_left_paren = $left_paren;
    $this->_xhp_children = $xhp_children;
    $this->_right_paren = $right_paren;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $left_paren = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['xhp_children_list_left_paren'],
      $position,
      $source,
    );
    $position += $left_paren->getWidth();
    $xhp_children = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['xhp_children_list_xhp_children'],
      $position,
      $source,
    );
    $position += $xhp_children->getWidth();
    $right_paren = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['xhp_children_list_right_paren'],
      $position,
      $source,
    );
    $position += $right_paren->getWidth();
    return new self($left_paren, $xhp_children, $right_paren);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableNode> {
    yield 'left_paren' => $this->_left_paren;
    yield 'xhp_children' => $this->_xhp_children;
    yield 'right_paren' => $this->_right_paren;
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?Traversable<EditableNode> $parents = null,
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

  public function getLeftParenUNTYPED(): EditableNode {
    return $this->_left_paren;
  }

  public function withLeftParen(EditableNode $value): this {
    if ($value === $this->_left_paren) {
      return $this;
    }
    return new self($value, $this->_xhp_children, $this->_right_paren);
  }

  public function hasLeftParen(): bool {
    return !$this->_left_paren->isMissing();
  }

  /**
   * @returns unknown
   */
  public function getLeftParen(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_left_paren);
  }

  public function getXhpChildrenUNTYPED(): EditableNode {
    return $this->_xhp_children;
  }

  public function withXhpChildren(EditableNode $value): this {
    if ($value === $this->_xhp_children) {
      return $this;
    }
    return new self($this->_left_paren, $value, $this->_right_paren);
  }

  public function hasXhpChildren(): bool {
    return !$this->_xhp_children->isMissing();
  }

  /**
   * @returns unknown
   */
  public function getXhpChildren(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_xhp_children);
  }

  public function getRightParenUNTYPED(): EditableNode {
    return $this->_right_paren;
  }

  public function withRightParen(EditableNode $value): this {
    if ($value === $this->_right_paren) {
      return $this;
    }
    return new self($this->_left_paren, $this->_xhp_children, $value);
  }

  public function hasRightParen(): bool {
    return !$this->_right_paren->isMissing();
  }

  /**
   * @returns unknown
   */
  public function getRightParen(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_right_paren);
  }
}
