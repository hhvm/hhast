<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<53284a49d74fe6d5b8038a78d1aa3419>>
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
    $position += $left_paren->width();
    $xhp_children = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['xhp_children_list_xhp_children'],
      $position,
      $source,
    );
    $position += $xhp_children->width();
    $right_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['xhp_children_list_right_paren'],
      $position,
      $source,
    );
    $position += $right_paren->width();
    return new self($left_paren, $xhp_children, $right_paren);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'left_paren' => $this->_left_paren;
    yield 'xhp_children' => $this->_xhp_children;
    yield 'right_paren' => $this->_right_paren;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $left_paren = $this->_left_paren->rewrite($rewriter, $child_parents);
    $xhp_children = $this->_xhp_children->rewrite($rewriter, $child_parents);
    $right_paren = $this->_right_paren->rewrite($rewriter, $child_parents);
    if (
      $left_paren === $this->_left_paren &&
      $xhp_children === $this->_xhp_children &&
      $right_paren === $this->_right_paren
    ) {
      $node = $this;
    } else {
      $node = new self($left_paren, $xhp_children, $right_paren);
    }
    return $rewriter($node, $parents);
  }

  public function left_paren(): EditableSyntax {
    return $this->left_parenx();
  }

  public function left_parenx(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_left_paren);
  }

  public function raw_left_paren(): EditableSyntax {
    return $this->_left_paren;
  }

  public function with_left_paren(EditableSyntax $value): this {
    return new self($value, $this->_xhp_children, $this->_right_paren);
  }

  public function xhp_children(): EditableSyntax {
    return $this->xhp_childrenx();
  }

  public function xhp_childrenx(): EditableSyntax {
    return
      TypeAssert::isInstanceOf(EditableSyntax::class, $this->_xhp_children);
  }

  public function raw_xhp_children(): EditableSyntax {
    return $this->_xhp_children;
  }

  public function with_xhp_children(EditableSyntax $value): this {
    return new self($this->_left_paren, $value, $this->_right_paren);
  }

  public function right_paren(): EditableSyntax {
    return $this->right_parenx();
  }

  public function right_parenx(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_right_paren);
  }

  public function raw_right_paren(): EditableSyntax {
    return $this->_right_paren;
  }

  public function with_right_paren(EditableSyntax $value): this {
    return new self($this->_left_paren, $this->_xhp_children, $value);
  }
}
