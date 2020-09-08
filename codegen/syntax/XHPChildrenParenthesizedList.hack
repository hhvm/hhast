/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<aa03e936634cb1364015b005a062dcf0>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class XHPChildrenParenthesizedList
  extends Node
  implements ILambdaBody, IExpression {

  const string SYNTAX_KIND = 'xhp_children_parenthesized_list';

  private ?Node $_left_paren;
  private ?Node $_xhp_children;
  private ?Node $_right_paren;

  public function __construct(
    ?Node $left_paren,
    ?Node $xhp_children,
    ?Node $right_paren,
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
      /* HH_FIXME[4110] */ $json['xhp_children_list_left_paren'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $left_paren?->getWidth() ?? 0;
    $xhp_children = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['xhp_children_list_xhp_children'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $xhp_children?->getWidth() ?? 0;
    $right_paren = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['xhp_children_list_right_paren'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $right_paren?->getWidth() ?? 0;
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $left_paren,
      /* HH_IGNORE_ERROR[4110] */ $xhp_children,
      /* HH_IGNORE_ERROR[4110] */ $right_paren,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'left_paren' => $this->_left_paren,
      'xhp_children' => $this->_xhp_children,
      'right_paren' => $this->_right_paren,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $left_paren = $this->_left_paren === null
      ? null
      : $rewriter($this->_left_paren, $parents);
    $xhp_children = $this->_xhp_children === null
      ? null
      : $rewriter($this->_xhp_children, $parents);
    $right_paren = $this->_right_paren === null
      ? null
      : $rewriter($this->_right_paren, $parents);
    if (
      $left_paren === $this->_left_paren &&
      $xhp_children === $this->_xhp_children &&
      $right_paren === $this->_right_paren
    ) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $left_paren,
      /* HH_FIXME[4110] use `as` */ $xhp_children,
      /* HH_FIXME[4110] use `as` */ $right_paren,
    );
  }

  public function getLeftParenUNTYPED(): ?Node {
    return $this->_left_paren;
  }

  public function withLeftParen(?Node $value): this {
    if ($value === $this->_left_paren) {
      return $this;
    }
    return new static($value, $this->_xhp_children, $this->_right_paren);
  }

  public function hasLeftParen(): bool {
    return $this->_left_paren !== null;
  }

  /**
   * @return unknown
   */
  public function getLeftParen(): ?Node {
    return $this->_left_paren;
  }

  /**
   * @return unknown
   */
  public function getLeftParenx(): Node {
    return TypeAssert\not_null($this->getLeftParen());
  }

  public function getXhpChildrenUNTYPED(): ?Node {
    return $this->_xhp_children;
  }

  public function withXhpChildren(?Node $value): this {
    if ($value === $this->_xhp_children) {
      return $this;
    }
    return new static($this->_left_paren, $value, $this->_right_paren);
  }

  public function hasXhpChildren(): bool {
    return $this->_xhp_children !== null;
  }

  /**
   * @return unknown
   */
  public function getXhpChildren(): ?Node {
    return $this->_xhp_children;
  }

  /**
   * @return unknown
   */
  public function getXhpChildrenx(): Node {
    return TypeAssert\not_null($this->getXhpChildren());
  }

  public function getRightParenUNTYPED(): ?Node {
    return $this->_right_paren;
  }

  public function withRightParen(?Node $value): this {
    if ($value === $this->_right_paren) {
      return $this;
    }
    return new static($this->_left_paren, $this->_xhp_children, $value);
  }

  public function hasRightParen(): bool {
    return $this->_right_paren !== null;
  }

  /**
   * @return unknown
   */
  public function getRightParen(): ?Node {
    return $this->_right_paren;
  }

  /**
   * @return unknown
   */
  public function getRightParenx(): Node {
    return TypeAssert\not_null($this->getRightParen());
  }
}
