/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<635f25e7cd5a9979094e2b43d189f215>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class LambdaExpression extends EditableNode implements IExpression {

  private EditableNode $_attribute_spec;
  private EditableNode $_async;
  private EditableNode $_coroutine;
  private EditableNode $_signature;
  private EditableNode $_arrow;
  private EditableNode $_body;

  public function __construct(
    EditableNode $attribute_spec,
    EditableNode $async,
    EditableNode $coroutine,
    EditableNode $signature,
    EditableNode $arrow,
    EditableNode $body,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_attribute_spec = $attribute_spec;
    $this->_async = $async;
    $this->_coroutine = $coroutine;
    $this->_signature = $signature;
    $this->_arrow = $arrow;
    $this->_body = $body;
    parent::__construct('lambda_expression', $source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
  ): this {
    $offset = $initial_offset;
    $attribute_spec = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['lambda_attribute_spec'],
      $file,
      $offset,
      $source,
    );
    $offset += $attribute_spec->getWidth();
    $async = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['lambda_async'],
      $file,
      $offset,
      $source,
    );
    $offset += $async->getWidth();
    $coroutine = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['lambda_coroutine'],
      $file,
      $offset,
      $source,
    );
    $offset += $coroutine->getWidth();
    $signature = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['lambda_signature'],
      $file,
      $offset,
      $source,
    );
    $offset += $signature->getWidth();
    $arrow = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['lambda_arrow'],
      $file,
      $offset,
      $source,
    );
    $offset += $arrow->getWidth();
    $body = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['lambda_body'],
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
      $attribute_spec,
      $async,
      $coroutine,
      $signature,
      $arrow,
      $body,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'attribute_spec' => $this->_attribute_spec,
      'async' => $this->_async,
      'coroutine' => $this->_coroutine,
      'signature' => $this->_signature,
      'arrow' => $this->_arrow,
      'body' => $this->_body,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<EditableNode> $parents = vec[],
  ): this {
    $parents[] = $this;
    $attribute_spec = $rewriter($this->_attribute_spec, $parents);
    $async = $rewriter($this->_async, $parents);
    $coroutine = $rewriter($this->_coroutine, $parents);
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
      $attribute_spec,
      $async,
      $coroutine,
      $signature,
      $arrow,
      $body,
    );
  }

  public function getAttributeSpecUNTYPED(): EditableNode {
    return $this->_attribute_spec;
  }

  public function withAttributeSpec(EditableNode $value): this {
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
    return !$this->_attribute_spec->isMissing();
  }

  /**
   * @return AttributeSpecification | null
   */
  public function getAttributeSpec(): ?AttributeSpecification {
    if ($this->_attribute_spec->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(
      AttributeSpecification::class,
      $this->_attribute_spec,
    );
  }

  /**
   * @return AttributeSpecification
   */
  public function getAttributeSpecx(): AttributeSpecification {
    return TypeAssert\not_null($this->getAttributeSpec());
  }

  public function getAsyncUNTYPED(): EditableNode {
    return $this->_async;
  }

  public function withAsync(EditableNode $value): this {
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
    return !$this->_async->isMissing();
  }

  /**
   * @return null | AsyncToken
   */
  public function getAsync(): ?AsyncToken {
    if ($this->_async->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(AsyncToken::class, $this->_async);
  }

  /**
   * @return AsyncToken
   */
  public function getAsyncx(): AsyncToken {
    return TypeAssert\not_null($this->getAsync());
  }

  public function getCoroutineUNTYPED(): EditableNode {
    return $this->_coroutine;
  }

  public function withCoroutine(EditableNode $value): this {
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
    return !$this->_coroutine->isMissing();
  }

  /**
   * @return null
   */
  public function getCoroutine(): ?EditableNode {
    if ($this->_coroutine->isMissing()) {
      return null;
    }
    return $this->_coroutine;
  }

  /**
   * @return
   */
  public function getCoroutinex(): EditableNode {
    return TypeAssert\not_null($this->getCoroutine());
  }

  public function getSignatureUNTYPED(): EditableNode {
    return $this->_signature;
  }

  public function withSignature(EditableNode $value): this {
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
    return !$this->_signature->isMissing();
  }

  /**
   * @return LambdaSignature | VariableToken
   */
  public function getSignature(): EditableNode {
    return $this->_signature;
  }

  /**
   * @return LambdaSignature | VariableToken
   */
  public function getSignaturex(): EditableNode {
    return $this->getSignature();
  }

  public function getArrowUNTYPED(): EditableNode {
    return $this->_arrow;
  }

  public function withArrow(EditableNode $value): this {
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
    return !$this->_arrow->isMissing();
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

  public function getBodyUNTYPED(): EditableNode {
    return $this->_body;
  }

  public function withBody(EditableNode $value): this {
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
    return !$this->_body->isMissing();
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
  public function getBody(): EditableNode {
    return $this->_body;
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
  public function getBodyx(): EditableNode {
    return $this->getBody();
  }
}
