<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<7c3e569ad899704cf3f92efeade46585>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class LambdaExpression extends EditableSyntax {

  private EditableSyntax $_async;
  private EditableSyntax $_coroutine;
  private EditableSyntax $_signature;
  private EditableSyntax $_arrow;
  private EditableSyntax $_body;

  public function __construct(
    EditableSyntax $async,
    EditableSyntax $coroutine,
    EditableSyntax $signature,
    EditableSyntax $arrow,
    EditableSyntax $body,
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
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $async = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['lambda_async'],
      $position,
      $source,
    );
    $position += $async->getWidth();
    $coroutine = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['lambda_coroutine'],
      $position,
      $source,
    );
    $position += $coroutine->getWidth();
    $signature = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['lambda_signature'],
      $position,
      $source,
    );
    $position += $signature->getWidth();
    $arrow = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['lambda_arrow'],
      $position,
      $source,
    );
    $position += $arrow->getWidth();
    $body = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['lambda_body'],
      $position,
      $source,
    );
    $position += $body->getWidth();
    return new self($async, $coroutine, $signature, $arrow, $body);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'async' => $this->_async;
    yield 'coroutine' => $this->_coroutine;
    yield 'signature' => $this->_signature;
    yield 'arrow' => $this->_arrow;
    yield 'body' => $this->_body;
  }

  <<__Override>>
  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
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

  public function getAsyncUNTYPED(): EditableSyntax {
    return $this->_async;
  }

  public function withAsync(EditableSyntax $value): this {
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

  public function getAsync(): ?AsyncToken {
    if ($this->_async->isMissing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(AsyncToken::class, $this->_async);
  }

  public function getAsyncx(): AsyncToken {
    return TypeAssert::isInstanceOf(AsyncToken::class, $this->_async);
  }

  public function getCoroutineUNTYPED(): EditableSyntax {
    return $this->_coroutine;
  }

  public function withCoroutine(EditableSyntax $value): this {
    if ($value === $this->_coroutine) {
      return $this;
    }
    return new self($this->_async, $value, $this->_signature, $this->_arrow, $this->_body);
  }

  public function hasCoroutine(): bool {
    return !$this->_coroutine->isMissing();
  }

  public function getCoroutine(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_coroutine);
  }

  public function getSignatureUNTYPED(): EditableSyntax {
    return $this->_signature;
  }

  public function withSignature(EditableSyntax $value): this {
    if ($value === $this->_signature) {
      return $this;
    }
    return new self($this->_async, $this->_coroutine, $value, $this->_arrow, $this->_body);
  }

  public function hasSignature(): bool {
    return !$this->_signature->isMissing();
  }

  public function getSignature(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_signature);
  }

  public function getArrowUNTYPED(): EditableSyntax {
    return $this->_arrow;
  }

  public function withArrow(EditableSyntax $value): this {
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

  public function getArrow(): ?EqualEqualGreaterThanToken {
    if ($this->_arrow->isMissing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(EqualEqualGreaterThanToken::class, $this->_arrow);
  }

  public function getArrowx(): EqualEqualGreaterThanToken {
    return TypeAssert::isInstanceOf(EqualEqualGreaterThanToken::class, $this->_arrow);
  }

  public function getBodyUNTYPED(): EditableSyntax {
    return $this->_body;
  }

  public function withBody(EditableSyntax $value): this {
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

  public function getBody(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_body);
  }
}
