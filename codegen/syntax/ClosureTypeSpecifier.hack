/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<727aa3024e36766c505ed27d39ccc231>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class ClosureTypeSpecifier extends Node implements ITypeSpecifier {

  const string SYNTAX_KIND = 'closure_type_specifier';

  private LeftParenToken $_outer_left_paren;
  private FunctionToken $_function_keyword;
  private LeftParenToken $_inner_left_paren;
  private ?NodeList<ListItem<ITypeSpecifier>> $_parameter_list;
  private RightParenToken $_inner_right_paren;
  private ColonToken $_colon;
  private ITypeSpecifier $_return_type;
  private RightParenToken $_outer_right_paren;

  public function __construct(
    LeftParenToken $outer_left_paren,
    FunctionToken $function_keyword,
    LeftParenToken $inner_left_paren,
    ?NodeList<ListItem<ITypeSpecifier>> $parameter_list,
    RightParenToken $inner_right_paren,
    ColonToken $colon,
    ITypeSpecifier $return_type,
    RightParenToken $outer_right_paren,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_outer_left_paren = $outer_left_paren;
    $this->_function_keyword = $function_keyword;
    $this->_inner_left_paren = $inner_left_paren;
    $this->_parameter_list = $parameter_list;
    $this->_inner_right_paren = $inner_right_paren;
    $this->_colon = $colon;
    $this->_return_type = $return_type;
    $this->_outer_right_paren = $outer_right_paren;
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
    $outer_left_paren = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['closure_outer_left_paren'],
      $file,
      $offset,
      $source,
      'LeftParenToken',
    );
    $outer_left_paren = $outer_left_paren as nonnull;
    $offset += $outer_left_paren->getWidth();
    $function_keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['closure_function_keyword'],
      $file,
      $offset,
      $source,
      'FunctionToken',
    );
    $function_keyword = $function_keyword as nonnull;
    $offset += $function_keyword->getWidth();
    $inner_left_paren = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['closure_inner_left_paren'],
      $file,
      $offset,
      $source,
      'LeftParenToken',
    );
    $inner_left_paren = $inner_left_paren as nonnull;
    $offset += $inner_left_paren->getWidth();
    $parameter_list = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['closure_parameter_list'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'NodeList<ListItem<ITypeSpecifier>>',
    );
    $offset += $parameter_list?->getWidth() ?? 0;
    $inner_right_paren = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['closure_inner_right_paren'],
      $file,
      $offset,
      $source,
      'RightParenToken',
    );
    $inner_right_paren = $inner_right_paren as nonnull;
    $offset += $inner_right_paren->getWidth();
    $colon = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['closure_colon'],
      $file,
      $offset,
      $source,
      'ColonToken',
    );
    $colon = $colon as nonnull;
    $offset += $colon->getWidth();
    $return_type = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['closure_return_type'],
      $file,
      $offset,
      $source,
      'ITypeSpecifier',
    );
    $return_type = $return_type as nonnull;
    $offset += $return_type->getWidth();
    $outer_right_paren = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['closure_outer_right_paren'],
      $file,
      $offset,
      $source,
      'RightParenToken',
    );
    $outer_right_paren = $outer_right_paren as nonnull;
    $offset += $outer_right_paren->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $outer_left_paren,
      /* HH_IGNORE_ERROR[4110] */ $function_keyword,
      /* HH_IGNORE_ERROR[4110] */ $inner_left_paren,
      /* HH_IGNORE_ERROR[4110] */ $parameter_list,
      /* HH_IGNORE_ERROR[4110] */ $inner_right_paren,
      /* HH_IGNORE_ERROR[4110] */ $colon,
      /* HH_IGNORE_ERROR[4110] */ $return_type,
      /* HH_IGNORE_ERROR[4110] */ $outer_right_paren,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'outer_left_paren' => $this->_outer_left_paren,
      'function_keyword' => $this->_function_keyword,
      'inner_left_paren' => $this->_inner_left_paren,
      'parameter_list' => $this->_parameter_list,
      'inner_right_paren' => $this->_inner_right_paren,
      'colon' => $this->_colon,
      'return_type' => $this->_return_type,
      'outer_right_paren' => $this->_outer_right_paren,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $outer_left_paren = $rewriter($this->_outer_left_paren, $parents);
    $function_keyword = $rewriter($this->_function_keyword, $parents);
    $inner_left_paren = $rewriter($this->_inner_left_paren, $parents);
    $parameter_list = $this->_parameter_list === null
      ? null
      : $rewriter($this->_parameter_list, $parents);
    $inner_right_paren = $rewriter($this->_inner_right_paren, $parents);
    $colon = $rewriter($this->_colon, $parents);
    $return_type = $rewriter($this->_return_type, $parents);
    $outer_right_paren = $rewriter($this->_outer_right_paren, $parents);
    if (
      $outer_left_paren === $this->_outer_left_paren &&
      $function_keyword === $this->_function_keyword &&
      $inner_left_paren === $this->_inner_left_paren &&
      $parameter_list === $this->_parameter_list &&
      $inner_right_paren === $this->_inner_right_paren &&
      $colon === $this->_colon &&
      $return_type === $this->_return_type &&
      $outer_right_paren === $this->_outer_right_paren
    ) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $outer_left_paren,
      /* HH_FIXME[4110] use `as` */ $function_keyword,
      /* HH_FIXME[4110] use `as` */ $inner_left_paren,
      /* HH_FIXME[4110] use `as` */ $parameter_list,
      /* HH_FIXME[4110] use `as` */ $inner_right_paren,
      /* HH_FIXME[4110] use `as` */ $colon,
      /* HH_FIXME[4110] use `as` */ $return_type,
      /* HH_FIXME[4110] use `as` */ $outer_right_paren,
    );
  }

  public function getOuterLeftParenUNTYPED(): ?Node {
    return $this->_outer_left_paren;
  }

  public function withOuterLeftParen(LeftParenToken $value): this {
    if ($value === $this->_outer_left_paren) {
      return $this;
    }
    return new static(
      $value,
      $this->_function_keyword,
      $this->_inner_left_paren,
      $this->_parameter_list,
      $this->_inner_right_paren,
      $this->_colon,
      $this->_return_type,
      $this->_outer_right_paren,
    );
  }

  public function hasOuterLeftParen(): bool {
    return $this->_outer_left_paren !== null;
  }

  /**
   * @return LeftParenToken
   */
  public function getOuterLeftParen(): LeftParenToken {
    return TypeAssert\instance_of(
      LeftParenToken::class,
      $this->_outer_left_paren,
    );
  }

  /**
   * @return LeftParenToken
   */
  public function getOuterLeftParenx(): LeftParenToken {
    return $this->getOuterLeftParen();
  }

  public function getFunctionKeywordUNTYPED(): ?Node {
    return $this->_function_keyword;
  }

  public function withFunctionKeyword(FunctionToken $value): this {
    if ($value === $this->_function_keyword) {
      return $this;
    }
    return new static(
      $this->_outer_left_paren,
      $value,
      $this->_inner_left_paren,
      $this->_parameter_list,
      $this->_inner_right_paren,
      $this->_colon,
      $this->_return_type,
      $this->_outer_right_paren,
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

  public function getInnerLeftParenUNTYPED(): ?Node {
    return $this->_inner_left_paren;
  }

  public function withInnerLeftParen(LeftParenToken $value): this {
    if ($value === $this->_inner_left_paren) {
      return $this;
    }
    return new static(
      $this->_outer_left_paren,
      $this->_function_keyword,
      $value,
      $this->_parameter_list,
      $this->_inner_right_paren,
      $this->_colon,
      $this->_return_type,
      $this->_outer_right_paren,
    );
  }

  public function hasInnerLeftParen(): bool {
    return $this->_inner_left_paren !== null;
  }

  /**
   * @return LeftParenToken
   */
  public function getInnerLeftParen(): LeftParenToken {
    return TypeAssert\instance_of(
      LeftParenToken::class,
      $this->_inner_left_paren,
    );
  }

  /**
   * @return LeftParenToken
   */
  public function getInnerLeftParenx(): LeftParenToken {
    return $this->getInnerLeftParen();
  }

  public function getParameterListUNTYPED(): ?Node {
    return $this->_parameter_list;
  }

  public function withParameterList(
    ?NodeList<ListItem<ITypeSpecifier>> $value,
  ): this {
    if ($value === $this->_parameter_list) {
      return $this;
    }
    return new static(
      $this->_outer_left_paren,
      $this->_function_keyword,
      $this->_inner_left_paren,
      $value,
      $this->_inner_right_paren,
      $this->_colon,
      $this->_return_type,
      $this->_outer_right_paren,
    );
  }

  public function hasParameterList(): bool {
    return $this->_parameter_list !== null;
  }

  /**
   * @return NodeList<ListItem<ClosureParameterTypeSpecifier>> |
   * NodeList<ListItem<ITypeSpecifier>> | NodeList<ListItem<VariadicParameter>>
   * | null
   */
  public function getParameterList(): ?NodeList<ListItem<ITypeSpecifier>> {
    return $this->_parameter_list;
  }

  /**
   * @return NodeList<ListItem<ClosureParameterTypeSpecifier>> |
   * NodeList<ListItem<ITypeSpecifier>> | NodeList<ListItem<VariadicParameter>>
   */
  public function getParameterListx(): NodeList<ListItem<ITypeSpecifier>> {
    return TypeAssert\not_null($this->getParameterList());
  }

  public function getInnerRightParenUNTYPED(): ?Node {
    return $this->_inner_right_paren;
  }

  public function withInnerRightParen(RightParenToken $value): this {
    if ($value === $this->_inner_right_paren) {
      return $this;
    }
    return new static(
      $this->_outer_left_paren,
      $this->_function_keyword,
      $this->_inner_left_paren,
      $this->_parameter_list,
      $value,
      $this->_colon,
      $this->_return_type,
      $this->_outer_right_paren,
    );
  }

  public function hasInnerRightParen(): bool {
    return $this->_inner_right_paren !== null;
  }

  /**
   * @return RightParenToken
   */
  public function getInnerRightParen(): RightParenToken {
    return TypeAssert\instance_of(
      RightParenToken::class,
      $this->_inner_right_paren,
    );
  }

  /**
   * @return RightParenToken
   */
  public function getInnerRightParenx(): RightParenToken {
    return $this->getInnerRightParen();
  }

  public function getColonUNTYPED(): ?Node {
    return $this->_colon;
  }

  public function withColon(ColonToken $value): this {
    if ($value === $this->_colon) {
      return $this;
    }
    return new static(
      $this->_outer_left_paren,
      $this->_function_keyword,
      $this->_inner_left_paren,
      $this->_parameter_list,
      $this->_inner_right_paren,
      $value,
      $this->_return_type,
      $this->_outer_right_paren,
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

  public function getReturnTypeUNTYPED(): ?Node {
    return $this->_return_type;
  }

  public function withReturnType(ITypeSpecifier $value): this {
    if ($value === $this->_return_type) {
      return $this;
    }
    return new static(
      $this->_outer_left_paren,
      $this->_function_keyword,
      $this->_inner_left_paren,
      $this->_parameter_list,
      $this->_inner_right_paren,
      $this->_colon,
      $value,
      $this->_outer_right_paren,
    );
  }

  public function hasReturnType(): bool {
    return $this->_return_type !== null;
  }

  /**
   * @return ClosureTypeSpecifier | GenericTypeSpecifier | LikeTypeSpecifier |
   * NullableTypeSpecifier | SimpleTypeSpecifier | VectorTypeSpecifier
   */
  public function getReturnType(): ITypeSpecifier {
    return TypeAssert\instance_of(ITypeSpecifier::class, $this->_return_type);
  }

  /**
   * @return ClosureTypeSpecifier | GenericTypeSpecifier | LikeTypeSpecifier |
   * NullableTypeSpecifier | SimpleTypeSpecifier | VectorTypeSpecifier
   */
  public function getReturnTypex(): ITypeSpecifier {
    return $this->getReturnType();
  }

  public function getOuterRightParenUNTYPED(): ?Node {
    return $this->_outer_right_paren;
  }

  public function withOuterRightParen(RightParenToken $value): this {
    if ($value === $this->_outer_right_paren) {
      return $this;
    }
    return new static(
      $this->_outer_left_paren,
      $this->_function_keyword,
      $this->_inner_left_paren,
      $this->_parameter_list,
      $this->_inner_right_paren,
      $this->_colon,
      $this->_return_type,
      $value,
    );
  }

  public function hasOuterRightParen(): bool {
    return $this->_outer_right_paren !== null;
  }

  /**
   * @return RightParenToken
   */
  public function getOuterRightParen(): RightParenToken {
    return TypeAssert\instance_of(
      RightParenToken::class,
      $this->_outer_right_paren,
    );
  }

  /**
   * @return RightParenToken
   */
  public function getOuterRightParenx(): RightParenToken {
    return $this->getOuterRightParen();
  }
}
