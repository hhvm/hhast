/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<f037d6d02614ed38bb10eac0babbb14e>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class LambdaExpression
  extends Node
  implements IHasFunctionBody, ILambdaBody, IHasAttributeSpec, IExpression {

  const string SYNTAX_KIND = 'lambda_expression';

  private ?AttributeSpecification $_attribute_spec;
  private ?AsyncToken $_async;
  private ?Node $_coroutine;
  private Node $_signature;
  private EqualEqualGreaterThanToken $_arrow;
  private ILambdaBody $_body;

  public function __construct(
    ?AttributeSpecification $attribute_spec,
    ?AsyncToken $async,
    ?Node $coroutine,
    Node $signature,
    EqualEqualGreaterThanToken $arrow,
    ILambdaBody $body,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_attribute_spec = $attribute_spec;
    $this->_async = $async;
    $this->_coroutine = $coroutine;
    $this->_signature = $signature;
    $this->_arrow = $arrow;
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
    $attribute_spec = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['lambda_attribute_spec'],
      $file,
      $offset,
      $source,
      'AttributeSpecification',
    );
    $offset += $attribute_spec?->getWidth() ?? 0;
    $async = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['lambda_async'],
      $file,
      $offset,
      $source,
      'AsyncToken',
    );
    $offset += $async?->getWidth() ?? 0;
    $coroutine = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['lambda_coroutine'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $coroutine?->getWidth() ?? 0;
    $signature = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['lambda_signature'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $signature = $signature as nonnull;
    $offset += $signature->getWidth();
    $arrow = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['lambda_arrow'],
      $file,
      $offset,
      $source,
      'EqualEqualGreaterThanToken',
    );
    $arrow = $arrow as nonnull;
    $offset += $arrow->getWidth();
    $body = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['lambda_body'],
      $file,
      $offset,
      $source,
      'ILambdaBody',
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
      /* HH_IGNORE_ERROR[4110] */ $attribute_spec,
      /* HH_IGNORE_ERROR[4110] */ $async,
      /* HH_IGNORE_ERROR[4110] */ $coroutine,
      /* HH_IGNORE_ERROR[4110] */ $signature,
      /* HH_IGNORE_ERROR[4110] */ $arrow,
      /* HH_IGNORE_ERROR[4110] */ $body,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'attribute_spec' => $this->_attribute_spec,
      'async' => $this->_async,
      'coroutine' => $this->_coroutine,
      'signature' => $this->_signature,
      'arrow' => $this->_arrow,
      'body' => $this->_body,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $attribute_spec = $this->_attribute_spec === null
      ? null
      : $rewriter($this->_attribute_spec, $parents);
    $async = $this->_async === null ? null : $rewriter($this->_async, $parents);
    $coroutine = $this->_coroutine === null
      ? null
      : $rewriter($this->_coroutine, $parents);
    $signature = $rewriter($this->_signature, $parents);
    $arrow = $rewriter($this->_arrow, $parents);
    $body = $rewriter($this->_body, $parents);
    if (
      $attribute_spec === $this->_attribute_spec &&
      $async === $this->_async &&
      $coroutine === $this->_coroutine &&
      $signature === $this->_signature &&
      $arrow === $this->_arrow &&
      $body === $this->_body
    ) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $attribute_spec,
      /* HH_FIXME[4110] use `as` */ $async,
      /* HH_FIXME[4110] use `as` */ $coroutine,
      /* HH_FIXME[4110] use `as` */ $signature,
      /* HH_FIXME[4110] use `as` */ $arrow,
      /* HH_FIXME[4110] use `as` */ $body,
    );
  }

  public function getAttributeSpecUNTYPED(): ?Node {
    return $this->_attribute_spec;
  }

  public function withAttributeSpec(?AttributeSpecification $value): this {
    if ($value === $this->_attribute_spec) {
      return $this;
    }
    return new static(
      $value,
      $this->_async,
      $this->_coroutine,
      $this->_signature,
      $this->_arrow,
      $this->_body,
    );
  }

  public function hasAttributeSpec(): bool {
    return $this->_attribute_spec !== null;
  }

  /**
   * @return AttributeSpecification | null
   */
  public function getAttributeSpec(): ?AttributeSpecification {
    return $this->_attribute_spec;
  }

  /**
   * @return AttributeSpecification
   */
  public function getAttributeSpecx(): AttributeSpecification {
    return TypeAssert\not_null($this->getAttributeSpec());
  }

  public function getAsyncUNTYPED(): ?Node {
    return $this->_async;
  }

  public function withAsync(?AsyncToken $value): this {
    if ($value === $this->_async) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $value,
      $this->_coroutine,
      $this->_signature,
      $this->_arrow,
      $this->_body,
    );
  }

  public function hasAsync(): bool {
    return $this->_async !== null;
  }

  /**
   * @return null | AsyncToken
   */
  public function getAsync(): ?AsyncToken {
    return $this->_async;
  }

  /**
   * @return AsyncToken
   */
  public function getAsyncx(): AsyncToken {
    return TypeAssert\not_null($this->getAsync());
  }

  public function getCoroutineUNTYPED(): ?Node {
    return $this->_coroutine;
  }

  public function withCoroutine(?Node $value): this {
    if ($value === $this->_coroutine) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_async,
      $value,
      $this->_signature,
      $this->_arrow,
      $this->_body,
    );
  }

  public function hasCoroutine(): bool {
    return $this->_coroutine !== null;
  }

  /**
   * @return null
   */
  public function getCoroutine(): ?Node {
    return $this->_coroutine;
  }

  /**
   * @return
   */
  public function getCoroutinex(): Node {
    return TypeAssert\not_null($this->getCoroutine());
  }

  public function getSignatureUNTYPED(): ?Node {
    return $this->_signature;
  }

  public function withSignature(Node $value): this {
    if ($value === $this->_signature) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_async,
      $this->_coroutine,
      $value,
      $this->_arrow,
      $this->_body,
    );
  }

  public function hasSignature(): bool {
    return $this->_signature !== null;
  }

  /**
   * @return LambdaSignature | VariableToken
   */
  public function getSignature(): Node {
    return $this->_signature;
  }

  /**
   * @return LambdaSignature | VariableToken
   */
  public function getSignaturex(): Node {
    return $this->getSignature();
  }

  public function getArrowUNTYPED(): ?Node {
    return $this->_arrow;
  }

  public function withArrow(EqualEqualGreaterThanToken $value): this {
    if ($value === $this->_arrow) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_async,
      $this->_coroutine,
      $this->_signature,
      $value,
      $this->_body,
    );
  }

  public function hasArrow(): bool {
    return $this->_arrow !== null;
  }

  /**
   * @return EqualEqualGreaterThanToken
   */
  public function getArrow(): EqualEqualGreaterThanToken {
    return TypeAssert\instance_of(
      EqualEqualGreaterThanToken::class,
      $this->_arrow,
    );
  }

  /**
   * @return EqualEqualGreaterThanToken
   */
  public function getArrowx(): EqualEqualGreaterThanToken {
    return $this->getArrow();
  }

  public function getBodyUNTYPED(): ?Node {
    return $this->_body;
  }

  public function withBody(ILambdaBody $value): this {
    if ($value === $this->_body) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_async,
      $this->_coroutine,
      $this->_signature,
      $this->_arrow,
      $value,
    );
  }

  public function hasBody(): bool {
    return $this->_body !== null;
  }

  /**
   * @return AnonymousFunction | ArrayIntrinsicExpression | AsExpression |
   * BinaryExpression | CastExpression | CollectionLiteralExpression |
   * CompoundStatement | ConditionalExpression | FunctionCallExpression |
   * IsExpression | KeysetIntrinsicExpression | LambdaExpression |
   * LiteralExpression | MemberSelectionExpression | NullableAsExpression |
   * ObjectCreationExpression | ParenthesizedExpression | PrefixUnaryExpression
   * | SubscriptExpression | VariableExpression
   */
  public function getBody(): ILambdaBody {
    return TypeAssert\instance_of(ILambdaBody::class, $this->_body);
  }

  /**
   * @return AnonymousFunction | ArrayIntrinsicExpression | AsExpression |
   * BinaryExpression | CastExpression | CollectionLiteralExpression |
   * CompoundStatement | ConditionalExpression | FunctionCallExpression |
   * IsExpression | KeysetIntrinsicExpression | LambdaExpression |
   * LiteralExpression | MemberSelectionExpression | NullableAsExpression |
   * ObjectCreationExpression | ParenthesizedExpression | PrefixUnaryExpression
   * | SubscriptExpression | VariableExpression
   */
  public function getBodyx(): ILambdaBody {
    return $this->getBody();
  }
}
