<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<97966ab077c5516587b2049cc9ff61dc>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class AnonymousClass extends EditableNode {

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
  ) {
    parent::__construct('anonymous_class');
    $this->_class_keyword = $class_keyword;
    $this->_left_paren = $left_paren;
    $this->_argument_list = $argument_list;
    $this->_right_paren = $right_paren;
    $this->_extends_keyword = $extends_keyword;
    $this->_extends_list = $extends_list;
    $this->_implements_keyword = $implements_keyword;
    $this->_implements_list = $implements_list;
    $this->_body = $body;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
  ): this {
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
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?vec<EditableNode> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $class_keyword = $this->_class_keyword->rewrite($rewriter, $parents);
    $left_paren = $this->_left_paren->rewrite($rewriter, $parents);
    $argument_list = $this->_argument_list->rewrite($rewriter, $parents);
    $right_paren = $this->_right_paren->rewrite($rewriter, $parents);
    $extends_keyword = $this->_extends_keyword->rewrite($rewriter, $parents);
    $extends_list = $this->_extends_list->rewrite($rewriter, $parents);
    $implements_keyword = $this->_implements_keyword
      ->rewrite($rewriter, $parents);
    $implements_list = $this->_implements_list->rewrite($rewriter, $parents);
    $body = $this->_body->rewrite($rewriter, $parents);
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
   * @return ClassToken
   */
  public function getClassKeyword(): ClassToken {
    return TypeAssert\instance_of(ClassToken::class, $this->_class_keyword);
  }

  /**
   * @return ClassToken
   */
  public function getClassKeywordx(): ClassToken {
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
   * @return null | LeftParenToken
   */
  public function getLeftParen(): ?LeftParenToken {
    if ($this->_left_paren->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(LeftParenToken::class, $this->_left_paren);
  }

  /**
   * @return LeftParenToken
   */
  public function getLeftParenx(): LeftParenToken {
    return TypeAssert\instance_of(LeftParenToken::class, $this->_left_paren);
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
   * @return EditableList<AnonymousFunction> | EditableList<LiteralExpression>
   * | EditableList<MemberSelectionExpression> |
   * EditableList<VariableExpression> | null
   */
  public function getArgumentList(): ?EditableList<EditableNode> {
    if ($this->_argument_list->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableList::class, $this->_argument_list);
  }

  /**
   * @return EditableList<AnonymousFunction> | EditableList<LiteralExpression>
   * | EditableList<MemberSelectionExpression> |
   * EditableList<VariableExpression>
   */
  public function getArgumentListx(): EditableList<EditableNode> {
    return TypeAssert\instance_of(EditableList::class, $this->_argument_list);
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
   * @return null | RightParenToken
   */
  public function getRightParen(): ?RightParenToken {
    if ($this->_right_paren->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(RightParenToken::class, $this->_right_paren);
  }

  /**
   * @return RightParenToken
   */
  public function getRightParenx(): RightParenToken {
    return TypeAssert\instance_of(RightParenToken::class, $this->_right_paren);
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
   * @return null | ExtendsToken
   */
  public function getExtendsKeyword(): ?ExtendsToken {
    if ($this->_extends_keyword->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(ExtendsToken::class, $this->_extends_keyword);
  }

  /**
   * @return ExtendsToken
   */
  public function getExtendsKeywordx(): ExtendsToken {
    return TypeAssert\instance_of(ExtendsToken::class, $this->_extends_keyword);
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
   * @return EditableList<SimpleTypeSpecifier> | null
   */
  public function getExtendsList(): ?EditableList<SimpleTypeSpecifier> {
    if ($this->_extends_list->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableList::class, $this->_extends_list);
  }

  /**
   * @return EditableList<SimpleTypeSpecifier>
   */
  public function getExtendsListx(): EditableList<SimpleTypeSpecifier> {
    return TypeAssert\instance_of(EditableList::class, $this->_extends_list);
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
   * @return null | ImplementsToken
   */
  public function getImplementsKeyword(): ?ImplementsToken {
    if ($this->_implements_keyword->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(
      ImplementsToken::class,
      $this->_implements_keyword,
    );
  }

  /**
   * @return ImplementsToken
   */
  public function getImplementsKeywordx(): ImplementsToken {
    return TypeAssert\instance_of(
      ImplementsToken::class,
      $this->_implements_keyword,
    );
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
   * @return EditableList<SimpleTypeSpecifier> | null
   */
  public function getImplementsList(): ?EditableList<SimpleTypeSpecifier> {
    if ($this->_implements_list->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableList::class, $this->_implements_list);
  }

  /**
   * @return EditableList<SimpleTypeSpecifier>
   */
  public function getImplementsListx(): EditableList<SimpleTypeSpecifier> {
    return TypeAssert\instance_of(EditableList::class, $this->_implements_list);
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
   * @return ClassishBody
   */
  public function getBody(): ClassishBody {
    return TypeAssert\instance_of(ClassishBody::class, $this->_body);
  }

  /**
   * @return ClassishBody
   */
  public function getBodyx(): ClassishBody {
    return $this->getBody();
  }
}
