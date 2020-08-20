/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<072a8bb9fbc1e972c36031d857c89475>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class ForeachStatement
  extends Node
  implements IControlFlowStatement, ILoopStatement, IStatement {

  const string SYNTAX_KIND = 'foreach_statement';

  private ForeachToken $_keyword;
  private LeftParenToken $_left_paren;
  private IExpression $_collection;
  private ?AwaitToken $_await_keyword;
  private AsToken $_as;
  private ?IExpression $_key;
  private ?EqualGreaterThanToken $_arrow;
  private IExpression $_value;
  private RightParenToken $_right_paren;
  private IStatement $_body;

  public function __construct(
    ForeachToken $keyword,
    LeftParenToken $left_paren,
    IExpression $collection,
    ?AwaitToken $await_keyword,
    AsToken $as,
    ?IExpression $key,
    ?EqualGreaterThanToken $arrow,
    IExpression $value,
    RightParenToken $right_paren,
    IStatement $body,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_keyword = $keyword;
    $this->_left_paren = $left_paren;
    $this->_collection = $collection;
    $this->_await_keyword = $await_keyword;
    $this->_as = $as;
    $this->_key = $key;
    $this->_arrow = $arrow;
    $this->_value = $value;
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
    $keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['foreach_keyword'],
      $file,
      $offset,
      $source,
      'ForeachToken',
    );
    $keyword = $keyword as nonnull;
    $offset += $keyword->getWidth();
    $left_paren = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['foreach_left_paren'],
      $file,
      $offset,
      $source,
      'LeftParenToken',
    );
    $left_paren = $left_paren as nonnull;
    $offset += $left_paren->getWidth();
    $collection = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['foreach_collection'],
      $file,
      $offset,
      $source,
      'IExpression',
    );
    $collection = $collection as nonnull;
    $offset += $collection->getWidth();
    $await_keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['foreach_await_keyword'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'AwaitToken',
    );
    $offset += $await_keyword?->getWidth() ?? 0;
    $as = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['foreach_as'],
      $file,
      $offset,
      $source,
      'AsToken',
    );
    $as = $as as nonnull;
    $offset += $as->getWidth();
    $key = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['foreach_key'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'IExpression',
    );
    $offset += $key?->getWidth() ?? 0;
    $arrow = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['foreach_arrow'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'EqualGreaterThanToken',
    );
    $offset += $arrow?->getWidth() ?? 0;
    $value = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['foreach_value'],
      $file,
      $offset,
      $source,
      'IExpression',
    );
    $value = $value as nonnull;
    $offset += $value->getWidth();
    $right_paren = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['foreach_right_paren'],
      $file,
      $offset,
      $source,
      'RightParenToken',
    );
    $right_paren = $right_paren as nonnull;
    $offset += $right_paren->getWidth();
    $body = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['foreach_body'],
      $file,
      $offset,
      $source,
      'IStatement',
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
      /* HH_IGNORE_ERROR[4110] */ $keyword,
      /* HH_IGNORE_ERROR[4110] */ $left_paren,
      /* HH_IGNORE_ERROR[4110] */ $collection,
      /* HH_IGNORE_ERROR[4110] */ $await_keyword,
      /* HH_IGNORE_ERROR[4110] */ $as,
      /* HH_IGNORE_ERROR[4110] */ $key,
      /* HH_IGNORE_ERROR[4110] */ $arrow,
      /* HH_IGNORE_ERROR[4110] */ $value,
      /* HH_IGNORE_ERROR[4110] */ $right_paren,
      /* HH_IGNORE_ERROR[4110] */ $body,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'keyword' => $this->_keyword,
      'left_paren' => $this->_left_paren,
      'collection' => $this->_collection,
      'await_keyword' => $this->_await_keyword,
      'as' => $this->_as,
      'key' => $this->_key,
      'arrow' => $this->_arrow,
      'value' => $this->_value,
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
    $keyword = $rewriter($this->_keyword, $parents);
    $left_paren = $rewriter($this->_left_paren, $parents);
    $collection = $rewriter($this->_collection, $parents);
    $await_keyword = $this->_await_keyword === null
      ? null
      : $rewriter($this->_await_keyword, $parents);
    $as = $rewriter($this->_as, $parents);
    $key = $this->_key === null ? null : $rewriter($this->_key, $parents);
    $arrow = $this->_arrow === null ? null : $rewriter($this->_arrow, $parents);
    $value = $rewriter($this->_value, $parents);
    $right_paren = $rewriter($this->_right_paren, $parents);
    $body = $rewriter($this->_body, $parents);
    if (
      $keyword === $this->_keyword &&
      $left_paren === $this->_left_paren &&
      $collection === $this->_collection &&
      $await_keyword === $this->_await_keyword &&
      $as === $this->_as &&
      $key === $this->_key &&
      $arrow === $this->_arrow &&
      $value === $this->_value &&
      $right_paren === $this->_right_paren &&
      $body === $this->_body
    ) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $keyword,
      /* HH_FIXME[4110] use `as` */ $left_paren,
      /* HH_FIXME[4110] use `as` */ $collection,
      /* HH_FIXME[4110] use `as` */ $await_keyword,
      /* HH_FIXME[4110] use `as` */ $as,
      /* HH_FIXME[4110] use `as` */ $key,
      /* HH_FIXME[4110] use `as` */ $arrow,
      /* HH_FIXME[4110] use `as` */ $value,
      /* HH_FIXME[4110] use `as` */ $right_paren,
      /* HH_FIXME[4110] use `as` */ $body,
    );
  }

  public function getKeywordUNTYPED(): ?Node {
    return $this->_keyword;
  }

  public function withKeyword(ForeachToken $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static(
      $value,
      $this->_left_paren,
      $this->_collection,
      $this->_await_keyword,
      $this->_as,
      $this->_key,
      $this->_arrow,
      $this->_value,
      $this->_right_paren,
      $this->_body,
    );
  }

  public function hasKeyword(): bool {
    return $this->_keyword !== null;
  }

  /**
   * @return ForeachToken
   */
  public function getKeyword(): ForeachToken {
    return TypeAssert\instance_of(ForeachToken::class, $this->_keyword);
  }

  /**
   * @return ForeachToken
   */
  public function getKeywordx(): ForeachToken {
    return $this->getKeyword();
  }

  public function getLeftParenUNTYPED(): ?Node {
    return $this->_left_paren;
  }

  public function withLeftParen(LeftParenToken $value): this {
    if ($value === $this->_left_paren) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $value,
      $this->_collection,
      $this->_await_keyword,
      $this->_as,
      $this->_key,
      $this->_arrow,
      $this->_value,
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

  public function getCollectionUNTYPED(): ?Node {
    return $this->_collection;
  }

  public function withCollection(IExpression $value): this {
    if ($value === $this->_collection) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_left_paren,
      $value,
      $this->_await_keyword,
      $this->_as,
      $this->_key,
      $this->_arrow,
      $this->_value,
      $this->_right_paren,
      $this->_body,
    );
  }

  public function hasCollection(): bool {
    return $this->_collection !== null;
  }

  /**
   * @return AnonymousFunction | CollectionLiteralExpression |
   * DarrayIntrinsicExpression | FunctionCallExpression |
   * MemberSelectionExpression | ObjectCreationExpression |
   * ParenthesizedExpression | PrefixUnaryExpression |
   * ScopeResolutionExpression | SubscriptExpression | NameToken |
   * VariableExpression | VarrayIntrinsicExpression | VectorIntrinsicExpression
   */
  public function getCollection(): IExpression {
    return TypeAssert\instance_of(IExpression::class, $this->_collection);
  }

  /**
   * @return AnonymousFunction | CollectionLiteralExpression |
   * DarrayIntrinsicExpression | FunctionCallExpression |
   * MemberSelectionExpression | ObjectCreationExpression |
   * ParenthesizedExpression | PrefixUnaryExpression |
   * ScopeResolutionExpression | SubscriptExpression | NameToken |
   * VariableExpression | VarrayIntrinsicExpression | VectorIntrinsicExpression
   */
  public function getCollectionx(): IExpression {
    return $this->getCollection();
  }

  public function getAwaitKeywordUNTYPED(): ?Node {
    return $this->_await_keyword;
  }

  public function withAwaitKeyword(?AwaitToken $value): this {
    if ($value === $this->_await_keyword) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_left_paren,
      $this->_collection,
      $value,
      $this->_as,
      $this->_key,
      $this->_arrow,
      $this->_value,
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

  public function getAsUNTYPED(): ?Node {
    return $this->_as;
  }

  public function withAs(AsToken $value): this {
    if ($value === $this->_as) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_left_paren,
      $this->_collection,
      $this->_await_keyword,
      $value,
      $this->_key,
      $this->_arrow,
      $this->_value,
      $this->_right_paren,
      $this->_body,
    );
  }

  public function hasAs(): bool {
    return $this->_as !== null;
  }

  /**
   * @return AsToken
   */
  public function getAs(): AsToken {
    return TypeAssert\instance_of(AsToken::class, $this->_as);
  }

  /**
   * @return AsToken
   */
  public function getAsx(): AsToken {
    return $this->getAs();
  }

  public function getKeyUNTYPED(): ?Node {
    return $this->_key;
  }

  public function withKey(?IExpression $value): this {
    if ($value === $this->_key) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_left_paren,
      $this->_collection,
      $this->_await_keyword,
      $this->_as,
      $value,
      $this->_arrow,
      $this->_value,
      $this->_right_paren,
      $this->_body,
    );
  }

  public function hasKey(): bool {
    return $this->_key !== null;
  }

  /**
   * @return ListExpression | MemberSelectionExpression | null |
   * SubscriptExpression | VariableExpression
   */
  public function getKey(): ?IExpression {
    return $this->_key;
  }

  /**
   * @return ListExpression | MemberSelectionExpression | SubscriptExpression |
   * VariableExpression
   */
  public function getKeyx(): IExpression {
    return TypeAssert\not_null($this->getKey());
  }

  public function getArrowUNTYPED(): ?Node {
    return $this->_arrow;
  }

  public function withArrow(?EqualGreaterThanToken $value): this {
    if ($value === $this->_arrow) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_left_paren,
      $this->_collection,
      $this->_await_keyword,
      $this->_as,
      $this->_key,
      $value,
      $this->_value,
      $this->_right_paren,
      $this->_body,
    );
  }

  public function hasArrow(): bool {
    return $this->_arrow !== null;
  }

  /**
   * @return null | EqualGreaterThanToken
   */
  public function getArrow(): ?EqualGreaterThanToken {
    return $this->_arrow;
  }

  /**
   * @return EqualGreaterThanToken
   */
  public function getArrowx(): EqualGreaterThanToken {
    return TypeAssert\not_null($this->getArrow());
  }

  public function getValueUNTYPED(): ?Node {
    return $this->_value;
  }

  public function withValue(IExpression $value): this {
    if ($value === $this->_value) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_left_paren,
      $this->_collection,
      $this->_await_keyword,
      $this->_as,
      $this->_key,
      $this->_arrow,
      $value,
      $this->_right_paren,
      $this->_body,
    );
  }

  public function hasValue(): bool {
    return $this->_value !== null;
  }

  /**
   * @return ListExpression | MemberSelectionExpression |
   * ScopeResolutionExpression | SubscriptExpression | VariableExpression
   */
  public function getValue(): IExpression {
    return TypeAssert\instance_of(IExpression::class, $this->_value);
  }

  /**
   * @return ListExpression | MemberSelectionExpression |
   * ScopeResolutionExpression | SubscriptExpression | VariableExpression
   */
  public function getValuex(): IExpression {
    return $this->getValue();
  }

  public function getRightParenUNTYPED(): ?Node {
    return $this->_right_paren;
  }

  public function withRightParen(RightParenToken $value): this {
    if ($value === $this->_right_paren) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_left_paren,
      $this->_collection,
      $this->_await_keyword,
      $this->_as,
      $this->_key,
      $this->_arrow,
      $this->_value,
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

  public function withBody(IStatement $value): this {
    if ($value === $this->_body) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_left_paren,
      $this->_collection,
      $this->_await_keyword,
      $this->_as,
      $this->_key,
      $this->_arrow,
      $this->_value,
      $this->_right_paren,
      $value,
    );
  }

  public function hasBody(): bool {
    return $this->_body !== null;
  }

  /**
   * @return CompoundStatement | EchoStatement | ExpressionStatement |
   * ForeachStatement
   */
  public function getBody(): IStatement {
    return TypeAssert\instance_of(IStatement::class, $this->_body);
  }

  /**
   * @return CompoundStatement | EchoStatement | ExpressionStatement |
   * ForeachStatement
   */
  public function getBodyx(): IStatement {
    return $this->getBody();
  }
}
