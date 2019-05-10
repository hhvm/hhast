/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<2973cc488aabcb8acf24cfc7068c7d77>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class UsingStatementBlockScoped
  extends EditableNode
  implements IStatement {

  private EditableNode $_await_keyword;
  private EditableNode $_using_keyword;
  private EditableNode $_left_paren;
  private EditableNode $_expressions;
  private EditableNode $_right_paren;
  private EditableNode $_body;

  public function __construct(
    EditableNode $await_keyword,
    EditableNode $using_keyword,
    EditableNode $left_paren,
    EditableNode $expressions,
    EditableNode $right_paren,
    EditableNode $body,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_await_keyword = $await_keyword;
    $this->_using_keyword = $using_keyword;
    $this->_left_paren = $left_paren;
    $this->_expressions = $expressions;
    $this->_right_paren = $right_paren;
    $this->_body = $body;
    parent::__construct('using_statement_block_scoped', $source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
  ): this {
    $offset = $initial_offset;
    $await_keyword = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['using_block_await_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $await_keyword->getWidth();
    $using_keyword = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['using_block_using_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $using_keyword->getWidth();
    $left_paren = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['using_block_left_paren'],
      $file,
      $offset,
      $source,
    );
    $offset += $left_paren->getWidth();
    $expressions = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['using_block_expressions'],
      $file,
      $offset,
      $source,
    );
    $offset += $expressions->getWidth();
    $right_paren = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['using_block_right_paren'],
      $file,
      $offset,
      $source,
    );
    $offset += $right_paren->getWidth();
    $body = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['using_block_body'],
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
      $await_keyword,
      $using_keyword,
      $left_paren,
      $expressions,
      $right_paren,
      $body,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'await_keyword' => $this->_await_keyword,
      'using_keyword' => $this->_using_keyword,
      'left_paren' => $this->_left_paren,
      'expressions' => $this->_expressions,
      'right_paren' => $this->_right_paren,
      'body' => $this->_body,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<EditableNode> $parents = vec[],
  ): this {
    $parents[] = $this;
    $await_keyword = $rewriter($this->_await_keyword, $parents);
    $using_keyword = $rewriter($this->_using_keyword, $parents);
    $left_paren = $rewriter($this->_left_paren, $parents);
    $expressions = $rewriter($this->_expressions, $parents);
    $right_paren = $rewriter($this->_right_paren, $parents);
    $body = $rewriter($this->_body, $parents);
    if (
      $await_keyword === $this->_await_keyword &&
      $using_keyword === $this->_using_keyword &&
      $left_paren === $this->_left_paren &&
      $expressions === $this->_expressions &&
      $right_paren === $this->_right_paren &&
      $body === $this->_body
    ) {
      return $this;
    }
    return new static(
      $await_keyword,
      $using_keyword,
      $left_paren,
      $expressions,
      $right_paren,
      $body,
    );
  }

  public function getAwaitKeywordUNTYPED(): EditableNode {
    return $this->_await_keyword;
  }

  public function withAwaitKeyword(EditableNode $value): this {
    if ($value === $this->_await_keyword) {
      return $this;
    }
    return new static(
      $value,
      $this->_using_keyword,
      $this->_left_paren,
      $this->_expressions,
      $this->_right_paren,
      $this->_body,
    );
  }

  public function hasAwaitKeyword(): bool {
    return !$this->_await_keyword->isMissing();
  }

  /**
   * @return null | AwaitToken
   */
  public function getAwaitKeyword(): ?AwaitToken {
    if ($this->_await_keyword->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(AwaitToken::class, $this->_await_keyword);
  }

  /**
   * @return AwaitToken
   */
  public function getAwaitKeywordx(): AwaitToken {
    return TypeAssert\not_null($this->getAwaitKeyword());
  }

  public function getUsingKeywordUNTYPED(): EditableNode {
    return $this->_using_keyword;
  }

  public function withUsingKeyword(EditableNode $value): this {
    if ($value === $this->_using_keyword) {
      return $this;
    }
    return new static(
      $this->_await_keyword,
      $value,
      $this->_left_paren,
      $this->_expressions,
      $this->_right_paren,
      $this->_body,
    );
  }

  public function hasUsingKeyword(): bool {
    return !$this->_using_keyword->isMissing();
  }

  /**
   * @return UsingToken
   */
  public function getUsingKeyword(): UsingToken {
    return TypeAssert\instance_of(UsingToken::class, $this->_using_keyword);
  }

  /**
   * @return UsingToken
   */
  public function getUsingKeywordx(): UsingToken {
    return $this->getUsingKeyword();
  }

  public function getLeftParenUNTYPED(): EditableNode {
    return $this->_left_paren;
  }

  public function withLeftParen(EditableNode $value): this {
    if ($value === $this->_left_paren) {
      return $this;
    }
    return new static(
      $this->_await_keyword,
      $this->_using_keyword,
      $value,
      $this->_expressions,
      $this->_right_paren,
      $this->_body,
    );
  }

  public function hasLeftParen(): bool {
    return !$this->_left_paren->isMissing();
  }

  /**
   * @return LeftParenToken
   */
  public function getLeftParen(): LeftParenToken {
    return TypeAssert\instance_of(LeftParenToken::class, $this->_left_paren);
  }

  /**
   * @return LeftParenToken
   */
  public function getLeftParenx(): LeftParenToken {
    return $this->getLeftParen();
  }

  public function getExpressionsUNTYPED(): EditableNode {
    return $this->_expressions;
  }

  public function withExpressions(EditableNode $value): this {
    if ($value === $this->_expressions) {
      return $this;
    }
    return new static(
      $this->_await_keyword,
      $this->_using_keyword,
      $this->_left_paren,
      $value,
      $this->_right_paren,
      $this->_body,
    );
  }

  public function hasExpressions(): bool {
    return !$this->_expressions->isMissing();
  }

  /**
   * @return EditableList<AnonymousFunction> | EditableList<BinaryExpression> |
   * EditableList<LambdaExpression> | EditableList<ObjectCreationExpression> |
   * EditableList<IExpression> | EditableList<PrefixUnaryExpression> |
   * EditableList<VariableExpression>
   */
  public function getExpressions(): EditableList<IExpression> {
    return TypeAssert\instance_of(EditableList::class, $this->_expressions);
  }

  /**
   * @return EditableList<AnonymousFunction> | EditableList<BinaryExpression> |
   * EditableList<LambdaExpression> | EditableList<ObjectCreationExpression> |
   * EditableList<IExpression> | EditableList<PrefixUnaryExpression> |
   * EditableList<VariableExpression>
   */
  public function getExpressionsx(): EditableList<IExpression> {
    return $this->getExpressions();
  }

  public function getRightParenUNTYPED(): EditableNode {
    return $this->_right_paren;
  }

  public function withRightParen(EditableNode $value): this {
    if ($value === $this->_right_paren) {
      return $this;
    }
    return new static(
      $this->_await_keyword,
      $this->_using_keyword,
      $this->_left_paren,
      $this->_expressions,
      $value,
      $this->_body,
    );
  }

  public function hasRightParen(): bool {
    return !$this->_right_paren->isMissing();
  }

  /**
   * @return RightParenToken
   */
  public function getRightParen(): RightParenToken {
    return TypeAssert\instance_of(RightParenToken::class, $this->_right_paren);
  }

  /**
   * @return RightParenToken
   */
  public function getRightParenx(): RightParenToken {
    return $this->getRightParen();
  }

  public function getBodyUNTYPED(): EditableNode {
    return $this->_body;
  }

  public function withBody(EditableNode $value): this {
    if ($value === $this->_body) {
      return $this;
    }
    return new static(
      $this->_await_keyword,
      $this->_using_keyword,
      $this->_left_paren,
      $this->_expressions,
      $this->_right_paren,
      $value,
    );
  }

  public function hasBody(): bool {
    return !$this->_body->isMissing();
  }

  /**
   * @return CompoundStatement
   */
  public function getBody(): CompoundStatement {
    return TypeAssert\instance_of(CompoundStatement::class, $this->_body);
  }

  /**
   * @return CompoundStatement
   */
  public function getBodyx(): CompoundStatement {
    return $this->getBody();
  }
}
