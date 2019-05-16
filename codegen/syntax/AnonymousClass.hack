/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<b8e1c5869806c9566f4b961ab7d9c2aa>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class AnonymousClass extends EditableNode {

  const string SYNTAX_KIND = 'anonymous_class';

  private EditableNode $_class_keyword;
  private EditableNode $_left_paren;
  private EditableNode $_argument_list;
  private EditableNode $_right_paren;
  private EditableNode $_extends_keyword;
  private EditableNode $_extends_list;
  private EditableNode $_implements_keyword;
  private EditableNode $_implements_list;
  private EditableNode $_body;

  public function __construct(
    EditableNode $class_keyword,
    EditableNode $left_paren,
    EditableNode $argument_list,
    EditableNode $right_paren,
    EditableNode $extends_keyword,
    EditableNode $extends_list,
    EditableNode $implements_keyword,
    EditableNode $implements_list,
    EditableNode $body,
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
  ): this {
    $offset = $initial_offset;
    $class_keyword = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['anonymous_class_class_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $class_keyword->getWidth();
    $left_paren = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['anonymous_class_left_paren'],
      $file,
      $offset,
      $source,
    );
    $offset += $left_paren->getWidth();
    $argument_list = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['anonymous_class_argument_list'],
      $file,
      $offset,
      $source,
    );
    $offset += $argument_list->getWidth();
    $right_paren = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['anonymous_class_right_paren'],
      $file,
      $offset,
      $source,
    );
    $offset += $right_paren->getWidth();
    $extends_keyword = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['anonymous_class_extends_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $extends_keyword->getWidth();
    $extends_list = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['anonymous_class_extends_list'],
      $file,
      $offset,
      $source,
    );
    $offset += $extends_list->getWidth();
    $implements_keyword = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['anonymous_class_implements_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $implements_keyword->getWidth();
    $implements_list = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['anonymous_class_implements_list'],
      $file,
      $offset,
      $source,
    );
    $offset += $implements_list->getWidth();
    $body = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['anonymous_class_body'],
      $file,
      $offset,
      $source,
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
  public function getChildren(): dict<string, EditableNode> {
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
    vec<EditableNode> $parents = vec[],
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

  public function getClassKeywordUNTYPED(): EditableNode {
    return $this->_class_keyword;
  }

  public function withClassKeyword(EditableNode $value): this {
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
    return !$this->_class_keyword->isMissing();
  }

  /**
   * @return unknown
   */
  public function getClassKeyword(): EditableNode {
    return $this->_class_keyword;
  }

  /**
   * @return unknown
   */
  public function getClassKeywordx(): EditableNode {
    return $this->getClassKeyword();
  }

  public function getLeftParenUNTYPED(): EditableNode {
    return $this->_left_paren;
  }

  public function withLeftParen(EditableNode $value): this {
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
    return !$this->_left_paren->isMissing();
  }

  /**
   * @return unknown
   */
  public function getLeftParen(): EditableNode {
    return $this->_left_paren;
  }

  /**
   * @return unknown
   */
  public function getLeftParenx(): EditableNode {
    return $this->getLeftParen();
  }

  public function getArgumentListUNTYPED(): EditableNode {
    return $this->_argument_list;
  }

  public function withArgumentList(EditableNode $value): this {
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
    return !$this->_argument_list->isMissing();
  }

  /**
   * @return unknown
   */
  public function getArgumentList(): EditableNode {
    return $this->_argument_list;
  }

  /**
   * @return unknown
   */
  public function getArgumentListx(): EditableNode {
    return $this->getArgumentList();
  }

  public function getRightParenUNTYPED(): EditableNode {
    return $this->_right_paren;
  }

  public function withRightParen(EditableNode $value): this {
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
    return !$this->_right_paren->isMissing();
  }

  /**
   * @return unknown
   */
  public function getRightParen(): EditableNode {
    return $this->_right_paren;
  }

  /**
   * @return unknown
   */
  public function getRightParenx(): EditableNode {
    return $this->getRightParen();
  }

  public function getExtendsKeywordUNTYPED(): EditableNode {
    return $this->_extends_keyword;
  }

  public function withExtendsKeyword(EditableNode $value): this {
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
    return !$this->_extends_keyword->isMissing();
  }

  /**
   * @return unknown
   */
  public function getExtendsKeyword(): EditableNode {
    return $this->_extends_keyword;
  }

  /**
   * @return unknown
   */
  public function getExtendsKeywordx(): EditableNode {
    return $this->getExtendsKeyword();
  }

  public function getExtendsListUNTYPED(): EditableNode {
    return $this->_extends_list;
  }

  public function withExtendsList(EditableNode $value): this {
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
    return !$this->_extends_list->isMissing();
  }

  /**
   * @return unknown
   */
  public function getExtendsList(): EditableNode {
    return $this->_extends_list;
  }

  /**
   * @return unknown
   */
  public function getExtendsListx(): EditableNode {
    return $this->getExtendsList();
  }

  public function getImplementsKeywordUNTYPED(): EditableNode {
    return $this->_implements_keyword;
  }

  public function withImplementsKeyword(EditableNode $value): this {
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
    return !$this->_implements_keyword->isMissing();
  }

  /**
   * @return unknown
   */
  public function getImplementsKeyword(): EditableNode {
    return $this->_implements_keyword;
  }

  /**
   * @return unknown
   */
  public function getImplementsKeywordx(): EditableNode {
    return $this->getImplementsKeyword();
  }

  public function getImplementsListUNTYPED(): EditableNode {
    return $this->_implements_list;
  }

  public function withImplementsList(EditableNode $value): this {
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
    return !$this->_implements_list->isMissing();
  }

  /**
   * @return unknown
   */
  public function getImplementsList(): EditableNode {
    return $this->_implements_list;
  }

  /**
   * @return unknown
   */
  public function getImplementsListx(): EditableNode {
    return $this->getImplementsList();
  }

  public function getBodyUNTYPED(): EditableNode {
    return $this->_body;
  }

  public function withBody(EditableNode $value): this {
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
    return !$this->_body->isMissing();
  }

  /**
   * @return unknown
   */
  public function getBody(): EditableNode {
    return $this->_body;
  }

  /**
   * @return unknown
   */
  public function getBodyx(): EditableNode {
    return $this->getBody();
  }
}
