/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<1dd93cbeb760c5d6fb4c4edc90f5ebe8>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class Php7AnonymousFunction
  extends Node
  implements IHasFunctionBody, ILambdaBody, IExpression {

  const string SYNTAX_KIND = 'php7_anonymous_function';

  private ?Node $_attribute_spec;
  private ?Node $_static_keyword;
  private ?Node $_async_keyword;
  private ?Node $_coroutine_keyword;
  private FunctionToken $_function_keyword;
  private LeftParenToken $_left_paren;
  private ?Node $_parameters;
  private RightParenToken $_right_paren;
  private AnonymousFunctionUseClause $_use;
  private ColonToken $_colon;
  private SimpleTypeSpecifier $_type;
  private CompoundStatement $_body;

  public function __construct(
    ?Node $attribute_spec,
    ?Node $static_keyword,
    ?Node $async_keyword,
    ?Node $coroutine_keyword,
    FunctionToken $function_keyword,
    LeftParenToken $left_paren,
    ?Node $parameters,
    RightParenToken $right_paren,
    AnonymousFunctionUseClause $use,
    ColonToken $colon,
    SimpleTypeSpecifier $type,
    CompoundStatement $body,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_attribute_spec = $attribute_spec;
    $this->_static_keyword = $static_keyword;
    $this->_async_keyword = $async_keyword;
    $this->_coroutine_keyword = $coroutine_keyword;
    $this->_function_keyword = $function_keyword;
    $this->_left_paren = $left_paren;
    $this->_parameters = $parameters;
    $this->_right_paren = $right_paren;
    $this->_use = $use;
    $this->_colon = $colon;
    $this->_type = $type;
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
      /* HH_FIXME[4110] */ $json['php7_anonymous_attribute_spec'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $attribute_spec?->getWidth() ?? 0;
    $static_keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['php7_anonymous_static_keyword'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $static_keyword?->getWidth() ?? 0;
    $async_keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['php7_anonymous_async_keyword'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $async_keyword?->getWidth() ?? 0;
    $coroutine_keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['php7_anonymous_coroutine_keyword'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $coroutine_keyword?->getWidth() ?? 0;
    $function_keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['php7_anonymous_function_keyword'],
      $file,
      $offset,
      $source,
      'FunctionToken',
    );
    $function_keyword = $function_keyword as nonnull;
    $offset += $function_keyword->getWidth();
    $left_paren = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['php7_anonymous_left_paren'],
      $file,
      $offset,
      $source,
      'LeftParenToken',
    );
    $left_paren = $left_paren as nonnull;
    $offset += $left_paren->getWidth();
    $parameters = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['php7_anonymous_parameters'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $parameters?->getWidth() ?? 0;
    $right_paren = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['php7_anonymous_right_paren'],
      $file,
      $offset,
      $source,
      'RightParenToken',
    );
    $right_paren = $right_paren as nonnull;
    $offset += $right_paren->getWidth();
    $use = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['php7_anonymous_use'],
      $file,
      $offset,
      $source,
      'AnonymousFunctionUseClause',
    );
    $use = $use as nonnull;
    $offset += $use->getWidth();
    $colon = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['php7_anonymous_colon'],
      $file,
      $offset,
      $source,
      'ColonToken',
    );
    $colon = $colon as nonnull;
    $offset += $colon->getWidth();
    $type = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['php7_anonymous_type'],
      $file,
      $offset,
      $source,
      'SimpleTypeSpecifier',
    );
    $type = $type as nonnull;
    $offset += $type->getWidth();
    $body = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['php7_anonymous_body'],
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
      /* HH_IGNORE_ERROR[4110] */ $attribute_spec,
      /* HH_IGNORE_ERROR[4110] */ $static_keyword,
      /* HH_IGNORE_ERROR[4110] */ $async_keyword,
      /* HH_IGNORE_ERROR[4110] */ $coroutine_keyword,
      /* HH_IGNORE_ERROR[4110] */ $function_keyword,
      /* HH_IGNORE_ERROR[4110] */ $left_paren,
      /* HH_IGNORE_ERROR[4110] */ $parameters,
      /* HH_IGNORE_ERROR[4110] */ $right_paren,
      /* HH_IGNORE_ERROR[4110] */ $use,
      /* HH_IGNORE_ERROR[4110] */ $colon,
      /* HH_IGNORE_ERROR[4110] */ $type,
      /* HH_IGNORE_ERROR[4110] */ $body,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'attribute_spec' => $this->_attribute_spec,
      'static_keyword' => $this->_static_keyword,
      'async_keyword' => $this->_async_keyword,
      'coroutine_keyword' => $this->_coroutine_keyword,
      'function_keyword' => $this->_function_keyword,
      'left_paren' => $this->_left_paren,
      'parameters' => $this->_parameters,
      'right_paren' => $this->_right_paren,
      'use' => $this->_use,
      'colon' => $this->_colon,
      'type' => $this->_type,
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
    $static_keyword = $this->_static_keyword === null
      ? null
      : $rewriter($this->_static_keyword, $parents);
    $async_keyword = $this->_async_keyword === null
      ? null
      : $rewriter($this->_async_keyword, $parents);
    $coroutine_keyword = $this->_coroutine_keyword === null
      ? null
      : $rewriter($this->_coroutine_keyword, $parents);
    $function_keyword = $rewriter($this->_function_keyword, $parents);
    $left_paren = $rewriter($this->_left_paren, $parents);
    $parameters = $this->_parameters === null
      ? null
      : $rewriter($this->_parameters, $parents);
    $right_paren = $rewriter($this->_right_paren, $parents);
    $use = $rewriter($this->_use, $parents);
    $colon = $rewriter($this->_colon, $parents);
    $type = $rewriter($this->_type, $parents);
    $body = $rewriter($this->_body, $parents);
    if (
      $attribute_spec === $this->_attribute_spec &&
      $static_keyword === $this->_static_keyword &&
      $async_keyword === $this->_async_keyword &&
      $coroutine_keyword === $this->_coroutine_keyword &&
      $function_keyword === $this->_function_keyword &&
      $left_paren === $this->_left_paren &&
      $parameters === $this->_parameters &&
      $right_paren === $this->_right_paren &&
      $use === $this->_use &&
      $colon === $this->_colon &&
      $type === $this->_type &&
      $body === $this->_body
    ) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $attribute_spec,
      /* HH_FIXME[4110] use `as` */ $static_keyword,
      /* HH_FIXME[4110] use `as` */ $async_keyword,
      /* HH_FIXME[4110] use `as` */ $coroutine_keyword,
      /* HH_FIXME[4110] use `as` */ $function_keyword,
      /* HH_FIXME[4110] use `as` */ $left_paren,
      /* HH_FIXME[4110] use `as` */ $parameters,
      /* HH_FIXME[4110] use `as` */ $right_paren,
      /* HH_FIXME[4110] use `as` */ $use,
      /* HH_FIXME[4110] use `as` */ $colon,
      /* HH_FIXME[4110] use `as` */ $type,
      /* HH_FIXME[4110] use `as` */ $body,
    );
  }

  public function getAttributeSpecUNTYPED(): ?Node {
    return $this->_attribute_spec;
  }

  public function withAttributeSpec(?Node $value): this {
    if ($value === $this->_attribute_spec) {
      return $this;
    }
    return new static(
      $value,
      $this->_static_keyword,
      $this->_async_keyword,
      $this->_coroutine_keyword,
      $this->_function_keyword,
      $this->_left_paren,
      $this->_parameters,
      $this->_right_paren,
      $this->_use,
      $this->_colon,
      $this->_type,
      $this->_body,
    );
  }

  public function hasAttributeSpec(): bool {
    return $this->_attribute_spec !== null;
  }

  /**
   * @return null
   */
  public function getAttributeSpec(): ?Node {
    return $this->_attribute_spec;
  }

  /**
   * @return
   */
  public function getAttributeSpecx(): Node {
    return TypeAssert\not_null($this->getAttributeSpec());
  }

  public function getStaticKeywordUNTYPED(): ?Node {
    return $this->_static_keyword;
  }

  public function withStaticKeyword(?Node $value): this {
    if ($value === $this->_static_keyword) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $value,
      $this->_async_keyword,
      $this->_coroutine_keyword,
      $this->_function_keyword,
      $this->_left_paren,
      $this->_parameters,
      $this->_right_paren,
      $this->_use,
      $this->_colon,
      $this->_type,
      $this->_body,
    );
  }

  public function hasStaticKeyword(): bool {
    return $this->_static_keyword !== null;
  }

  /**
   * @return null
   */
  public function getStaticKeyword(): ?Node {
    return $this->_static_keyword;
  }

  /**
   * @return
   */
  public function getStaticKeywordx(): Node {
    return TypeAssert\not_null($this->getStaticKeyword());
  }

  public function getAsyncKeywordUNTYPED(): ?Node {
    return $this->_async_keyword;
  }

  public function withAsyncKeyword(?Node $value): this {
    if ($value === $this->_async_keyword) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_static_keyword,
      $value,
      $this->_coroutine_keyword,
      $this->_function_keyword,
      $this->_left_paren,
      $this->_parameters,
      $this->_right_paren,
      $this->_use,
      $this->_colon,
      $this->_type,
      $this->_body,
    );
  }

  public function hasAsyncKeyword(): bool {
    return $this->_async_keyword !== null;
  }

  /**
   * @return null
   */
  public function getAsyncKeyword(): ?Node {
    return $this->_async_keyword;
  }

  /**
   * @return
   */
  public function getAsyncKeywordx(): Node {
    return TypeAssert\not_null($this->getAsyncKeyword());
  }

  public function getCoroutineKeywordUNTYPED(): ?Node {
    return $this->_coroutine_keyword;
  }

  public function withCoroutineKeyword(?Node $value): this {
    if ($value === $this->_coroutine_keyword) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_static_keyword,
      $this->_async_keyword,
      $value,
      $this->_function_keyword,
      $this->_left_paren,
      $this->_parameters,
      $this->_right_paren,
      $this->_use,
      $this->_colon,
      $this->_type,
      $this->_body,
    );
  }

  public function hasCoroutineKeyword(): bool {
    return $this->_coroutine_keyword !== null;
  }

  /**
   * @return null
   */
  public function getCoroutineKeyword(): ?Node {
    return $this->_coroutine_keyword;
  }

  /**
   * @return
   */
  public function getCoroutineKeywordx(): Node {
    return TypeAssert\not_null($this->getCoroutineKeyword());
  }

  public function getFunctionKeywordUNTYPED(): ?Node {
    return $this->_function_keyword;
  }

  public function withFunctionKeyword(FunctionToken $value): this {
    if ($value === $this->_function_keyword) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_static_keyword,
      $this->_async_keyword,
      $this->_coroutine_keyword,
      $value,
      $this->_left_paren,
      $this->_parameters,
      $this->_right_paren,
      $this->_use,
      $this->_colon,
      $this->_type,
      $this->_body,
    );
  }

  public function hasFunctionKeyword(): bool {
    return $this->_function_keyword !== null;
  }

  /**
   * @return FunctionToken
   */
  public function getFunctionKeyword(): FunctionToken {
    return TypeAssert\instance_of(
      FunctionToken::class,
      $this->_function_keyword,
    );
  }

  /**
   * @return FunctionToken
   */
  public function getFunctionKeywordx(): FunctionToken {
    return $this->getFunctionKeyword();
  }

  public function getLeftParenUNTYPED(): ?Node {
    return $this->_left_paren;
  }

  public function withLeftParen(LeftParenToken $value): this {
    if ($value === $this->_left_paren) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_static_keyword,
      $this->_async_keyword,
      $this->_coroutine_keyword,
      $this->_function_keyword,
      $value,
      $this->_parameters,
      $this->_right_paren,
      $this->_use,
      $this->_colon,
      $this->_type,
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

  public function getParametersUNTYPED(): ?Node {
    return $this->_parameters;
  }

  public function withParameters(?Node $value): this {
    if ($value === $this->_parameters) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_static_keyword,
      $this->_async_keyword,
      $this->_coroutine_keyword,
      $this->_function_keyword,
      $this->_left_paren,
      $value,
      $this->_right_paren,
      $this->_use,
      $this->_colon,
      $this->_type,
      $this->_body,
    );
  }

  public function hasParameters(): bool {
    return $this->_parameters !== null;
  }

  /**
   * @return null
   */
  public function getParameters(): ?Node {
    return $this->_parameters;
  }

  /**
   * @return
   */
  public function getParametersx(): Node {
    return TypeAssert\not_null($this->getParameters());
  }

  public function getRightParenUNTYPED(): ?Node {
    return $this->_right_paren;
  }

  public function withRightParen(RightParenToken $value): this {
    if ($value === $this->_right_paren) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_static_keyword,
      $this->_async_keyword,
      $this->_coroutine_keyword,
      $this->_function_keyword,
      $this->_left_paren,
      $this->_parameters,
      $value,
      $this->_use,
      $this->_colon,
      $this->_type,
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

  public function getUseUNTYPED(): ?Node {
    return $this->_use;
  }

  public function withUse(AnonymousFunctionUseClause $value): this {
    if ($value === $this->_use) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_static_keyword,
      $this->_async_keyword,
      $this->_coroutine_keyword,
      $this->_function_keyword,
      $this->_left_paren,
      $this->_parameters,
      $this->_right_paren,
      $value,
      $this->_colon,
      $this->_type,
      $this->_body,
    );
  }

  public function hasUse(): bool {
    return $this->_use !== null;
  }

  /**
   * @return AnonymousFunctionUseClause
   */
  public function getUse(): AnonymousFunctionUseClause {
    return TypeAssert\instance_of(
      AnonymousFunctionUseClause::class,
      $this->_use,
    );
  }

  /**
   * @return AnonymousFunctionUseClause
   */
  public function getUsex(): AnonymousFunctionUseClause {
    return $this->getUse();
  }

  public function getColonUNTYPED(): ?Node {
    return $this->_colon;
  }

  public function withColon(ColonToken $value): this {
    if ($value === $this->_colon) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_static_keyword,
      $this->_async_keyword,
      $this->_coroutine_keyword,
      $this->_function_keyword,
      $this->_left_paren,
      $this->_parameters,
      $this->_right_paren,
      $this->_use,
      $value,
      $this->_type,
      $this->_body,
    );
  }

  public function hasColon(): bool {
    return $this->_colon !== null;
  }

  /**
   * @return ColonToken
   */
  public function getColon(): ColonToken {
    return TypeAssert\instance_of(ColonToken::class, $this->_colon);
  }

  /**
   * @return ColonToken
   */
  public function getColonx(): ColonToken {
    return $this->getColon();
  }

  public function getTypeUNTYPED(): ?Node {
    return $this->_type;
  }

  public function withType(SimpleTypeSpecifier $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_static_keyword,
      $this->_async_keyword,
      $this->_coroutine_keyword,
      $this->_function_keyword,
      $this->_left_paren,
      $this->_parameters,
      $this->_right_paren,
      $this->_use,
      $this->_colon,
      $value,
      $this->_body,
    );
  }

  public function hasType(): bool {
    return $this->_type !== null;
  }

  /**
   * @return SimpleTypeSpecifier
   */
  public function getType(): SimpleTypeSpecifier {
    return TypeAssert\instance_of(SimpleTypeSpecifier::class, $this->_type);
  }

  /**
   * @return SimpleTypeSpecifier
   */
  public function getTypex(): SimpleTypeSpecifier {
    return $this->getType();
  }

  public function getBodyUNTYPED(): ?Node {
    return $this->_body;
  }

  public function withBody(CompoundStatement $value): this {
    if ($value === $this->_body) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_static_keyword,
      $this->_async_keyword,
      $this->_coroutine_keyword,
      $this->_function_keyword,
      $this->_left_paren,
      $this->_parameters,
      $this->_right_paren,
      $this->_use,
      $this->_colon,
      $this->_type,
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
