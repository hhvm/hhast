<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<164f08af6635dac0845800449e0d853e>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class AnonymousFunction extends EditableSyntax {

  private EditableSyntax $_static_keyword;
  private EditableSyntax $_async_keyword;
  private EditableSyntax $_coroutine_keyword;
  private EditableSyntax $_function_keyword;
  private EditableSyntax $_left_paren;
  private EditableSyntax $_parameters;
  private EditableSyntax $_right_paren;
  private EditableSyntax $_colon;
  private EditableSyntax $_type;
  private EditableSyntax $_use;
  private EditableSyntax $_body;

  public function __construct(
    EditableSyntax $static_keyword,
    EditableSyntax $async_keyword,
    EditableSyntax $coroutine_keyword,
    EditableSyntax $function_keyword,
    EditableSyntax $left_paren,
    EditableSyntax $parameters,
    EditableSyntax $right_paren,
    EditableSyntax $colon,
    EditableSyntax $type,
    EditableSyntax $use,
    EditableSyntax $body,
  ) {
    parent::__construct('anonymous_function');
    $this->_static_keyword = $static_keyword;
    $this->_async_keyword = $async_keyword;
    $this->_coroutine_keyword = $coroutine_keyword;
    $this->_function_keyword = $function_keyword;
    $this->_left_paren = $left_paren;
    $this->_parameters = $parameters;
    $this->_right_paren = $right_paren;
    $this->_colon = $colon;
    $this->_type = $type;
    $this->_use = $use;
    $this->_body = $body;
  }

  <<__Override>>
  public static function fromJSON(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $static_keyword = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['anonymous_static_keyword'],
      $position,
      $source,
    );
    $position += $static_keyword->getWidth();
    $async_keyword = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['anonymous_async_keyword'],
      $position,
      $source,
    );
    $position += $async_keyword->getWidth();
    $coroutine_keyword = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['anonymous_coroutine_keyword'],
      $position,
      $source,
    );
    $position += $coroutine_keyword->getWidth();
    $function_keyword = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['anonymous_function_keyword'],
      $position,
      $source,
    );
    $position += $function_keyword->getWidth();
    $left_paren = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['anonymous_left_paren'],
      $position,
      $source,
    );
    $position += $left_paren->getWidth();
    $parameters = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['anonymous_parameters'],
      $position,
      $source,
    );
    $position += $parameters->getWidth();
    $right_paren = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['anonymous_right_paren'],
      $position,
      $source,
    );
    $position += $right_paren->getWidth();
    $colon = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['anonymous_colon'],
      $position,
      $source,
    );
    $position += $colon->getWidth();
    $type = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['anonymous_type'],
      $position,
      $source,
    );
    $position += $type->getWidth();
    $use = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['anonymous_use'],
      $position,
      $source,
    );
    $position += $use->getWidth();
    $body = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['anonymous_body'],
      $position,
      $source,
    );
    $position += $body->getWidth();
    return new self(
      $static_keyword,
      $async_keyword,
      $coroutine_keyword,
      $function_keyword,
      $left_paren,
      $parameters,
      $right_paren,
      $colon,
      $type,
      $use,
      $body,
    );
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'static_keyword' => $this->_static_keyword;
    yield 'async_keyword' => $this->_async_keyword;
    yield 'coroutine_keyword' => $this->_coroutine_keyword;
    yield 'function_keyword' => $this->_function_keyword;
    yield 'left_paren' => $this->_left_paren;
    yield 'parameters' => $this->_parameters;
    yield 'right_paren' => $this->_right_paren;
    yield 'colon' => $this->_colon;
    yield 'type' => $this->_type;
    yield 'use' => $this->_use;
    yield 'body' => $this->_body;
  }

  <<__Override>>
  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $static_keyword = $this->_static_keyword->rewrite($rewriter, $parents);
    $async_keyword = $this->_async_keyword->rewrite($rewriter, $parents);
    $coroutine_keyword = $this->_coroutine_keyword->rewrite($rewriter, $parents);
    $function_keyword = $this->_function_keyword->rewrite($rewriter, $parents);
    $left_paren = $this->_left_paren->rewrite($rewriter, $parents);
    $parameters = $this->_parameters->rewrite($rewriter, $parents);
    $right_paren = $this->_right_paren->rewrite($rewriter, $parents);
    $colon = $this->_colon->rewrite($rewriter, $parents);
    $type = $this->_type->rewrite($rewriter, $parents);
    $use = $this->_use->rewrite($rewriter, $parents);
    $body = $this->_body->rewrite($rewriter, $parents);
    if (
      $static_keyword === $this->_static_keyword &&
      $async_keyword === $this->_async_keyword &&
      $coroutine_keyword === $this->_coroutine_keyword &&
      $function_keyword === $this->_function_keyword &&
      $left_paren === $this->_left_paren &&
      $parameters === $this->_parameters &&
      $right_paren === $this->_right_paren &&
      $colon === $this->_colon &&
      $type === $this->_type &&
      $use === $this->_use &&
      $body === $this->_body
    ) {
      return $this;
    }
    return new self(
      $static_keyword,
      $async_keyword,
      $coroutine_keyword,
      $function_keyword,
      $left_paren,
      $parameters,
      $right_paren,
      $colon,
      $type,
      $use,
      $body,
    );
  }

  public function getStaticKeywordUNTYPED(): EditableSyntax {
    return $this->_static_keyword;
  }

  public function withStaticKeyword(EditableSyntax $value): this {
    if ($value === $this->_static_keyword) {
      return $this;
    }
    return new self(
      $value,
      $this->_async_keyword,
      $this->_coroutine_keyword,
      $this->_function_keyword,
      $this->_left_paren,
      $this->_parameters,
      $this->_right_paren,
      $this->_colon,
      $this->_type,
      $this->_use,
      $this->_body,
    );
  }

  public function hasStaticKeyword(): bool {
    return !$this->_static_keyword->isMissing();
  }

  public function getStaticKeyword(): ?StaticToken {
    if ($this->_static_keyword->isMissing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(StaticToken::class, $this->_static_keyword);
  }

  public function getStaticKeywordx(): StaticToken {
    return TypeAssert::isInstanceOf(StaticToken::class, $this->_static_keyword);
  }

  public function getAsyncKeywordUNTYPED(): EditableSyntax {
    return $this->_async_keyword;
  }

  public function withAsyncKeyword(EditableSyntax $value): this {
    if ($value === $this->_async_keyword) {
      return $this;
    }
    return new self(
      $this->_static_keyword,
      $value,
      $this->_coroutine_keyword,
      $this->_function_keyword,
      $this->_left_paren,
      $this->_parameters,
      $this->_right_paren,
      $this->_colon,
      $this->_type,
      $this->_use,
      $this->_body,
    );
  }

  public function hasAsyncKeyword(): bool {
    return !$this->_async_keyword->isMissing();
  }

  public function getAsyncKeyword(): ?AsyncToken {
    if ($this->_async_keyword->isMissing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(AsyncToken::class, $this->_async_keyword);
  }

  public function getAsyncKeywordx(): AsyncToken {
    return TypeAssert::isInstanceOf(AsyncToken::class, $this->_async_keyword);
  }

  public function getCoroutineKeywordUNTYPED(): EditableSyntax {
    return $this->_coroutine_keyword;
  }

  public function withCoroutineKeyword(EditableSyntax $value): this {
    if ($value === $this->_coroutine_keyword) {
      return $this;
    }
    return new self(
      $this->_static_keyword,
      $this->_async_keyword,
      $value,
      $this->_function_keyword,
      $this->_left_paren,
      $this->_parameters,
      $this->_right_paren,
      $this->_colon,
      $this->_type,
      $this->_use,
      $this->_body,
    );
  }

  public function hasCoroutineKeyword(): bool {
    return !$this->_coroutine_keyword->isMissing();
  }

  public function getCoroutineKeyword(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_coroutine_keyword);
  }

  public function getFunctionKeywordUNTYPED(): EditableSyntax {
    return $this->_function_keyword;
  }

  public function withFunctionKeyword(EditableSyntax $value): this {
    if ($value === $this->_function_keyword) {
      return $this;
    }
    return new self(
      $this->_static_keyword,
      $this->_async_keyword,
      $this->_coroutine_keyword,
      $value,
      $this->_left_paren,
      $this->_parameters,
      $this->_right_paren,
      $this->_colon,
      $this->_type,
      $this->_use,
      $this->_body,
    );
  }

  public function hasFunctionKeyword(): bool {
    return !$this->_function_keyword->isMissing();
  }

  public function getFunctionKeyword(): FunctionToken {
    return TypeAssert::isInstanceOf(FunctionToken::class, $this->_function_keyword);
  }

  public function getLeftParenUNTYPED(): EditableSyntax {
    return $this->_left_paren;
  }

  public function withLeftParen(EditableSyntax $value): this {
    if ($value === $this->_left_paren) {
      return $this;
    }
    return new self(
      $this->_static_keyword,
      $this->_async_keyword,
      $this->_coroutine_keyword,
      $this->_function_keyword,
      $value,
      $this->_parameters,
      $this->_right_paren,
      $this->_colon,
      $this->_type,
      $this->_use,
      $this->_body,
    );
  }

  public function hasLeftParen(): bool {
    return !$this->_left_paren->isMissing();
  }

  public function getLeftParen(): ?LeftParenToken {
    if ($this->_left_paren->isMissing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(LeftParenToken::class, $this->_left_paren);
  }

  public function getLeftParenx(): LeftParenToken {
    return TypeAssert::isInstanceOf(LeftParenToken::class, $this->_left_paren);
  }

  public function getParametersUNTYPED(): EditableSyntax {
    return $this->_parameters;
  }

  public function withParameters(EditableSyntax $value): this {
    if ($value === $this->_parameters) {
      return $this;
    }
    return new self(
      $this->_static_keyword,
      $this->_async_keyword,
      $this->_coroutine_keyword,
      $this->_function_keyword,
      $this->_left_paren,
      $value,
      $this->_right_paren,
      $this->_colon,
      $this->_type,
      $this->_use,
      $this->_body,
    );
  }

  public function hasParameters(): bool {
    return !$this->_parameters->isMissing();
  }

  public function getParameters(): ?EditableList {
    if ($this->_parameters->isMissing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(EditableList::class, $this->_parameters);
  }

  public function getParametersx(): EditableList {
    return TypeAssert::isInstanceOf(EditableList::class, $this->_parameters);
  }

  public function getRightParenUNTYPED(): EditableSyntax {
    return $this->_right_paren;
  }

  public function withRightParen(EditableSyntax $value): this {
    if ($value === $this->_right_paren) {
      return $this;
    }
    return new self(
      $this->_static_keyword,
      $this->_async_keyword,
      $this->_coroutine_keyword,
      $this->_function_keyword,
      $this->_left_paren,
      $this->_parameters,
      $value,
      $this->_colon,
      $this->_type,
      $this->_use,
      $this->_body,
    );
  }

  public function hasRightParen(): bool {
    return !$this->_right_paren->isMissing();
  }

  public function getRightParen(): ?RightParenToken {
    if ($this->_right_paren->isMissing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(RightParenToken::class, $this->_right_paren);
  }

  public function getRightParenx(): RightParenToken {
    return TypeAssert::isInstanceOf(RightParenToken::class, $this->_right_paren);
  }

  public function getColonUNTYPED(): EditableSyntax {
    return $this->_colon;
  }

  public function withColon(EditableSyntax $value): this {
    if ($value === $this->_colon) {
      return $this;
    }
    return new self(
      $this->_static_keyword,
      $this->_async_keyword,
      $this->_coroutine_keyword,
      $this->_function_keyword,
      $this->_left_paren,
      $this->_parameters,
      $this->_right_paren,
      $value,
      $this->_type,
      $this->_use,
      $this->_body,
    );
  }

  public function hasColon(): bool {
    return !$this->_colon->isMissing();
  }

  public function getColon(): ?ColonToken {
    if ($this->_colon->isMissing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(ColonToken::class, $this->_colon);
  }

  public function getColonx(): ColonToken {
    return TypeAssert::isInstanceOf(ColonToken::class, $this->_colon);
  }

  public function getTypeUNTYPED(): EditableSyntax {
    return $this->_type;
  }

  public function withType(EditableSyntax $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return new self(
      $this->_static_keyword,
      $this->_async_keyword,
      $this->_coroutine_keyword,
      $this->_function_keyword,
      $this->_left_paren,
      $this->_parameters,
      $this->_right_paren,
      $this->_colon,
      $value,
      $this->_use,
      $this->_body,
    );
  }

  public function hasType(): bool {
    return !$this->_type->isMissing();
  }

  public function getType(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_type);
  }

  public function getUseUNTYPED(): EditableSyntax {
    return $this->_use;
  }

  public function withUse(EditableSyntax $value): this {
    if ($value === $this->_use) {
      return $this;
    }
    return new self(
      $this->_static_keyword,
      $this->_async_keyword,
      $this->_coroutine_keyword,
      $this->_function_keyword,
      $this->_left_paren,
      $this->_parameters,
      $this->_right_paren,
      $this->_colon,
      $this->_type,
      $value,
      $this->_body,
    );
  }

  public function hasUse(): bool {
    return !$this->_use->isMissing();
  }

  public function getUse(): ?AnonymousFunctionUseClause {
    if ($this->_use->isMissing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(AnonymousFunctionUseClause::class, $this->_use);
  }

  public function getUsex(): AnonymousFunctionUseClause {
    return TypeAssert::isInstanceOf(AnonymousFunctionUseClause::class, $this->_use);
  }

  public function getBodyUNTYPED(): EditableSyntax {
    return $this->_body;
  }

  public function withBody(EditableSyntax $value): this {
    if ($value === $this->_body) {
      return $this;
    }
    return new self(
      $this->_static_keyword,
      $this->_async_keyword,
      $this->_coroutine_keyword,
      $this->_function_keyword,
      $this->_left_paren,
      $this->_parameters,
      $this->_right_paren,
      $this->_colon,
      $this->_type,
      $this->_use,
      $value,
    );
  }

  public function hasBody(): bool {
    return !$this->_body->isMissing();
  }

  public function getBody(): CompoundStatement {
    return TypeAssert::isInstanceOf(CompoundStatement::class, $this->_body);
  }
}
