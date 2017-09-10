<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<51e1251744a0ebb036e3189a1a718c70>>
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

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $async = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['lambda_async'],
      $position,
      $source,
    );
    $position += $async->width();
    $coroutine = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['lambda_coroutine'],
      $position,
      $source,
    );
    $position += $coroutine->width();
    $signature = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['lambda_signature'],
      $position,
      $source,
    );
    $position += $signature->width();
    $arrow = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['lambda_arrow'],
      $position,
      $source,
    );
    $position += $arrow->width();
    $body = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['lambda_body'],
      $position,
      $source,
    );
    $position += $body->width();
    return new self($async, $coroutine, $signature, $arrow, $body);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'async' => $this->_async;
    yield 'coroutine' => $this->_coroutine;
    yield 'signature' => $this->_signature;
    yield 'arrow' => $this->_arrow;
    yield 'body' => $this->_body;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $async = $this->_async->rewrite($rewriter, $child_parents);
    $coroutine = $this->_coroutine->rewrite($rewriter, $child_parents);
    $signature = $this->_signature->rewrite($rewriter, $child_parents);
    $arrow = $this->_arrow->rewrite($rewriter, $child_parents);
    $body = $this->_body->rewrite($rewriter, $child_parents);
    if (
      $async === $this->_async &&
      $coroutine === $this->_coroutine &&
      $signature === $this->_signature &&
      $arrow === $this->_arrow &&
      $body === $this->_body
    ) {
      $node = $this;
    } else {
      $node = new self($async, $coroutine, $signature, $arrow, $body);
    }
    return $rewriter($node, $parents);
  }

  public function async(): ?AsyncToken {
    return $this->_async->is_missing()
      ? null
      : TypeAssert::isInstanceOf(AsyncToken::class, $this->_async);
  }

  public function asyncx(): AsyncToken {
    return TypeAssert::isInstanceOf(AsyncToken::class, $this->_async);
  }

  public function raw_async(): EditableSyntax {
    return $this->_async;
  }

  public function with_async(EditableSyntax $value): this {
    return new self(
      $value,
      $this->_coroutine,
      $this->_signature,
      $this->_arrow,
      $this->_body,
    );
  }

  public function coroutine(): EditableSyntax {
    return $this->coroutinex();
  }

  public function coroutinex(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_coroutine);
  }

  public function raw_coroutine(): EditableSyntax {
    return $this->_coroutine;
  }

  public function with_coroutine(EditableSyntax $value): this {
    return new self(
      $this->_async,
      $value,
      $this->_signature,
      $this->_arrow,
      $this->_body,
    );
  }

  public function signature(): EditableSyntax {
    return $this->signaturex();
  }

  public function signaturex(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_signature);
  }

  public function raw_signature(): EditableSyntax {
    return $this->_signature;
  }

  public function with_signature(EditableSyntax $value): this {
    return new self(
      $this->_async,
      $this->_coroutine,
      $value,
      $this->_arrow,
      $this->_body,
    );
  }

  public function arrow(): ?EqualEqualGreaterThanToken {
    return $this->_arrow->is_missing()
      ? null
      : TypeAssert::isInstanceOf(
          EqualEqualGreaterThanToken::class,
          $this->_arrow,
        );
  }

  public function arrowx(): EqualEqualGreaterThanToken {
    return TypeAssert::isInstanceOf(
      EqualEqualGreaterThanToken::class,
      $this->_arrow,
    );
  }

  public function raw_arrow(): EditableSyntax {
    return $this->_arrow;
  }

  public function with_arrow(EditableSyntax $value): this {
    return new self(
      $this->_async,
      $this->_coroutine,
      $this->_signature,
      $value,
      $this->_body,
    );
  }

  public function body(): EditableSyntax {
    return $this->bodyx();
  }

  public function bodyx(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_body);
  }

  public function raw_body(): EditableSyntax {
    return $this->_body;
  }

  public function with_body(EditableSyntax $value): this {
    return new self(
      $this->_async,
      $this->_coroutine,
      $this->_signature,
      $this->_arrow,
      $value,
    );
  }
}
