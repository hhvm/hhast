<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<ecb389be6cbf63c35cabc5fd751e0bd2>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class ForeachStatement extends EditableSyntax
  implements IControlFlowStatement, ILoopStatement {

  private EditableSyntax $_keyword;
  private EditableSyntax $_left_paren;
  private EditableSyntax $_collection;
  private EditableSyntax $_await_keyword;
  private EditableSyntax $_as;
  private EditableSyntax $_key;
  private EditableSyntax $_arrow;
  private EditableSyntax $_value;
  private EditableSyntax $_right_paren;
  private EditableSyntax $_body;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $left_paren,
    EditableSyntax $collection,
    EditableSyntax $await_keyword,
    EditableSyntax $as,
    EditableSyntax $key,
    EditableSyntax $arrow,
    EditableSyntax $value,
    EditableSyntax $right_paren,
    EditableSyntax $body,
  ) {
    parent::__construct('foreach_statement');
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
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['foreach_keyword'],
      $position,
      $source,
    );
    $position += $keyword->getWidth();
    $left_paren = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['foreach_left_paren'],
      $position,
      $source,
    );
    $position += $left_paren->getWidth();
    $collection = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['foreach_collection'],
      $position,
      $source,
    );
    $position += $collection->getWidth();
    $await_keyword = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['foreach_await_keyword'],
      $position,
      $source,
    );
    $position += $await_keyword->getWidth();
    $as = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['foreach_as'],
      $position,
      $source,
    );
    $position += $as->getWidth();
    $key = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['foreach_key'],
      $position,
      $source,
    );
    $position += $key->getWidth();
    $arrow = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['foreach_arrow'],
      $position,
      $source,
    );
    $position += $arrow->getWidth();
    $value = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['foreach_value'],
      $position,
      $source,
    );
    $position += $value->getWidth();
    $right_paren = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['foreach_right_paren'],
      $position,
      $source,
    );
    $position += $right_paren->getWidth();
    $body = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['foreach_body'],
      $position,
      $source,
    );
    $position += $body->getWidth();
    return new self(
      $keyword,
      $left_paren,
      $collection,
      $await_keyword,
      $as,
      $key,
      $arrow,
      $value,
      $right_paren,
      $body,
    );
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'left_paren' => $this->_left_paren;
    yield 'collection' => $this->_collection;
    yield 'await_keyword' => $this->_await_keyword;
    yield 'as' => $this->_as;
    yield 'key' => $this->_key;
    yield 'arrow' => $this->_arrow;
    yield 'value' => $this->_value;
    yield 'right_paren' => $this->_right_paren;
    yield 'body' => $this->_body;
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $parents);
    $left_paren = $this->_left_paren->rewrite($rewriter, $parents);
    $collection = $this->_collection->rewrite($rewriter, $parents);
    $await_keyword = $this->_await_keyword->rewrite($rewriter, $parents);
    $as = $this->_as->rewrite($rewriter, $parents);
    $key = $this->_key->rewrite($rewriter, $parents);
    $arrow = $this->_arrow->rewrite($rewriter, $parents);
    $value = $this->_value->rewrite($rewriter, $parents);
    $right_paren = $this->_right_paren->rewrite($rewriter, $parents);
    $body = $this->_body->rewrite($rewriter, $parents);
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
    return new self(
      $keyword,
      $left_paren,
      $collection,
      $await_keyword,
      $as,
      $key,
      $arrow,
      $value,
      $right_paren,
      $body,
    );
  }

  public function getKeywordUNTYPED(): EditableSyntax {
    return $this->_keyword;
  }

  public function withKeyword(EditableSyntax $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new self(
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
    return !$this->_keyword->isMissing();
  }

  /**
   * @returns ForeachToken
   */
  public function getKeyword(): ForeachToken {
    return TypeAssert\instance_of(ForeachToken::class, $this->_keyword);
  }

  public function getLeftParenUNTYPED(): EditableSyntax {
    return $this->_left_paren;
  }

  public function withLeftParen(EditableSyntax $value): this {
    if ($value === $this->_left_paren) {
      return $this;
    }
    return new self(
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
    return !$this->_left_paren->isMissing();
  }

  /**
   * @returns LeftParenToken
   */
  public function getLeftParen(): LeftParenToken {
    return TypeAssert\instance_of(LeftParenToken::class, $this->_left_paren);
  }

  public function getCollectionUNTYPED(): EditableSyntax {
    return $this->_collection;
  }

  public function withCollection(EditableSyntax $value): this {
    if ($value === $this->_collection) {
      return $this;
    }
    return new self(
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
    return !$this->_collection->isMissing();
  }

  /**
   * @returns MemberSelectionExpression | VariableExpression |
   * ArrayIntrinsicExpression | FunctionCallExpression |
   * ArrayCreationExpression | SubscriptExpression | PrefixUnaryExpression |
   * CollectionLiteralExpression | ObjectCreationExpression |
   * ScopeResolutionExpression | ParenthesizedExpression | CastExpression |
   * AnonymousFunction
   */
  public function getCollection(): EditableSyntax {
    return TypeAssert\instance_of(EditableSyntax::class, $this->_collection);
  }

  public function getAwaitKeywordUNTYPED(): EditableSyntax {
    return $this->_await_keyword;
  }

  public function withAwaitKeyword(EditableSyntax $value): this {
    if ($value === $this->_await_keyword) {
      return $this;
    }
    return new self(
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
    return !$this->_await_keyword->isMissing();
  }

  /**
   * @returns Missing | AwaitToken
   */
  public function getAwaitKeyword(): ?AwaitToken {
    if ($this->_await_keyword->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(AwaitToken::class, $this->_await_keyword);
  }

  /**
   * @returns AwaitToken
   */
  public function getAwaitKeywordx(): AwaitToken {
    return TypeAssert\instance_of(AwaitToken::class, $this->_await_keyword);
  }

  public function getAsUNTYPED(): EditableSyntax {
    return $this->_as;
  }

  public function withAs(EditableSyntax $value): this {
    if ($value === $this->_as) {
      return $this;
    }
    return new self(
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
    return !$this->_as->isMissing();
  }

  /**
   * @returns AsToken
   */
  public function getAs(): AsToken {
    return TypeAssert\instance_of(AsToken::class, $this->_as);
  }

  public function getKeyUNTYPED(): EditableSyntax {
    return $this->_key;
  }

  public function withKey(EditableSyntax $value): this {
    if ($value === $this->_key) {
      return $this;
    }
    return new self(
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
    return !$this->_key->isMissing();
  }

  /**
   * @returns Missing | VariableExpression | ListExpression |
   * PrefixUnaryExpression | SubscriptExpression | MemberSelectionExpression |
   * ScopeResolutionExpression | FunctionCallExpression
   */
  public function getKey(): EditableSyntax {
    return TypeAssert\instance_of(EditableSyntax::class, $this->_key);
  }

  public function getArrowUNTYPED(): EditableSyntax {
    return $this->_arrow;
  }

  public function withArrow(EditableSyntax $value): this {
    if ($value === $this->_arrow) {
      return $this;
    }
    return new self(
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
    return !$this->_arrow->isMissing();
  }

  /**
   * @returns Missing | EqualGreaterThanToken
   */
  public function getArrow(): ?EqualGreaterThanToken {
    if ($this->_arrow->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EqualGreaterThanToken::class, $this->_arrow);
  }

  /**
   * @returns EqualGreaterThanToken
   */
  public function getArrowx(): EqualGreaterThanToken {
    return TypeAssert\instance_of(EqualGreaterThanToken::class, $this->_arrow);
  }

  public function getValueUNTYPED(): EditableSyntax {
    return $this->_value;
  }

  public function withValue(EditableSyntax $value): this {
    if ($value === $this->_value) {
      return $this;
    }
    return new self(
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
    return !$this->_value->isMissing();
  }

  /**
   * @returns PrefixUnaryExpression | VariableExpression | ListExpression |
   * FunctionCallExpression | SubscriptExpression | MemberSelectionExpression |
   * ScopeResolutionExpression
   */
  public function getValue(): EditableSyntax {
    return TypeAssert\instance_of(EditableSyntax::class, $this->_value);
  }

  public function getRightParenUNTYPED(): EditableSyntax {
    return $this->_right_paren;
  }

  public function withRightParen(EditableSyntax $value): this {
    if ($value === $this->_right_paren) {
      return $this;
    }
    return new self(
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
    return !$this->_right_paren->isMissing();
  }

  /**
   * @returns RightParenToken
   */
  public function getRightParen(): RightParenToken {
    return TypeAssert\instance_of(RightParenToken::class, $this->_right_paren);
  }

  public function getBodyUNTYPED(): EditableSyntax {
    return $this->_body;
  }

  public function withBody(EditableSyntax $value): this {
    if ($value === $this->_body) {
      return $this;
    }
    return new self(
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
    return !$this->_body->isMissing();
  }

  /**
   * @returns CompoundStatement | ForeachStatement | ExpressionStatement |
   * EchoStatement
   */
  public function getBody(): EditableSyntax {
    return TypeAssert\instance_of(EditableSyntax::class, $this->_body);
  }
}
