/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<6d49f0e51a518ba316c3531f225d06e8>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class ClosureTypeSpecifier extends Node implements ITypeSpecifier {

  const string SYNTAX_KIND = 'closure_type_specifier';

  private Node $_outer_left_paren;
  private Node $_coroutine;
  private Node $_function_keyword;
  private Node $_inner_left_paren;
  private Node $_parameter_list;
  private Node $_inner_right_paren;
  private Node $_colon;
  private Node $_return_type;
  private Node $_outer_right_paren;

  public function __construct(
    Node $outer_left_paren,
    Node $coroutine,
    Node $function_keyword,
    Node $inner_left_paren,
    Node $parameter_list,
    Node $inner_right_paren,
    Node $colon,
    Node $return_type,
    Node $outer_right_paren,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_outer_left_paren = $outer_left_paren;
    $this->_coroutine = $coroutine;
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
    $offset += $outer_left_paren->getWidth();
    $coroutine = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['closure_coroutine'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $coroutine->getWidth();
    $function_keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['closure_function_keyword'],
      $file,
      $offset,
      $source,
      'FunctionToken',
    );
    $offset += $function_keyword->getWidth();
    $inner_left_paren = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['closure_inner_left_paren'],
      $file,
      $offset,
      $source,
      'LeftParenToken',
    );
    $offset += $inner_left_paren->getWidth();
    $parameter_list = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['closure_parameter_list'],
      $file,
      $offset,
      $source,
      'NodeList<ListItem<ITypeSpecifier>>',
    );
    $offset += $parameter_list->getWidth();
    $inner_right_paren = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['closure_inner_right_paren'],
      $file,
      $offset,
      $source,
      'RightParenToken',
    );
    $offset += $inner_right_paren->getWidth();
    $colon = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['closure_colon'],
      $file,
      $offset,
      $source,
      'ColonToken',
    );
    $offset += $colon->getWidth();
    $return_type = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['closure_return_type'],
      $file,
      $offset,
      $source,
      'ITypeSpecifier',
    );
    $offset += $return_type->getWidth();
    $outer_right_paren = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['closure_outer_right_paren'],
      $file,
      $offset,
      $source,
      'RightParenToken',
    );
    $offset += $outer_right_paren->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      $outer_left_paren,
      $coroutine,
      $function_keyword,
      $inner_left_paren,
      $parameter_list,
      $inner_right_paren,
      $colon,
      $return_type,
      $outer_right_paren,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'outer_left_paren' => $this->_outer_left_paren,
      'coroutine' => $this->_coroutine,
      'function_keyword' => $this->_function_keyword,
      'inner_left_paren' => $this->_inner_left_paren,
      'parameter_list' => $this->_parameter_list,
      'inner_right_paren' => $this->_inner_right_paren,
      'colon' => $this->_colon,
      'return_type' => $this->_return_type,
      'outer_right_paren' => $this->_outer_right_paren,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $outer_left_paren = $rewriter($this->_outer_left_paren, $parents);
    $coroutine = $rewriter($this->_coroutine, $parents);
    $function_keyword = $rewriter($this->_function_keyword, $parents);
    $inner_left_paren = $rewriter($this->_inner_left_paren, $parents);
    $parameter_list = $rewriter($this->_parameter_list, $parents);
    $inner_right_paren = $rewriter($this->_inner_right_paren, $parents);
    $colon = $rewriter($this->_colon, $parents);
    $return_type = $rewriter($this->_return_type, $parents);
    $outer_right_paren = $rewriter($this->_outer_right_paren, $parents);
    if (
      $outer_left_paren === $this->_outer_left_paren &&
      $coroutine === $this->_coroutine &&
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
      $outer_left_paren,
      $coroutine,
      $function_keyword,
      $inner_left_paren,
      $parameter_list,
      $inner_right_paren,
      $colon,
      $return_type,
      $outer_right_paren,
    );
  }

  public function getOuterLeftParenUNTYPED(): Node {
    return $this->_outer_left_paren;
  }

  public function withOuterLeftParen(Node $value): this {
    if ($value === $this->_outer_left_paren) {
      return $this;
    }
    return new static(
      $value,
      $this->_coroutine,
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
    return !$this->_outer_left_paren->isMissing();
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

  public function getCoroutineUNTYPED(): Node {
    return $this->_coroutine;
  }

  public function withCoroutine(Node $value): this {
    if ($value === $this->_coroutine) {
      return $this;
    }
    return new static(
      $this->_outer_left_paren,
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

  public function hasCoroutine(): bool {
    return !$this->_coroutine->isMissing();
  }

  /**
   * @return null
   */
  public function getCoroutine(): ?Node {
    if ($this->_coroutine->isMissing()) {
      return null;
    }
    return $this->_coroutine;
  }

  /**
   * @return
   */
  public function getCoroutinex(): Node {
    return TypeAssert\not_null($this->getCoroutine());
  }

  public function getFunctionKeywordUNTYPED(): Node {
    return $this->_function_keyword;
  }

  public function withFunctionKeyword(Node $value): this {
    if ($value === $this->_function_keyword) {
      return $this;
    }
    return new static(
      $this->_outer_left_paren,
      $this->_coroutine,
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
    return !$this->_function_keyword->isMissing();
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

  public function getInnerLeftParenUNTYPED(): Node {
    return $this->_inner_left_paren;
  }

  public function withInnerLeftParen(Node $value): this {
    if ($value === $this->_inner_left_paren) {
      return $this;
    }
    return new static(
      $this->_outer_left_paren,
      $this->_coroutine,
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
    return !$this->_inner_left_paren->isMissing();
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

  public function getParameterListUNTYPED(): Node {
    return $this->_parameter_list;
  }

  public function withParameterList(Node $value): this {
    if ($value === $this->_parameter_list) {
      return $this;
    }
    return new static(
      $this->_outer_left_paren,
      $this->_coroutine,
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
    return !$this->_parameter_list->isMissing();
  }

  /**
   * @return NodeList<ListItem<ClosureParameterTypeSpecifier>> |
   * NodeList<ListItem<ITypeSpecifier>> | NodeList<ListItem<VariadicParameter>>
   * | null
   */
  public function getParameterList(): ?NodeList<ListItem<ITypeSpecifier>> {
    if ($this->_parameter_list->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(NodeList::class, $this->_parameter_list);
  }

  /**
   * @return NodeList<ListItem<ClosureParameterTypeSpecifier>> |
   * NodeList<ListItem<ITypeSpecifier>> | NodeList<ListItem<VariadicParameter>>
   */
  public function getParameterListx(): NodeList<ListItem<ITypeSpecifier>> {
    return TypeAssert\not_null($this->getParameterList());
  }

  public function getInnerRightParenUNTYPED(): Node {
    return $this->_inner_right_paren;
  }

  public function withInnerRightParen(Node $value): this {
    if ($value === $this->_inner_right_paren) {
      return $this;
    }
    return new static(
      $this->_outer_left_paren,
      $this->_coroutine,
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
    return !$this->_inner_right_paren->isMissing();
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

  public function getColonUNTYPED(): Node {
    return $this->_colon;
  }

  public function withColon(Node $value): this {
    if ($value === $this->_colon) {
      return $this;
    }
    return new static(
      $this->_outer_left_paren,
      $this->_coroutine,
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
    return !$this->_colon->isMissing();
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

  public function getReturnTypeUNTYPED(): Node {
    return $this->_return_type;
  }

  public function withReturnType(Node $value): this {
    if ($value === $this->_return_type) {
      return $this;
    }
    return new static(
      $this->_outer_left_paren,
      $this->_coroutine,
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
    return !$this->_return_type->isMissing();
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

  public function getOuterRightParenUNTYPED(): Node {
    return $this->_outer_right_paren;
  }

  public function withOuterRightParen(Node $value): this {
    if ($value === $this->_outer_right_paren) {
      return $this;
    }
    return new static(
      $this->_outer_left_paren,
      $this->_coroutine,
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
    return !$this->_outer_right_paren->isMissing();
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
