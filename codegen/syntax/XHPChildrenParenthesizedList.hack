/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<766cd1cc8447ea30d95aa5d5bd8f7a59>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class XHPChildrenParenthesizedList extends Node {

  const string SYNTAX_KIND = 'xhp_children_parenthesized_list';

  private Node $_left_paren;
  private Node $_xhp_children;
  private Node $_right_paren;

  public function __construct(
    Node $left_paren,
    Node $xhp_children,
    Node $right_paren,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_left_paren = $left_paren;
    $this->_xhp_children = $xhp_children;
    $this->_right_paren = $right_paren;
    parent::__construct($source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
    string $_type_hint,
  ): this {
    $offset = $initial_offset;
    $left_paren = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['xhp_children_list_left_paren'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $left_paren->getWidth();
    $xhp_children = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['xhp_children_list_xhp_children'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $xhp_children->getWidth();
    $right_paren = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['xhp_children_list_right_paren'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $right_paren->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static($left_paren, $xhp_children, $right_paren, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'left_paren' => $this->_left_paren,
      'xhp_children' => $this->_xhp_children,
      'right_paren' => $this->_right_paren,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $left_paren = $rewriter($this->_left_paren, $parents);
    $xhp_children = $rewriter($this->_xhp_children, $parents);
    $right_paren = $rewriter($this->_right_paren, $parents);
    if (
      $left_paren === $this->_left_paren &&
      $xhp_children === $this->_xhp_children &&
      $right_paren === $this->_right_paren
    ) {
      return $this;
    }
    return new static($left_paren, $xhp_children, $right_paren);
  }

  public function getLeftParenUNTYPED(): Node {
    return $this->_left_paren;
  }

  public function withLeftParen(Node $value): this {
    if ($value === $this->_left_paren) {
      return $this;
    }
    return new static(
      $value ?? Missing(),
      $this->_xhp_children,
      $this->_right_paren,
    );
  }

  public function hasLeftParen(): bool {
    return !$this->_left_paren->isMissing();
  }

  /**
   * @return unknown
   */
  public function getLeftParen(): Node {
    return $this->_left_paren;
  }

  /**
   * @return unknown
   */
  public function getLeftParenx(): Node {
    return $this->getLeftParen();
  }

  public function getXhpChildrenUNTYPED(): Node {
    return $this->_xhp_children;
  }

  public function withXhpChildren(Node $value): this {
    if ($value === $this->_xhp_children) {
      return $this;
    }
    return new static(
      $this->_left_paren,
      $value ?? Missing(),
      $this->_right_paren,
    );
  }

  public function hasXhpChildren(): bool {
    return !$this->_xhp_children->isMissing();
  }

  /**
   * @return unknown
   */
  public function getXhpChildren(): Node {
    return $this->_xhp_children;
  }

  /**
   * @return unknown
   */
  public function getXhpChildrenx(): Node {
    return $this->getXhpChildren();
  }

  public function getRightParenUNTYPED(): Node {
    return $this->_right_paren;
  }

  public function withRightParen(Node $value): this {
    if ($value === $this->_right_paren) {
      return $this;
    }
    return new static(
      $this->_left_paren,
      $this->_xhp_children,
      $value ?? Missing(),
    );
  }

  public function hasRightParen(): bool {
    return !$this->_right_paren->isMissing();
  }

  /**
   * @return unknown
   */
  public function getRightParen(): Node {
    return $this->_right_paren;
  }

  /**
   * @return unknown
   */
  public function getRightParenx(): Node {
    return $this->getRightParen();
  }
}
