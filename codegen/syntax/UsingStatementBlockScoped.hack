/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<49c1d4f48a162bcd8d7b10a5a1ca6fa0>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class UsingStatementBlockScoped extends Node implements IStatement {

  const string SYNTAX_KIND = 'using_statement_block_scoped';

  private ?AwaitToken $_await_keyword;
  private UsingToken $_using_keyword;
  private LeftParenToken $_left_paren;
  private NodeList<ListItem<IExpression>> $_expressions;
  private RightParenToken $_right_paren;
  private CompoundStatement $_body;

  public function __construct(
    ?AwaitToken $await_keyword,
    UsingToken $using_keyword,
    LeftParenToken $left_paren,
    NodeList<ListItem<IExpression>> $expressions,
    RightParenToken $right_paren,
    CompoundStatement $body,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_await_keyword = $await_keyword;
    $this->_using_keyword = $using_keyword;
    $this->_left_paren = $left_paren;
    $this->_expressions = $expressions;
    $this->_right_paren = $right_paren;
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
    $await_keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['using_block_await_keyword'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'AwaitToken',
    );
    $offset += $await_keyword?->getWidth() ?? 0;
    $using_keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['using_block_using_keyword'],
      $file,
      $offset,
      $source,
      'UsingToken',
    );
    $using_keyword = $using_keyword as nonnull;
    $offset += $using_keyword->getWidth();
    $left_paren = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['using_block_left_paren'],
      $file,
      $offset,
      $source,
      'LeftParenToken',
    );
    $left_paren = $left_paren as nonnull;
    $offset += $left_paren->getWidth();
    $expressions = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['using_block_expressions'],
      $file,
      $offset,
      $source,
      'NodeList<ListItem<IExpression>>',
    );
    $expressions = $expressions as nonnull;
    $offset += $expressions->getWidth();
    $right_paren = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['using_block_right_paren'],
      $file,
      $offset,
      $source,
      'RightParenToken',
    );
    $right_paren = $right_paren as nonnull;
    $offset += $right_paren->getWidth();
    $body = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['using_block_body'],
      $file,
      $offset,
      $source,
      'CompoundStatement',
    );
    $body = $body as nonnull;
    $offset += $body->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $await_keyword,
      /* HH_IGNORE_ERROR[4110] */ $using_keyword,
      /* HH_IGNORE_ERROR[4110] */ $left_paren,
      /* HH_IGNORE_ERROR[4110] */ $expressions,
      /* HH_IGNORE_ERROR[4110] */ $right_paren,
      /* HH_IGNORE_ERROR[4110] */ $body,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'await_keyword' => $this->_await_keyword,
      'using_keyword' => $this->_using_keyword,
      'left_paren' => $this->_left_paren,
      'expressions' => $this->_expressions,
      'right_paren' => $this->_right_paren,
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
    $await_keyword = $this->_await_keyword === null
      ? null
      : $rewriter($this->_await_keyword, $parents);
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
      /* HH_FIXME[4110] use `as` */ $await_keyword,
      /* HH_FIXME[4110] use `as` */ $using_keyword,
      /* HH_FIXME[4110] use `as` */ $left_paren,
      /* HH_FIXME[4110] use `as` */ $expressions,
      /* HH_FIXME[4110] use `as` */ $right_paren,
      /* HH_FIXME[4110] use `as` */ $body,
    );
  }

  public function getAwaitKeywordUNTYPED(): ?Node {
    return $this->_await_keyword;
  }

  public function withAwaitKeyword(?AwaitToken $value): this {
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
    return $this->_await_keyword !== null;
  }

  /**
   * @return null | AwaitToken
   */
  public function getAwaitKeyword(): ?AwaitToken {
    return $this->_await_keyword;
  }

  /**
   * @return AwaitToken
   */
  public function getAwaitKeywordx(): AwaitToken {
    return TypeAssert\not_null($this->getAwaitKeyword());
  }

  public function getUsingKeywordUNTYPED(): ?Node {
    return $this->_using_keyword;
  }

  public function withUsingKeyword(UsingToken $value): this {
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
    return $this->_using_keyword !== null;
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

  public function getLeftParenUNTYPED(): ?Node {
    return $this->_left_paren;
  }

  public function withLeftParen(LeftParenToken $value): this {
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
    return $this->_left_paren !== null;
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

  public function getExpressionsUNTYPED(): ?Node {
    return $this->_expressions;
  }

  public function withExpressions(
    NodeList<ListItem<IExpression>> $value,
  ): this {
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
    return $this->_expressions !== null;
  }

  /**
   * @return NodeList<ListItem<AnonymousFunction>> |
   * NodeList<ListItem<BinaryExpression>> |
   * NodeList<ListItem<LambdaExpression>> |
   * NodeList<ListItem<ObjectCreationExpression>> |
   * NodeList<ListItem<IExpression>> |
   * NodeList<ListItem<PrefixUnaryExpression>> |
   * NodeList<ListItem<VariableExpression>>
   */
  public function getExpressions(): NodeList<ListItem<IExpression>> {
    return TypeAssert\instance_of(NodeList::class, $this->_expressions);
  }

  /**
   * @return NodeList<ListItem<AnonymousFunction>> |
   * NodeList<ListItem<BinaryExpression>> |
   * NodeList<ListItem<LambdaExpression>> |
   * NodeList<ListItem<ObjectCreationExpression>> |
   * NodeList<ListItem<IExpression>> |
   * NodeList<ListItem<PrefixUnaryExpression>> |
   * NodeList<ListItem<VariableExpression>>
   */
  public function getExpressionsx(): NodeList<ListItem<IExpression>> {
    return $this->getExpressions();
  }

  public function getRightParenUNTYPED(): ?Node {
    return $this->_right_paren;
  }

  public function withRightParen(RightParenToken $value): this {
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
    return $this->_right_paren !== null;
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

  public function getBodyUNTYPED(): ?Node {
    return $this->_body;
  }

  public function withBody(CompoundStatement $value): this {
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
    return $this->_body !== null;
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
