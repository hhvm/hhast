/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<4de5781bcaa7e6a93cf2b796ecbe43b8>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;
/* HHAST_IGNORE_ALL[5607] 5607 is ignored because of false positives when comparing a generic to a typed value */
/* HHAST_IGNORE_ALL[5624] HHAST_IGNORE_ALL[5639] 5624 and 5639 are ignored because they insist on using co(tra)variant generics. Could this break external consumers? */

<<__ConsistentConstruct>>
final class AnonymousFunction
  extends Node
  implements IHasFunctionBody, ILambdaBody, IHasAttributeSpec, IExpression {

  const string SYNTAX_KIND = 'anonymous_function';

  private ?OldAttributeSpecification $_attribute_spec;
  private ?AsyncToken $_async_keyword;
  private FunctionToken $_function_keyword;
  private LeftParenToken $_left_paren;
  private ?NodeList<ListItem<ParameterDeclaration>> $_parameters;
  private RightParenToken $_right_paren;
  private ?Node $_ctx_list;
  private ?ColonToken $_colon;
  private ?ReadonlyToken $_readonly_return;
  private ?ITypeSpecifier $_type;
  private ?AnonymousFunctionUseClause $_use;
  private CompoundStatement $_body;

  public function __construct(
    ?OldAttributeSpecification $attribute_spec,
    ?AsyncToken $async_keyword,
    FunctionToken $function_keyword,
    LeftParenToken $left_paren,
    ?NodeList<ListItem<ParameterDeclaration>> $parameters,
    RightParenToken $right_paren,
    ?Node $ctx_list,
    ?ColonToken $colon,
    ?ReadonlyToken $readonly_return,
    ?ITypeSpecifier $type,
    ?AnonymousFunctionUseClause $use,
    CompoundStatement $body,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_attribute_spec = $attribute_spec;
    $this->_async_keyword = $async_keyword;
    $this->_function_keyword = $function_keyword;
    $this->_left_paren = $left_paren;
    $this->_parameters = $parameters;
    $this->_right_paren = $right_paren;
    $this->_ctx_list = $ctx_list;
    $this->_colon = $colon;
    $this->_readonly_return = $readonly_return;
    $this->_type = $type;
    $this->_use = $use;
    $this->_body = $body;
    parent::__construct($source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<arraykey, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
    string $_type_hint,
  ): this {
    $offset = $initial_offset;
    $attribute_spec = Node::fromJSON(
      ($json['anonymous_attribute_spec'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'OldAttributeSpecification',
    );
    $offset += $attribute_spec?->getWidth() ?? 0;
    $async_keyword = Node::fromJSON(
      ($json['anonymous_async_keyword'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'AsyncToken',
    );
    $offset += $async_keyword?->getWidth() ?? 0;
    $function_keyword = Node::fromJSON(
      ($json['anonymous_function_keyword']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'FunctionToken',
    );
    $function_keyword = $function_keyword as nonnull;
    $offset += $function_keyword->getWidth();
    $left_paren = Node::fromJSON(
      ($json['anonymous_left_paren']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'LeftParenToken',
    );
    $left_paren = $left_paren as nonnull;
    $offset += $left_paren->getWidth();
    $parameters = Node::fromJSON(
      ($json['anonymous_parameters'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'NodeList<ListItem<ParameterDeclaration>>',
    );
    $offset += $parameters?->getWidth() ?? 0;
    $right_paren = Node::fromJSON(
      ($json['anonymous_right_paren']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'RightParenToken',
    );
    $right_paren = $right_paren as nonnull;
    $offset += $right_paren->getWidth();
    $ctx_list = Node::fromJSON(
      ($json['anonymous_ctx_list'] ?? dict['kind' => 'missing']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $ctx_list?->getWidth() ?? 0;
    $colon = Node::fromJSON(
      ($json['anonymous_colon'] ?? dict['kind' => 'missing']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'ColonToken',
    );
    $offset += $colon?->getWidth() ?? 0;
    $readonly_return = Node::fromJSON(
      ($json['anonymous_readonly_return'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'ReadonlyToken',
    );
    $offset += $readonly_return?->getWidth() ?? 0;
    $type = Node::fromJSON(
      ($json['anonymous_type'] ?? dict['kind' => 'missing']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'ITypeSpecifier',
    );
    $offset += $type?->getWidth() ?? 0;
    $use = Node::fromJSON(
      ($json['anonymous_use'] ?? dict['kind' => 'missing']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'AnonymousFunctionUseClause',
    );
    $offset += $use?->getWidth() ?? 0;
    $body = Node::fromJSON(
      ($json['anonymous_body']) as dict<_, _>,
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
      /* HH_IGNORE_ERROR[4110] */ $async_keyword,
      /* HH_IGNORE_ERROR[4110] */ $function_keyword,
      /* HH_IGNORE_ERROR[4110] */ $left_paren,
      /* HH_IGNORE_ERROR[4110] */ $parameters,
      /* HH_IGNORE_ERROR[4110] */ $right_paren,
      /* HH_IGNORE_ERROR[4110] */ $ctx_list,
      /* HH_IGNORE_ERROR[4110] */ $colon,
      /* HH_IGNORE_ERROR[4110] */ $readonly_return,
      /* HH_IGNORE_ERROR[4110] */ $type,
      /* HH_IGNORE_ERROR[4110] */ $use,
      /* HH_IGNORE_ERROR[4110] */ $body,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'attribute_spec' => $this->_attribute_spec,
      'async_keyword' => $this->_async_keyword,
      'function_keyword' => $this->_function_keyword,
      'left_paren' => $this->_left_paren,
      'parameters' => $this->_parameters,
      'right_paren' => $this->_right_paren,
      'ctx_list' => $this->_ctx_list,
      'colon' => $this->_colon,
      'readonly_return' => $this->_readonly_return,
      'type' => $this->_type,
      'use' => $this->_use,
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
    $attribute_spec = $this->_attribute_spec === null
      ? null
      : $rewriter($this->_attribute_spec, $parents);
    $async_keyword = $this->_async_keyword === null
      ? null
      : $rewriter($this->_async_keyword, $parents);
    $function_keyword = $rewriter($this->_function_keyword, $parents);
    $left_paren = $rewriter($this->_left_paren, $parents);
    $parameters = $this->_parameters === null
      ? null
      : $rewriter($this->_parameters, $parents);
    $right_paren = $rewriter($this->_right_paren, $parents);
    $ctx_list =
      $this->_ctx_list === null ? null : $rewriter($this->_ctx_list, $parents);
    $colon = $this->_colon === null ? null : $rewriter($this->_colon, $parents);
    $readonly_return = $this->_readonly_return === null
      ? null
      : $rewriter($this->_readonly_return, $parents);
    $type = $this->_type === null ? null : $rewriter($this->_type, $parents);
    $use = $this->_use === null ? null : $rewriter($this->_use, $parents);
    $body = $rewriter($this->_body, $parents);
    if (
      $attribute_spec === $this->_attribute_spec &&
      $async_keyword === $this->_async_keyword &&
      $function_keyword === $this->_function_keyword &&
      $left_paren === $this->_left_paren &&
      $parameters === $this->_parameters &&
      $right_paren === $this->_right_paren &&
      $ctx_list === $this->_ctx_list &&
      $colon === $this->_colon &&
      $readonly_return === $this->_readonly_return &&
      $type === $this->_type &&
      $use === $this->_use &&
      $body === $this->_body
    ) {
      return $this;
    }
    return new static(
      $attribute_spec as ?OldAttributeSpecification,
      $async_keyword as ?AsyncToken,
      $function_keyword as FunctionToken,
      $left_paren as LeftParenToken,
      /* HH_FIXME[4110] ?NodeList<ListItem<ParameterDeclaration>> may not be enforceable */ $parameters,
      $right_paren as RightParenToken,
      $ctx_list as ?Node,
      $colon as ?ColonToken,
      $readonly_return as ?ReadonlyToken,
      $type as ?ITypeSpecifier,
      $use as ?AnonymousFunctionUseClause,
      $body as CompoundStatement,
    );
  }

  public function getAttributeSpecUNTYPED(): ?Node {
    return $this->_attribute_spec;
  }

  public function withAttributeSpec(?OldAttributeSpecification $value): this {
    if ($value === $this->_attribute_spec) {
      return $this;
    }
    return new static(
      $value,
      $this->_async_keyword,
      $this->_function_keyword,
      $this->_left_paren,
      $this->_parameters,
      $this->_right_paren,
      $this->_ctx_list,
      $this->_colon,
      $this->_readonly_return,
      $this->_type,
      $this->_use,
      $this->_body,
    );
  }

  public function hasAttributeSpec(): bool {
    return $this->_attribute_spec !== null;
  }

  /**
   * @return null | OldAttributeSpecification
   */
  public function getAttributeSpec(): ?OldAttributeSpecification {
    return $this->_attribute_spec;
  }

  /**
   * @return OldAttributeSpecification
   */
  public function getAttributeSpecx(): OldAttributeSpecification {
    return TypeAssert\not_null($this->getAttributeSpec());
  }

  public function getAsyncKeywordUNTYPED(): ?Node {
    return $this->_async_keyword;
  }

  public function withAsyncKeyword(?AsyncToken $value): this {
    if ($value === $this->_async_keyword) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $value,
      $this->_function_keyword,
      $this->_left_paren,
      $this->_parameters,
      $this->_right_paren,
      $this->_ctx_list,
      $this->_colon,
      $this->_readonly_return,
      $this->_type,
      $this->_use,
      $this->_body,
    );
  }

  public function hasAsyncKeyword(): bool {
    return $this->_async_keyword !== null;
  }

  /**
   * @return null | AsyncToken
   */
  public function getAsyncKeyword(): ?AsyncToken {
    return $this->_async_keyword;
  }

  /**
   * @return AsyncToken
   */
  public function getAsyncKeywordx(): AsyncToken {
    return TypeAssert\not_null($this->getAsyncKeyword());
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
      $this->_async_keyword,
      $value,
      $this->_left_paren,
      $this->_parameters,
      $this->_right_paren,
      $this->_ctx_list,
      $this->_colon,
      $this->_readonly_return,
      $this->_type,
      $this->_use,
      $this->_body,
    );
  }

  public function hasFunctionKeyword(): bool {
    return true;
  }

  /**
   * @return FunctionToken
   */
  public function getFunctionKeyword(): FunctionToken {
    return
      TypeAssert\instance_of(FunctionToken::class, $this->_function_keyword);
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
      $this->_async_keyword,
      $this->_function_keyword,
      $value,
      $this->_parameters,
      $this->_right_paren,
      $this->_ctx_list,
      $this->_colon,
      $this->_readonly_return,
      $this->_type,
      $this->_use,
      $this->_body,
    );
  }

  public function hasLeftParen(): bool {
    return true;
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

  public function withParameters(
    ?NodeList<ListItem<ParameterDeclaration>> $value,
  ): this {
    if ($value === $this->_parameters) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_async_keyword,
      $this->_function_keyword,
      $this->_left_paren,
      $value,
      $this->_right_paren,
      $this->_ctx_list,
      $this->_colon,
      $this->_readonly_return,
      $this->_type,
      $this->_use,
      $this->_body,
    );
  }

  public function hasParameters(): bool {
    return $this->_parameters !== null;
  }

  /**
   * @return NodeList<ListItem<ParameterDeclaration>> | null
   */
  public function getParameters(): ?NodeList<ListItem<ParameterDeclaration>> {
    return $this->_parameters;
  }

  /**
   * @return NodeList<ListItem<ParameterDeclaration>>
   */
  public function getParametersx(): NodeList<ListItem<ParameterDeclaration>> {
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
      $this->_async_keyword,
      $this->_function_keyword,
      $this->_left_paren,
      $this->_parameters,
      $value,
      $this->_ctx_list,
      $this->_colon,
      $this->_readonly_return,
      $this->_type,
      $this->_use,
      $this->_body,
    );
  }

  public function hasRightParen(): bool {
    return true;
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

  public function getCtxListUNTYPED(): ?Node {
    return $this->_ctx_list;
  }

  public function withCtxList(?Node $value): this {
    if ($value === $this->_ctx_list) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_async_keyword,
      $this->_function_keyword,
      $this->_left_paren,
      $this->_parameters,
      $this->_right_paren,
      $value,
      $this->_colon,
      $this->_readonly_return,
      $this->_type,
      $this->_use,
      $this->_body,
    );
  }

  public function hasCtxList(): bool {
    return $this->_ctx_list !== null;
  }

  /**
   * @return null
   */
  public function getCtxList(): ?Node {
    return $this->_ctx_list;
  }

  /**
   * @return
   */
  public function getCtxListx(): Node {
    return TypeAssert\not_null($this->getCtxList());
  }

  public function getColonUNTYPED(): ?Node {
    return $this->_colon;
  }

  public function withColon(?ColonToken $value): this {
    if ($value === $this->_colon) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_async_keyword,
      $this->_function_keyword,
      $this->_left_paren,
      $this->_parameters,
      $this->_right_paren,
      $this->_ctx_list,
      $value,
      $this->_readonly_return,
      $this->_type,
      $this->_use,
      $this->_body,
    );
  }

  public function hasColon(): bool {
    return $this->_colon !== null;
  }

  /**
   * @return null | ColonToken
   */
  public function getColon(): ?ColonToken {
    return $this->_colon;
  }

  /**
   * @return ColonToken
   */
  public function getColonx(): ColonToken {
    return TypeAssert\not_null($this->getColon());
  }

  public function getReadonlyReturnUNTYPED(): ?Node {
    return $this->_readonly_return;
  }

  public function withReadonlyReturn(?ReadonlyToken $value): this {
    if ($value === $this->_readonly_return) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_async_keyword,
      $this->_function_keyword,
      $this->_left_paren,
      $this->_parameters,
      $this->_right_paren,
      $this->_ctx_list,
      $this->_colon,
      $value,
      $this->_type,
      $this->_use,
      $this->_body,
    );
  }

  public function hasReadonlyReturn(): bool {
    return $this->_readonly_return !== null;
  }

  /**
   * @return null | ReadonlyToken
   */
  public function getReadonlyReturn(): ?ReadonlyToken {
    return $this->_readonly_return;
  }

  /**
   * @return ReadonlyToken
   */
  public function getReadonlyReturnx(): ReadonlyToken {
    return TypeAssert\not_null($this->getReadonlyReturn());
  }

  public function getTypeUNTYPED(): ?Node {
    return $this->_type;
  }

  public function withType(?ITypeSpecifier $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_async_keyword,
      $this->_function_keyword,
      $this->_left_paren,
      $this->_parameters,
      $this->_right_paren,
      $this->_ctx_list,
      $this->_colon,
      $this->_readonly_return,
      $value,
      $this->_use,
      $this->_body,
    );
  }

  public function hasType(): bool {
    return $this->_type !== null;
  }

  /**
   * @return AttributizedSpecifier | ClosureTypeSpecifier | DarrayTypeSpecifier
   * | GenericTypeSpecifier | null | NullableTypeSpecifier |
   * SimpleTypeSpecifier | TupleTypeSpecifier
   */
  public function getType(): ?ITypeSpecifier {
    return $this->_type;
  }

  /**
   * @return AttributizedSpecifier | ClosureTypeSpecifier | DarrayTypeSpecifier
   * | GenericTypeSpecifier | NullableTypeSpecifier | SimpleTypeSpecifier |
   * TupleTypeSpecifier
   */
  public function getTypex(): ITypeSpecifier {
    return TypeAssert\not_null($this->getType());
  }

  public function getUseUNTYPED(): ?Node {
    return $this->_use;
  }

  public function withUse(?AnonymousFunctionUseClause $value): this {
    if ($value === $this->_use) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_async_keyword,
      $this->_function_keyword,
      $this->_left_paren,
      $this->_parameters,
      $this->_right_paren,
      $this->_ctx_list,
      $this->_colon,
      $this->_readonly_return,
      $this->_type,
      $value,
      $this->_body,
    );
  }

  public function hasUse(): bool {
    return $this->_use !== null;
  }

  /**
   * @return AnonymousFunctionUseClause | null
   */
  public function getUse(): ?AnonymousFunctionUseClause {
    return $this->_use;
  }

  /**
   * @return AnonymousFunctionUseClause
   */
  public function getUsex(): AnonymousFunctionUseClause {
    return TypeAssert\not_null($this->getUse());
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
      $this->_async_keyword,
      $this->_function_keyword,
      $this->_left_paren,
      $this->_parameters,
      $this->_right_paren,
      $this->_ctx_list,
      $this->_colon,
      $this->_readonly_return,
      $this->_type,
      $this->_use,
      $value,
    );
  }

  public function hasBody(): bool {
    return true;
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
