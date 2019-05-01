/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<31489c6f54e594687e635fa732bc4e8f>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class ClosureTypeSpecifier extends EditableNode {

  private EditableNode $_outer_left_paren;
  private EditableNode $_coroutine;
  private EditableNode $_function_keyword;
  private EditableNode $_inner_left_paren;
  private EditableNode $_parameter_list;
  private EditableNode $_inner_right_paren;
  private EditableNode $_colon;
  private EditableNode $_return_type;
  private EditableNode $_outer_right_paren;

  public function __construct(
    EditableNode $outer_left_paren,
    EditableNode $coroutine,
    EditableNode $function_keyword,
    EditableNode $inner_left_paren,
    EditableNode $parameter_list,
    EditableNode $inner_right_paren,
    EditableNode $colon,
    EditableNode $return_type,
    EditableNode $outer_right_paren,
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
    parent::__construct('closure_type_specifier', $source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
  ): this {
    $offset = $initial_offset;
    $outer_left_paren = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['closure_outer_left_paren'],
      $file,
      $offset,
      $source,
    );
    $offset += $outer_left_paren->getWidth();
    $coroutine = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['closure_coroutine'],
      $file,
      $offset,
      $source,
    );
    $offset += $coroutine->getWidth();
    $function_keyword = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['closure_function_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $function_keyword->getWidth();
    $inner_left_paren = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['closure_inner_left_paren'],
      $file,
      $offset,
      $source,
    );
    $offset += $inner_left_paren->getWidth();
    $parameter_list = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['closure_parameter_list'],
      $file,
      $offset,
      $source,
    );
    $offset += $parameter_list->getWidth();
    $inner_right_paren = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['closure_inner_right_paren'],
      $file,
      $offset,
      $source,
    );
    $offset += $inner_right_paren->getWidth();
    $colon = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['closure_colon'],
      $file,
      $offset,
      $source,
    );
    $offset += $colon->getWidth();
    $return_type = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['closure_return_type'],
      $file,
      $offset,
      $source,
    );
    $offset += $return_type->getWidth();
    $outer_right_paren = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['closure_outer_right_paren'],
      $file,
      $offset,
      $source,
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
  public function getChildren(): dict<string, EditableNode> {
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
    vec<EditableNode> $parents = vec[],
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

  public function getOuterLeftParenUNTYPED(): EditableNode {
    return $this->_outer_left_paren;
  }

  public function withOuterLeftParen(EditableNode $value): this {
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

  public function getCoroutineUNTYPED(): EditableNode {
    return $this->_coroutine;
  }

  public function withCoroutine(EditableNode $value): this {
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
  public function getCoroutine(): ?EditableNode {
    if ($this->_coroutine->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableNode::class, $this->_coroutine);
  }

  /**
   * @return
   */
  public function getCoroutinex(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_coroutine);
  }

  public function getFunctionKeywordUNTYPED(): EditableNode {
    return $this->_function_keyword;
  }

  public function withFunctionKeyword(EditableNode $value): this {
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

  public function getInnerLeftParenUNTYPED(): EditableNode {
    return $this->_inner_left_paren;
  }

  public function withInnerLeftParen(EditableNode $value): this {
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

  public function getParameterListUNTYPED(): EditableNode {
    return $this->_parameter_list;
  }

  public function withParameterList(EditableNode $value): this {
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
   * @return EditableList<ClosureParameterTypeSpecifier> |
   * EditableList<EditableNode> | EditableList<VariadicParameter> | null
   */
  public function getParameterList(): ?EditableList<EditableNode> {
    if ($this->_parameter_list->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableList::class, $this->_parameter_list);
  }

  /**
   * @return EditableList<ClosureParameterTypeSpecifier> |
   * EditableList<EditableNode> | EditableList<VariadicParameter>
   */
  public function getParameterListx(): EditableList<EditableNode> {
    return TypeAssert\instance_of(EditableList::class, $this->_parameter_list);
  }

  public function getInnerRightParenUNTYPED(): EditableNode {
    return $this->_inner_right_paren;
  }

  public function withInnerRightParen(EditableNode $value): this {
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

  public function getColonUNTYPED(): EditableNode {
    return $this->_colon;
  }

  public function withColon(EditableNode $value): this {
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

  public function getReturnTypeUNTYPED(): EditableNode {
    return $this->_return_type;
  }

  public function withReturnType(EditableNode $value): this {
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
  public function getReturnType(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_return_type);
  }

  /**
   * @return ClosureTypeSpecifier | GenericTypeSpecifier | LikeTypeSpecifier |
   * NullableTypeSpecifier | SimpleTypeSpecifier | VectorTypeSpecifier
   */
  public function getReturnTypex(): EditableNode {
    return $this->getReturnType();
  }

  public function getOuterRightParenUNTYPED(): EditableNode {
    return $this->_outer_right_paren;
  }

  public function withOuterRightParen(EditableNode $value): this {
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
