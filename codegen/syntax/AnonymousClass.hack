/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<65d5fdbdd9d742562d96f74622dd9adb>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class AnonymousClass extends Node {

  const string SYNTAX_KIND = 'anonymous_class';

  private ?Node $_class_keyword;
  private ?Node $_left_paren;
  private ?Node $_argument_list;
  private ?Node $_right_paren;
  private ?Node $_extends_keyword;
  private ?Node $_extends_list;
  private ?Node $_implements_keyword;
  private ?Node $_implements_list;
  private ?Node $_body;

  public function __construct(
    ?Node $class_keyword,
    ?Node $left_paren,
    ?Node $argument_list,
    ?Node $right_paren,
    ?Node $extends_keyword,
    ?Node $extends_list,
    ?Node $implements_keyword,
    ?Node $implements_list,
    ?Node $body,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_class_keyword = $class_keyword;
    $this->_left_paren = $left_paren;
    $this->_argument_list = $argument_list;
    $this->_right_paren = $right_paren;
    $this->_extends_keyword = $extends_keyword;
    $this->_extends_list = $extends_list;
    $this->_implements_keyword = $implements_keyword;
    $this->_implements_list = $implements_list;
    $this->_body = $body;
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
    $class_keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['anonymous_class_class_keyword'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $class_keyword?->getWidth() ?? 0;
    $left_paren = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['anonymous_class_left_paren'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $left_paren?->getWidth() ?? 0;
    $argument_list = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['anonymous_class_argument_list'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $argument_list?->getWidth() ?? 0;
    $right_paren = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['anonymous_class_right_paren'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $right_paren?->getWidth() ?? 0;
    $extends_keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['anonymous_class_extends_keyword'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $extends_keyword?->getWidth() ?? 0;
    $extends_list = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['anonymous_class_extends_list'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $extends_list?->getWidth() ?? 0;
    $implements_keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['anonymous_class_implements_keyword'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $implements_keyword?->getWidth() ?? 0;
    $implements_list = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['anonymous_class_implements_list'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $implements_list?->getWidth() ?? 0;
    $body = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['anonymous_class_body'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $body?->getWidth() ?? 0;
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $class_keyword,
      /* HH_IGNORE_ERROR[4110] */ $left_paren,
      /* HH_IGNORE_ERROR[4110] */ $argument_list,
      /* HH_IGNORE_ERROR[4110] */ $right_paren,
      /* HH_IGNORE_ERROR[4110] */ $extends_keyword,
      /* HH_IGNORE_ERROR[4110] */ $extends_list,
      /* HH_IGNORE_ERROR[4110] */ $implements_keyword,
      /* HH_IGNORE_ERROR[4110] */ $implements_list,
      /* HH_IGNORE_ERROR[4110] */ $body,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'class_keyword' => $this->_class_keyword,
      'left_paren' => $this->_left_paren,
      'argument_list' => $this->_argument_list,
      'right_paren' => $this->_right_paren,
      'extends_keyword' => $this->_extends_keyword,
      'extends_list' => $this->_extends_list,
      'implements_keyword' => $this->_implements_keyword,
      'implements_list' => $this->_implements_list,
      'body' => $this->_body,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $class_keyword = $this->_class_keyword === null
      ? null
      : $rewriter($this->_class_keyword, $parents);
    $left_paren = $this->_left_paren === null
      ? null
      : $rewriter($this->_left_paren, $parents);
    $argument_list = $this->_argument_list === null
      ? null
      : $rewriter($this->_argument_list, $parents);
    $right_paren = $this->_right_paren === null
      ? null
      : $rewriter($this->_right_paren, $parents);
    $extends_keyword = $this->_extends_keyword === null
      ? null
      : $rewriter($this->_extends_keyword, $parents);
    $extends_list = $this->_extends_list === null
      ? null
      : $rewriter($this->_extends_list, $parents);
    $implements_keyword = $this->_implements_keyword === null
      ? null
      : $rewriter($this->_implements_keyword, $parents);
    $implements_list = $this->_implements_list === null
      ? null
      : $rewriter($this->_implements_list, $parents);
    $body = $this->_body === null ? null : $rewriter($this->_body, $parents);
    if (
      $class_keyword === $this->_class_keyword &&
      $left_paren === $this->_left_paren &&
      $argument_list === $this->_argument_list &&
      $right_paren === $this->_right_paren &&
      $extends_keyword === $this->_extends_keyword &&
      $extends_list === $this->_extends_list &&
      $implements_keyword === $this->_implements_keyword &&
      $implements_list === $this->_implements_list &&
      $body === $this->_body
    ) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $class_keyword,
      /* HH_FIXME[4110] use `as` */ $left_paren,
      /* HH_FIXME[4110] use `as` */ $argument_list,
      /* HH_FIXME[4110] use `as` */ $right_paren,
      /* HH_FIXME[4110] use `as` */ $extends_keyword,
      /* HH_FIXME[4110] use `as` */ $extends_list,
      /* HH_FIXME[4110] use `as` */ $implements_keyword,
      /* HH_FIXME[4110] use `as` */ $implements_list,
      /* HH_FIXME[4110] use `as` */ $body,
    );
  }

  public function getClassKeywordUNTYPED(): ?Node {
    return $this->_class_keyword;
  }

  public function withClassKeyword(?Node $value): this {
    if ($value === $this->_class_keyword) {
      return $this;
    }
    return new static(
      $value,
      $this->_left_paren,
      $this->_argument_list,
      $this->_right_paren,
      $this->_extends_keyword,
      $this->_extends_list,
      $this->_implements_keyword,
      $this->_implements_list,
      $this->_body,
    );
  }

  public function hasClassKeyword(): bool {
    return $this->_class_keyword !== null;
  }

  /**
   * @return unknown
   */
  public function getClassKeyword(): ?Node {
    return $this->_class_keyword;
  }

  /**
   * @return unknown
   */
  public function getClassKeywordx(): Node {
    return TypeAssert\not_null($this->getClassKeyword());
  }

  public function getLeftParenUNTYPED(): ?Node {
    return $this->_left_paren;
  }

  public function withLeftParen(?Node $value): this {
    if ($value === $this->_left_paren) {
      return $this;
    }
    return new static(
      $this->_class_keyword,
      $value,
      $this->_argument_list,
      $this->_right_paren,
      $this->_extends_keyword,
      $this->_extends_list,
      $this->_implements_keyword,
      $this->_implements_list,
      $this->_body,
    );
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

  public function getArgumentListUNTYPED(): ?Node {
    return $this->_argument_list;
  }

  public function withArgumentList(?Node $value): this {
    if ($value === $this->_argument_list) {
      return $this;
    }
    return new static(
      $this->_class_keyword,
      $this->_left_paren,
      $value,
      $this->_right_paren,
      $this->_extends_keyword,
      $this->_extends_list,
      $this->_implements_keyword,
      $this->_implements_list,
      $this->_body,
    );
  }

  public function hasArgumentList(): bool {
    return $this->_argument_list !== null;
  }

  /**
   * @return unknown
   */
  public function getArgumentList(): ?Node {
    return $this->_argument_list;
  }

  /**
   * @return unknown
   */
  public function getArgumentListx(): Node {
    return TypeAssert\not_null($this->getArgumentList());
  }

  public function getRightParenUNTYPED(): ?Node {
    return $this->_right_paren;
  }

  public function withRightParen(?Node $value): this {
    if ($value === $this->_right_paren) {
      return $this;
    }
    return new static(
      $this->_class_keyword,
      $this->_left_paren,
      $this->_argument_list,
      $value,
      $this->_extends_keyword,
      $this->_extends_list,
      $this->_implements_keyword,
      $this->_implements_list,
      $this->_body,
    );
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

  public function getExtendsKeywordUNTYPED(): ?Node {
    return $this->_extends_keyword;
  }

  public function withExtendsKeyword(?Node $value): this {
    if ($value === $this->_extends_keyword) {
      return $this;
    }
    return new static(
      $this->_class_keyword,
      $this->_left_paren,
      $this->_argument_list,
      $this->_right_paren,
      $value,
      $this->_extends_list,
      $this->_implements_keyword,
      $this->_implements_list,
      $this->_body,
    );
  }

  public function hasExtendsKeyword(): bool {
    return $this->_extends_keyword !== null;
  }

  /**
   * @return unknown
   */
  public function getExtendsKeyword(): ?Node {
    return $this->_extends_keyword;
  }

  /**
   * @return unknown
   */
  public function getExtendsKeywordx(): Node {
    return TypeAssert\not_null($this->getExtendsKeyword());
  }

  public function getExtendsListUNTYPED(): ?Node {
    return $this->_extends_list;
  }

  public function withExtendsList(?Node $value): this {
    if ($value === $this->_extends_list) {
      return $this;
    }
    return new static(
      $this->_class_keyword,
      $this->_left_paren,
      $this->_argument_list,
      $this->_right_paren,
      $this->_extends_keyword,
      $value,
      $this->_implements_keyword,
      $this->_implements_list,
      $this->_body,
    );
  }

  public function hasExtendsList(): bool {
    return $this->_extends_list !== null;
  }

  /**
   * @return unknown
   */
  public function getExtendsList(): ?Node {
    return $this->_extends_list;
  }

  /**
   * @return unknown
   */
  public function getExtendsListx(): Node {
    return TypeAssert\not_null($this->getExtendsList());
  }

  public function getImplementsKeywordUNTYPED(): ?Node {
    return $this->_implements_keyword;
  }

  public function withImplementsKeyword(?Node $value): this {
    if ($value === $this->_implements_keyword) {
      return $this;
    }
    return new static(
      $this->_class_keyword,
      $this->_left_paren,
      $this->_argument_list,
      $this->_right_paren,
      $this->_extends_keyword,
      $this->_extends_list,
      $value,
      $this->_implements_list,
      $this->_body,
    );
  }

  public function hasImplementsKeyword(): bool {
    return $this->_implements_keyword !== null;
  }

  /**
   * @return unknown
   */
  public function getImplementsKeyword(): ?Node {
    return $this->_implements_keyword;
  }

  /**
   * @return unknown
   */
  public function getImplementsKeywordx(): Node {
    return TypeAssert\not_null($this->getImplementsKeyword());
  }

  public function getImplementsListUNTYPED(): ?Node {
    return $this->_implements_list;
  }

  public function withImplementsList(?Node $value): this {
    if ($value === $this->_implements_list) {
      return $this;
    }
    return new static(
      $this->_class_keyword,
      $this->_left_paren,
      $this->_argument_list,
      $this->_right_paren,
      $this->_extends_keyword,
      $this->_extends_list,
      $this->_implements_keyword,
      $value,
      $this->_body,
    );
  }

  public function hasImplementsList(): bool {
    return $this->_implements_list !== null;
  }

  /**
   * @return unknown
   */
  public function getImplementsList(): ?Node {
    return $this->_implements_list;
  }

  /**
   * @return unknown
   */
  public function getImplementsListx(): Node {
    return TypeAssert\not_null($this->getImplementsList());
  }

  public function getBodyUNTYPED(): ?Node {
    return $this->_body;
  }

  public function withBody(?Node $value): this {
    if ($value === $this->_body) {
      return $this;
    }
    return new static(
      $this->_class_keyword,
      $this->_left_paren,
      $this->_argument_list,
      $this->_right_paren,
      $this->_extends_keyword,
      $this->_extends_list,
      $this->_implements_keyword,
      $this->_implements_list,
      $value,
    );
  }

  public function hasBody(): bool {
    return $this->_body !== null;
  }

  /**
   * @return unknown
   */
  public function getBody(): ?Node {
    return $this->_body;
  }

  /**
   * @return unknown
   */
  public function getBodyx(): Node {
    return TypeAssert\not_null($this->getBody());
  }
}
