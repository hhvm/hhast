<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<7b06f65faa480132f953d32952f9e9cd>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class AnonymousFunction extends EditableNode {

  private EditableNode $_attribute_spec;
  private EditableNode $_static_keyword;
  private EditableNode $_async_keyword;
  private EditableNode $_coroutine_keyword;
  private EditableNode $_function_keyword;
  private EditableNode $_ampersand;
  private EditableNode $_left_paren;
  private EditableNode $_parameters;
  private EditableNode $_right_paren;
  private EditableNode $_colon;
  private EditableNode $_type;
  private EditableNode $_use;
  private EditableNode $_body;

  public function __construct(
    EditableNode $attribute_spec,
    EditableNode $static_keyword,
    EditableNode $async_keyword,
    EditableNode $coroutine_keyword,
    EditableNode $function_keyword,
    EditableNode $ampersand,
    EditableNode $left_paren,
    EditableNode $parameters,
    EditableNode $right_paren,
    EditableNode $colon,
    EditableNode $type,
    EditableNode $use,
    EditableNode $body,
  ) {
    parent::__construct('anonymous_function');
    $this->_attribute_spec = $attribute_spec;
    $this->_static_keyword = $static_keyword;
    $this->_async_keyword = $async_keyword;
    $this->_coroutine_keyword = $coroutine_keyword;
    $this->_function_keyword = $function_keyword;
    $this->_ampersand = $ampersand;
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
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
  ): this {
    $attribute_spec = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['anonymous_attribute_spec'],
      $file,
      $offset,
      $source,
    );
    $offset += $attribute_spec->getWidth();
    $static_keyword = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['anonymous_static_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $static_keyword->getWidth();
    $async_keyword = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['anonymous_async_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $async_keyword->getWidth();
    $coroutine_keyword = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['anonymous_coroutine_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $coroutine_keyword->getWidth();
    $function_keyword = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['anonymous_function_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $function_keyword->getWidth();
    $ampersand = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['anonymous_ampersand'],
      $file,
      $offset,
      $source,
    );
    $offset += $ampersand->getWidth();
    $left_paren = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['anonymous_left_paren'],
      $file,
      $offset,
      $source,
    );
    $offset += $left_paren->getWidth();
    $parameters = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['anonymous_parameters'],
      $file,
      $offset,
      $source,
    );
    $offset += $parameters->getWidth();
    $right_paren = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['anonymous_right_paren'],
      $file,
      $offset,
      $source,
    );
    $offset += $right_paren->getWidth();
    $colon = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['anonymous_colon'],
      $file,
      $offset,
      $source,
    );
    $offset += $colon->getWidth();
    $type = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['anonymous_type'],
      $file,
      $offset,
      $source,
    );
    $offset += $type->getWidth();
    $use = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['anonymous_use'],
      $file,
      $offset,
      $source,
    );
    $offset += $use->getWidth();
    $body = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['anonymous_body'],
      $file,
      $offset,
      $source,
    );
    $offset += $body->getWidth();
    return new static(
      $attribute_spec,
      $static_keyword,
      $async_keyword,
      $coroutine_keyword,
      $function_keyword,
      $ampersand,
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
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'attribute_spec' => $this->_attribute_spec,
      'static_keyword' => $this->_static_keyword,
      'async_keyword' => $this->_async_keyword,
      'coroutine_keyword' => $this->_coroutine_keyword,
      'function_keyword' => $this->_function_keyword,
      'ampersand' => $this->_ampersand,
      'left_paren' => $this->_left_paren,
      'parameters' => $this->_parameters,
      'right_paren' => $this->_right_paren,
      'colon' => $this->_colon,
      'type' => $this->_type,
      'use' => $this->_use,
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
    $attribute_spec = $this->_attribute_spec->rewrite($rewriter, $parents);
    $static_keyword = $this->_static_keyword->rewrite($rewriter, $parents);
    $async_keyword = $this->_async_keyword->rewrite($rewriter, $parents);
    $coroutine_keyword =
      $this->_coroutine_keyword->rewrite($rewriter, $parents);
    $function_keyword = $this->_function_keyword->rewrite($rewriter, $parents);
    $ampersand = $this->_ampersand->rewrite($rewriter, $parents);
    $left_paren = $this->_left_paren->rewrite($rewriter, $parents);
    $parameters = $this->_parameters->rewrite($rewriter, $parents);
    $right_paren = $this->_right_paren->rewrite($rewriter, $parents);
    $colon = $this->_colon->rewrite($rewriter, $parents);
    $type = $this->_type->rewrite($rewriter, $parents);
    $use = $this->_use->rewrite($rewriter, $parents);
    $body = $this->_body->rewrite($rewriter, $parents);
    if (
      $attribute_spec === $this->_attribute_spec &&
      $static_keyword === $this->_static_keyword &&
      $async_keyword === $this->_async_keyword &&
      $coroutine_keyword === $this->_coroutine_keyword &&
      $function_keyword === $this->_function_keyword &&
      $ampersand === $this->_ampersand &&
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
    return new static(
      $attribute_spec,
      $static_keyword,
      $async_keyword,
      $coroutine_keyword,
      $function_keyword,
      $ampersand,
      $left_paren,
      $parameters,
      $right_paren,
      $colon,
      $type,
      $use,
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
      $this->_static_keyword,
      $this->_async_keyword,
      $this->_coroutine_keyword,
      $this->_function_keyword,
      $this->_ampersand,
      $this->_left_paren,
      $this->_parameters,
      $this->_right_paren,
      $this->_colon,
      $this->_type,
      $this->_use,
      $this->_body,
    );
  }

  public function hasAttributeSpec(): bool {
    return !$this->_attribute_spec->isMissing();
  }

  /**
   * @returns AttributeSpecification | Missing
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
   * @returns AttributeSpecification
   */
  public function getAttributeSpecx(): AttributeSpecification {
    return TypeAssert\instance_of(
      AttributeSpecification::class,
      $this->_attribute_spec,
    );
  }

  public function getStaticKeywordUNTYPED(): EditableNode {
    return $this->_static_keyword;
  }

  public function withStaticKeyword(EditableNode $value): this {
    if ($value === $this->_static_keyword) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $value,
      $this->_async_keyword,
      $this->_coroutine_keyword,
      $this->_function_keyword,
      $this->_ampersand,
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

  /**
   * @returns Missing | StaticToken
   */
  public function getStaticKeyword(): ?StaticToken {
    if ($this->_static_keyword->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(StaticToken::class, $this->_static_keyword);
  }

  /**
   * @returns StaticToken
   */
  public function getStaticKeywordx(): StaticToken {
    return TypeAssert\instance_of(StaticToken::class, $this->_static_keyword);
  }

  public function getAsyncKeywordUNTYPED(): EditableNode {
    return $this->_async_keyword;
  }

  public function withAsyncKeyword(EditableNode $value): this {
    if ($value === $this->_async_keyword) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_static_keyword,
      $value,
      $this->_coroutine_keyword,
      $this->_function_keyword,
      $this->_ampersand,
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

  /**
   * @returns Missing | AsyncToken
   */
  public function getAsyncKeyword(): ?AsyncToken {
    if ($this->_async_keyword->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(AsyncToken::class, $this->_async_keyword);
  }

  /**
   * @returns AsyncToken
   */
  public function getAsyncKeywordx(): AsyncToken {
    return TypeAssert\instance_of(AsyncToken::class, $this->_async_keyword);
  }

  public function getCoroutineKeywordUNTYPED(): EditableNode {
    return $this->_coroutine_keyword;
  }

  public function withCoroutineKeyword(EditableNode $value): this {
    if ($value === $this->_coroutine_keyword) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_static_keyword,
      $this->_async_keyword,
      $value,
      $this->_function_keyword,
      $this->_ampersand,
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

  /**
   * @returns Missing | CoroutineToken
   */
  public function getCoroutineKeyword(): ?CoroutineToken {
    if ($this->_coroutine_keyword->isMissing()) {
      return null;
    }
    return
      TypeAssert\instance_of(CoroutineToken::class, $this->_coroutine_keyword);
  }

  /**
   * @returns CoroutineToken
   */
  public function getCoroutineKeywordx(): CoroutineToken {
    return
      TypeAssert\instance_of(CoroutineToken::class, $this->_coroutine_keyword);
  }

  public function getFunctionKeywordUNTYPED(): EditableNode {
    return $this->_function_keyword;
  }

  public function withFunctionKeyword(EditableNode $value): this {
    if ($value === $this->_function_keyword) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_static_keyword,
      $this->_async_keyword,
      $this->_coroutine_keyword,
      $value,
      $this->_ampersand,
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

  /**
   * @returns FunctionToken
   */
  public function getFunctionKeyword(): FunctionToken {
    return
      TypeAssert\instance_of(FunctionToken::class, $this->_function_keyword);
  }

  /**
   * @returns FunctionToken
   */
  public function getFunctionKeywordx(): FunctionToken {
    return $this->getFunctionKeyword();
  }

  public function getAmpersandUNTYPED(): EditableNode {
    return $this->_ampersand;
  }

  public function withAmpersand(EditableNode $value): this {
    if ($value === $this->_ampersand) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_static_keyword,
      $this->_async_keyword,
      $this->_coroutine_keyword,
      $this->_function_keyword,
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

  public function hasAmpersand(): bool {
    return !$this->_ampersand->isMissing();
  }

  /**
   * @returns Missing | AmpersandToken
   */
  public function getAmpersand(): ?AmpersandToken {
    if ($this->_ampersand->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(AmpersandToken::class, $this->_ampersand);
  }

  /**
   * @returns AmpersandToken
   */
  public function getAmpersandx(): AmpersandToken {
    return TypeAssert\instance_of(AmpersandToken::class, $this->_ampersand);
  }

  public function getLeftParenUNTYPED(): EditableNode {
    return $this->_left_paren;
  }

  public function withLeftParen(EditableNode $value): this {
    if ($value === $this->_left_paren) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_static_keyword,
      $this->_async_keyword,
      $this->_coroutine_keyword,
      $this->_function_keyword,
      $this->_ampersand,
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

  /**
   * @returns Missing | LeftParenToken
   */
  public function getLeftParen(): ?LeftParenToken {
    if ($this->_left_paren->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(LeftParenToken::class, $this->_left_paren);
  }

  /**
   * @returns LeftParenToken
   */
  public function getLeftParenx(): LeftParenToken {
    return TypeAssert\instance_of(LeftParenToken::class, $this->_left_paren);
  }

  public function getParametersUNTYPED(): EditableNode {
    return $this->_parameters;
  }

  public function withParameters(EditableNode $value): this {
    if ($value === $this->_parameters) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_static_keyword,
      $this->_async_keyword,
      $this->_coroutine_keyword,
      $this->_function_keyword,
      $this->_ampersand,
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

  /**
   * @returns EditableList | Missing
   */
  public function getParameters(): ?EditableList {
    if ($this->_parameters->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableList::class, $this->_parameters);
  }

  /**
   * @returns EditableList
   */
  public function getParametersx(): EditableList {
    return TypeAssert\instance_of(EditableList::class, $this->_parameters);
  }

  public function getRightParenUNTYPED(): EditableNode {
    return $this->_right_paren;
  }

  public function withRightParen(EditableNode $value): this {
    if ($value === $this->_right_paren) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_static_keyword,
      $this->_async_keyword,
      $this->_coroutine_keyword,
      $this->_function_keyword,
      $this->_ampersand,
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

  /**
   * @returns Missing | RightParenToken
   */
  public function getRightParen(): ?RightParenToken {
    if ($this->_right_paren->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(RightParenToken::class, $this->_right_paren);
  }

  /**
   * @returns RightParenToken
   */
  public function getRightParenx(): RightParenToken {
    return TypeAssert\instance_of(RightParenToken::class, $this->_right_paren);
  }

  public function getColonUNTYPED(): EditableNode {
    return $this->_colon;
  }

  public function withColon(EditableNode $value): this {
    if ($value === $this->_colon) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_static_keyword,
      $this->_async_keyword,
      $this->_coroutine_keyword,
      $this->_function_keyword,
      $this->_ampersand,
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

  /**
   * @returns Missing | ColonToken
   */
  public function getColon(): ?ColonToken {
    if ($this->_colon->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(ColonToken::class, $this->_colon);
  }

  /**
   * @returns ColonToken
   */
  public function getColonx(): ColonToken {
    return TypeAssert\instance_of(ColonToken::class, $this->_colon);
  }

  public function getTypeUNTYPED(): EditableNode {
    return $this->_type;
  }

  public function withType(EditableNode $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_static_keyword,
      $this->_async_keyword,
      $this->_coroutine_keyword,
      $this->_function_keyword,
      $this->_ampersand,
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

  /**
   * @returns ClosureTypeSpecifier | GenericTypeSpecifier |
   * MapArrayTypeSpecifier | Missing | NullableTypeSpecifier |
   * SimpleTypeSpecifier | SoftTypeSpecifier | TupleTypeSpecifier |
   * VectorArrayTypeSpecifier
   */
  public function getType(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_type);
  }

  /**
   * @returns ClosureTypeSpecifier | GenericTypeSpecifier |
   * MapArrayTypeSpecifier | Missing | NullableTypeSpecifier |
   * SimpleTypeSpecifier | SoftTypeSpecifier | TupleTypeSpecifier |
   * VectorArrayTypeSpecifier
   */
  public function getTypex(): EditableNode {
    return $this->getType();
  }

  public function getUseUNTYPED(): EditableNode {
    return $this->_use;
  }

  public function withUse(EditableNode $value): this {
    if ($value === $this->_use) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_static_keyword,
      $this->_async_keyword,
      $this->_coroutine_keyword,
      $this->_function_keyword,
      $this->_ampersand,
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

  /**
   * @returns AnonymousFunctionUseClause | Missing
   */
  public function getUse(): ?AnonymousFunctionUseClause {
    if ($this->_use->isMissing()) {
      return null;
    }
    return
      TypeAssert\instance_of(AnonymousFunctionUseClause::class, $this->_use);
  }

  /**
   * @returns AnonymousFunctionUseClause
   */
  public function getUsex(): AnonymousFunctionUseClause {
    return
      TypeAssert\instance_of(AnonymousFunctionUseClause::class, $this->_use);
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
      $this->_static_keyword,
      $this->_async_keyword,
      $this->_coroutine_keyword,
      $this->_function_keyword,
      $this->_ampersand,
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

  /**
   * @returns CompoundStatement
   */
  public function getBody(): CompoundStatement {
    return TypeAssert\instance_of(CompoundStatement::class, $this->_body);
  }

  /**
   * @returns CompoundStatement
   */
  public function getBodyx(): CompoundStatement {
    return $this->getBody();
  }
}
