<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<542e48198d4fc63f65ab14ad4cd7c598>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

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
  public static function fromJSON(
    dict<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $left_paren = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['xhp_children_list_left_paren'],
      $position,
      $source,
    );
    $position += $left_paren->getWidth();
    $xhp_children = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['xhp_children_list_xhp_children'],
      $position,
      $source,
    );
    $position += $xhp_children->getWidth();
    $right_paren = EditableSyntax::fromJSON(
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
  public function rewriteDescendants(
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

  /**
   * @returns unknown
   */
  public function getLeftParen(): EditableSyntax {
    return TypeAssert\instance_of(EditableSyntax::class, $this->_left_paren);
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

  /**
   * @returns unknown
   */
  public function getXhpChildren(): EditableSyntax {
    return TypeAssert\instance_of(EditableSyntax::class, $this->_xhp_children);
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

  /**
   * @returns unknown
   */
  public function getRightParen(): EditableSyntax {
    return TypeAssert\instance_of(EditableSyntax::class, $this->_right_paren);
  }
}
