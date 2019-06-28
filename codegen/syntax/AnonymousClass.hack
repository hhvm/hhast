/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<ca8da3ed6830be9d83dba04ff79a5cd0>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class AnonymousClass extends Node {

  const string SYNTAX_KIND = 'anonymous_class';

  private Node $_class_keyword;
  private Node $_left_paren;
  private Node $_argument_list;
  private Node $_right_paren;
  private Node $_extends_keyword;
  private Node $_extends_list;
  private Node $_implements_keyword;
  private Node $_implements_list;
  private Node $_body;

  public function __construct(
    Node $class_keyword,
    Node $left_paren,
    Node $argument_list,
    Node $right_paren,
    Node $extends_keyword,
    Node $extends_list,
    Node $implements_keyword,
    Node $implements_list,
    Node $body,
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
      /* HH_FIXME[4110] */ $json['anonymous_class_class_keyword'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $class_keyword->getWidth();
    $left_paren = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['anonymous_class_left_paren'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $left_paren->getWidth();
    $argument_list = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['anonymous_class_argument_list'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $argument_list->getWidth();
    $right_paren = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['anonymous_class_right_paren'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $right_paren->getWidth();
    $extends_keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['anonymous_class_extends_keyword'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $extends_keyword->getWidth();
    $extends_list = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['anonymous_class_extends_list'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $extends_list->getWidth();
    $implements_keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['anonymous_class_implements_keyword'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $implements_keyword->getWidth();
    $implements_list = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['anonymous_class_implements_list'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $implements_list->getWidth();
    $body = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['anonymous_class_body'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $body->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      $class_keyword,
      $left_paren,
      $argument_list,
      $right_paren,
      $extends_keyword,
      $extends_list,
      $implements_keyword,
      $implements_list,
      $body,
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
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $class_keyword = $rewriter($this->_class_keyword, $parents);
    $left_paren = $rewriter($this->_left_paren, $parents);
    $argument_list = $rewriter($this->_argument_list, $parents);
    $right_paren = $rewriter($this->_right_paren, $parents);
    $extends_keyword = $rewriter($this->_extends_keyword, $parents);
    $extends_list = $rewriter($this->_extends_list, $parents);
    $implements_keyword = $rewriter($this->_implements_keyword, $parents);
    $implements_list = $rewriter($this->_implements_list, $parents);
    $body = $rewriter($this->_body, $parents);
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
      $class_keyword,
      $left_paren,
      $argument_list,
      $right_paren,
      $extends_keyword,
      $extends_list,
      $implements_keyword,
      $implements_list,
      $body,
    );
  }

  public function getClassKeywordUNTYPED(): Node {
    return $this->_class_keyword;
  }

  public function withClassKeyword(Node $value): this {
    if ($value === $this->_class_keyword) {
      return $this;
    }
    return new static(
      $value ?? Missing(),
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
    return !$this->_class_keyword->isMissing();
  }

  /**
   * @return unknown
   */
  public function getClassKeyword(): Node {
    return $this->_class_keyword;
  }

  /**
   * @return unknown
   */
  public function getClassKeywordx(): Node {
    return $this->getClassKeyword();
  }

  public function getLeftParenUNTYPED(): Node {
    return $this->_left_paren;
  }

  public function withLeftParen(Node $value): this {
    if ($value === $this->_left_paren) {
      return $this;
    }
    return new static(
      $this->_class_keyword,
      $value ?? Missing(),
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

  public function getArgumentListUNTYPED(): Node {
    return $this->_argument_list;
  }

  public function withArgumentList(Node $value): this {
    if ($value === $this->_argument_list) {
      return $this;
    }
    return new static(
      $this->_class_keyword,
      $this->_left_paren,
      $value ?? Missing(),
      $this->_right_paren,
      $this->_extends_keyword,
      $this->_extends_list,
      $this->_implements_keyword,
      $this->_implements_list,
      $this->_body,
    );
  }

  public function hasArgumentList(): bool {
    return !$this->_argument_list->isMissing();
  }

  /**
   * @return unknown
   */
  public function getArgumentList(): Node {
    return $this->_argument_list;
  }

  /**
   * @return unknown
   */
  public function getArgumentListx(): Node {
    return $this->getArgumentList();
  }

  public function getRightParenUNTYPED(): Node {
    return $this->_right_paren;
  }

  public function withRightParen(Node $value): this {
    if ($value === $this->_right_paren) {
      return $this;
    }
    return new static(
      $this->_class_keyword,
      $this->_left_paren,
      $this->_argument_list,
      $value ?? Missing(),
      $this->_extends_keyword,
      $this->_extends_list,
      $this->_implements_keyword,
      $this->_implements_list,
      $this->_body,
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

  public function getExtendsKeywordUNTYPED(): Node {
    return $this->_extends_keyword;
  }

  public function withExtendsKeyword(Node $value): this {
    if ($value === $this->_extends_keyword) {
      return $this;
    }
    return new static(
      $this->_class_keyword,
      $this->_left_paren,
      $this->_argument_list,
      $this->_right_paren,
      $value ?? Missing(),
      $this->_extends_list,
      $this->_implements_keyword,
      $this->_implements_list,
      $this->_body,
    );
  }

  public function hasExtendsKeyword(): bool {
    return !$this->_extends_keyword->isMissing();
  }

  /**
   * @return unknown
   */
  public function getExtendsKeyword(): Node {
    return $this->_extends_keyword;
  }

  /**
   * @return unknown
   */
  public function getExtendsKeywordx(): Node {
    return $this->getExtendsKeyword();
  }

  public function getExtendsListUNTYPED(): Node {
    return $this->_extends_list;
  }

  public function withExtendsList(Node $value): this {
    if ($value === $this->_extends_list) {
      return $this;
    }
    return new static(
      $this->_class_keyword,
      $this->_left_paren,
      $this->_argument_list,
      $this->_right_paren,
      $this->_extends_keyword,
      $value ?? Missing(),
      $this->_implements_keyword,
      $this->_implements_list,
      $this->_body,
    );
  }

  public function hasExtendsList(): bool {
    return !$this->_extends_list->isMissing();
  }

  /**
   * @return unknown
   */
  public function getExtendsList(): Node {
    return $this->_extends_list;
  }

  /**
   * @return unknown
   */
  public function getExtendsListx(): Node {
    return $this->getExtendsList();
  }

  public function getImplementsKeywordUNTYPED(): Node {
    return $this->_implements_keyword;
  }

  public function withImplementsKeyword(Node $value): this {
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
      $value ?? Missing(),
      $this->_implements_list,
      $this->_body,
    );
  }

  public function hasImplementsKeyword(): bool {
    return !$this->_implements_keyword->isMissing();
  }

  /**
   * @return unknown
   */
  public function getImplementsKeyword(): Node {
    return $this->_implements_keyword;
  }

  /**
   * @return unknown
   */
  public function getImplementsKeywordx(): Node {
    return $this->getImplementsKeyword();
  }

  public function getImplementsListUNTYPED(): Node {
    return $this->_implements_list;
  }

  public function withImplementsList(Node $value): this {
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
      $value ?? Missing(),
      $this->_body,
    );
  }

  public function hasImplementsList(): bool {
    return !$this->_implements_list->isMissing();
  }

  /**
   * @return unknown
   */
  public function getImplementsList(): Node {
    return $this->_implements_list;
  }

  /**
   * @return unknown
   */
  public function getImplementsListx(): Node {
    return $this->getImplementsList();
  }

  public function getBodyUNTYPED(): Node {
    return $this->_body;
  }

  public function withBody(Node $value): this {
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
      $value ?? Missing(),
    );
  }

  public function hasBody(): bool {
    return !$this->_body->isMissing();
  }

  /**
   * @return unknown
   */
  public function getBody(): Node {
    return $this->_body;
  }

  /**
   * @return unknown
   */
  public function getBodyx(): Node {
    return $this->getBody();
  }
}
