<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<fec01f5dbd9b5261b760695a597355aa>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class LambdaExpression extends EditableNode {

  private EditableNode $_async;
  private EditableNode $_coroutine;
  private EditableNode $_signature;
  private EditableNode $_arrow;
  private EditableNode $_body;

  public function __construct(
    EditableNode $async,
    EditableNode $coroutine,
    EditableNode $signature,
    EditableNode $arrow,
    EditableNode $body,
  ) {
    parent::__construct('lambda_expression');
    $this->_async = $async;
    $this->_coroutine = $coroutine;
    $this->_signature = $signature;
    $this->_arrow = $arrow;
    $this->_body = $body;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
  ): this {
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
    return new self($async, $coroutine, $signature, $arrow, $body);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'async' => $this->_async,
      'coroutine' => $this->_coroutine,
      'signature' => $this->_signature,
      'arrow' => $this->_arrow,
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
    $async = $this->_async->rewrite($rewriter, $parents);
    $coroutine = $this->_coroutine->rewrite($rewriter, $parents);
    $signature = $this->_signature->rewrite($rewriter, $parents);
    $arrow = $this->_arrow->rewrite($rewriter, $parents);
    $body = $this->_body->rewrite($rewriter, $parents);
    if (
      $async === $this->_async &&
      $coroutine === $this->_coroutine &&
      $signature === $this->_signature &&
      $arrow === $this->_arrow &&
      $body === $this->_body
    ) {
      return $this;
    }
    return new self($async, $coroutine, $signature, $arrow, $body);
  }

  public function getAsyncUNTYPED(): EditableNode {
    return $this->_async;
  }

  public function withAsync(EditableNode $value): this {
    if ($value === $this->_async) {
      return $this;
    }
    return new self(
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
   * @returns Missing | AsyncToken
   */
  public function getAsync(): ?AsyncToken {
    if ($this->_async->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(AsyncToken::class, $this->_async);
  }

  /**
   * @returns AsyncToken
   */
  public function getAsyncx(): AsyncToken {
    return TypeAssert\instance_of(AsyncToken::class, $this->_async);
  }

  public function getCoroutineUNTYPED(): EditableNode {
    return $this->_coroutine;
  }

  public function withCoroutine(EditableNode $value): this {
    if ($value === $this->_coroutine) {
      return $this;
    }
    return new self(
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
   * @returns Missing
   */
  public function getCoroutine(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_coroutine);
  }

  public function getSignatureUNTYPED(): EditableNode {
    return $this->_signature;
  }

  public function withSignature(EditableNode $value): this {
    if ($value === $this->_signature) {
      return $this;
    }
    return new self(
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
   * @returns VariableToken | LambdaSignature
   */
  public function getSignature(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_signature);
  }

  public function getArrowUNTYPED(): EditableNode {
    return $this->_arrow;
  }

  public function withArrow(EditableNode $value): this {
    if ($value === $this->_arrow) {
      return $this;
    }
    return new self(
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
   * @returns EqualEqualGreaterThanToken | Missing
   */
  public function getArrow(): ?EqualEqualGreaterThanToken {
    if ($this->_arrow->isMissing()) {
      return null;
    }
    return
      TypeAssert\instance_of(EqualEqualGreaterThanToken::class, $this->_arrow);
  }

  /**
   * @returns EqualEqualGreaterThanToken
   */
  public function getArrowx(): EqualEqualGreaterThanToken {
    return
      TypeAssert\instance_of(EqualEqualGreaterThanToken::class, $this->_arrow);
  }

  public function getBodyUNTYPED(): EditableNode {
    return $this->_body;
  }

  public function withBody(EditableNode $value): this {
    if ($value === $this->_body) {
      return $this;
    }
    return new self(
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
   * @returns FunctionCallExpression | CompoundStatement |
   * MemberSelectionExpression | VariableExpression | BinaryExpression |
   * PrefixUnaryExpression | LambdaExpression | LiteralExpression |
   * ConditionalExpression | SubscriptExpression | CastExpression |
   * ParenthesizedExpression | ArrayIntrinsicExpression |
   * ObjectCreationExpression | Missing | TupleExpression
   */
  public function getBody(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_body);
  }
}
