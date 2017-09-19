<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<101db37a5967971128c61d3d5762bb4d>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class ClosureTypeSpecifier extends EditableNode {

  private EditableNode $_outer_left_paren;
  private EditableNode $_coroutine;
  private EditableNode $_function_keyword;
  private EditableNode $_inner_left_paren;
  private EditableNode $_parameter_types;
  private EditableNode $_inner_right_paren;
  private EditableNode $_colon;
  private EditableNode $_return_type;
  private EditableNode $_outer_right_paren;

  public function __construct(
    EditableNode $outer_left_paren,
    EditableNode $coroutine,
    EditableNode $function_keyword,
    EditableNode $inner_left_paren,
    EditableNode $parameter_types,
    EditableNode $inner_right_paren,
    EditableNode $colon,
    EditableNode $return_type,
    EditableNode $outer_right_paren,
  ) {
    parent::__construct('closure_type_specifier');
    $this->_outer_left_paren = $outer_left_paren;
    $this->_coroutine = $coroutine;
    $this->_function_keyword = $function_keyword;
    $this->_inner_left_paren = $inner_left_paren;
    $this->_parameter_types = $parameter_types;
    $this->_inner_right_paren = $inner_right_paren;
    $this->_colon = $colon;
    $this->_return_type = $return_type;
    $this->_outer_right_paren = $outer_right_paren;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $outer_left_paren = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['closure_outer_left_paren'],
      $position,
      $source,
    );
    $position += $outer_left_paren->getWidth();
    $coroutine = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['closure_coroutine'],
      $position,
      $source,
    );
    $position += $coroutine->getWidth();
    $function_keyword = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['closure_function_keyword'],
      $position,
      $source,
    );
    $position += $function_keyword->getWidth();
    $inner_left_paren = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['closure_inner_left_paren'],
      $position,
      $source,
    );
    $position += $inner_left_paren->getWidth();
    $parameter_types = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['closure_parameter_types'],
      $position,
      $source,
    );
    $position += $parameter_types->getWidth();
    $inner_right_paren = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['closure_inner_right_paren'],
      $position,
      $source,
    );
    $position += $inner_right_paren->getWidth();
    $colon = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['closure_colon'],
      $position,
      $source,
    );
    $position += $colon->getWidth();
    $return_type = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['closure_return_type'],
      $position,
      $source,
    );
    $position += $return_type->getWidth();
    $outer_right_paren = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['closure_outer_right_paren'],
      $position,
      $source,
    );
    $position += $outer_right_paren->getWidth();
    return new self(
      $outer_left_paren,
      $coroutine,
      $function_keyword,
      $inner_left_paren,
      $parameter_types,
      $inner_right_paren,
      $colon,
      $return_type,
      $outer_right_paren,
    );
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableNode> {
    yield 'outer_left_paren' => $this->_outer_left_paren;
    yield 'coroutine' => $this->_coroutine;
    yield 'function_keyword' => $this->_function_keyword;
    yield 'inner_left_paren' => $this->_inner_left_paren;
    yield 'parameter_types' => $this->_parameter_types;
    yield 'inner_right_paren' => $this->_inner_right_paren;
    yield 'colon' => $this->_colon;
    yield 'return_type' => $this->_return_type;
    yield 'outer_right_paren' => $this->_outer_right_paren;
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?Traversable<EditableNode> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $outer_left_paren = $this->_outer_left_paren->rewrite($rewriter, $parents);
    $coroutine = $this->_coroutine->rewrite($rewriter, $parents);
    $function_keyword = $this->_function_keyword->rewrite($rewriter, $parents);
    $inner_left_paren = $this->_inner_left_paren->rewrite($rewriter, $parents);
    $parameter_types = $this->_parameter_types->rewrite($rewriter, $parents);
    $inner_right_paren =
      $this->_inner_right_paren->rewrite($rewriter, $parents);
    $colon = $this->_colon->rewrite($rewriter, $parents);
    $return_type = $this->_return_type->rewrite($rewriter, $parents);
    $outer_right_paren =
      $this->_outer_right_paren->rewrite($rewriter, $parents);
    if (
      $outer_left_paren === $this->_outer_left_paren &&
      $coroutine === $this->_coroutine &&
      $function_keyword === $this->_function_keyword &&
      $inner_left_paren === $this->_inner_left_paren &&
      $parameter_types === $this->_parameter_types &&
      $inner_right_paren === $this->_inner_right_paren &&
      $colon === $this->_colon &&
      $return_type === $this->_return_type &&
      $outer_right_paren === $this->_outer_right_paren
    ) {
      return $this;
    }
    return new self(
      $outer_left_paren,
      $coroutine,
      $function_keyword,
      $inner_left_paren,
      $parameter_types,
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
    return new self(
      $value,
      $this->_coroutine,
      $this->_function_keyword,
      $this->_inner_left_paren,
      $this->_parameter_types,
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
   * @returns LeftParenToken
   */
  public function getOuterLeftParen(): LeftParenToken {
    return
      TypeAssert\instance_of(LeftParenToken::class, $this->_outer_left_paren);
  }

  public function getCoroutineUNTYPED(): EditableNode {
    return $this->_coroutine;
  }

  public function withCoroutine(EditableNode $value): this {
    if ($value === $this->_coroutine) {
      return $this;
    }
    return new self(
      $this->_outer_left_paren,
      $value,
      $this->_function_keyword,
      $this->_inner_left_paren,
      $this->_parameter_types,
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
   * @returns Missing
   */
  public function getCoroutine(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_coroutine);
  }

  public function getFunctionKeywordUNTYPED(): EditableNode {
    return $this->_function_keyword;
  }

  public function withFunctionKeyword(EditableNode $value): this {
    if ($value === $this->_function_keyword) {
      return $this;
    }
    return new self(
      $this->_outer_left_paren,
      $this->_coroutine,
      $value,
      $this->_inner_left_paren,
      $this->_parameter_types,
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
   * @returns FunctionToken
   */
  public function getFunctionKeyword(): FunctionToken {
    return
      TypeAssert\instance_of(FunctionToken::class, $this->_function_keyword);
  }

  public function getInnerLeftParenUNTYPED(): EditableNode {
    return $this->_inner_left_paren;
  }

  public function withInnerLeftParen(EditableNode $value): this {
    if ($value === $this->_inner_left_paren) {
      return $this;
    }
    return new self(
      $this->_outer_left_paren,
      $this->_coroutine,
      $this->_function_keyword,
      $value,
      $this->_parameter_types,
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
   * @returns LeftParenToken
   */
  public function getInnerLeftParen(): LeftParenToken {
    return
      TypeAssert\instance_of(LeftParenToken::class, $this->_inner_left_paren);
  }

  public function getParameterTypesUNTYPED(): EditableNode {
    return $this->_parameter_types;
  }

  public function withParameterTypes(EditableNode $value): this {
    if ($value === $this->_parameter_types) {
      return $this;
    }
    return new self(
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

  public function hasParameterTypes(): bool {
    return !$this->_parameter_types->isMissing();
  }

  /**
   * @returns EditableList | Missing
   */
  public function getParameterTypes(): ?EditableList {
    if ($this->_parameter_types->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableList::class, $this->_parameter_types);
  }

  /**
   * @returns EditableList
   */
  public function getParameterTypesx(): EditableList {
    return TypeAssert\instance_of(EditableList::class, $this->_parameter_types);
  }

  public function getInnerRightParenUNTYPED(): EditableNode {
    return $this->_inner_right_paren;
  }

  public function withInnerRightParen(EditableNode $value): this {
    if ($value === $this->_inner_right_paren) {
      return $this;
    }
    return new self(
      $this->_outer_left_paren,
      $this->_coroutine,
      $this->_function_keyword,
      $this->_inner_left_paren,
      $this->_parameter_types,
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
   * @returns RightParenToken
   */
  public function getInnerRightParen(): RightParenToken {
    return
      TypeAssert\instance_of(RightParenToken::class, $this->_inner_right_paren);
  }

  public function getColonUNTYPED(): EditableNode {
    return $this->_colon;
  }

  public function withColon(EditableNode $value): this {
    if ($value === $this->_colon) {
      return $this;
    }
    return new self(
      $this->_outer_left_paren,
      $this->_coroutine,
      $this->_function_keyword,
      $this->_inner_left_paren,
      $this->_parameter_types,
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
   * @returns ColonToken
   */
  public function getColon(): ColonToken {
    return TypeAssert\instance_of(ColonToken::class, $this->_colon);
  }

  public function getReturnTypeUNTYPED(): EditableNode {
    return $this->_return_type;
  }

  public function withReturnType(EditableNode $value): this {
    if ($value === $this->_return_type) {
      return $this;
    }
    return new self(
      $this->_outer_left_paren,
      $this->_coroutine,
      $this->_function_keyword,
      $this->_inner_left_paren,
      $this->_parameter_types,
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
   * @returns SimpleTypeSpecifier | NullableTypeSpecifier | GenericTypeSpecifier
   */
  public function getReturnType(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_return_type);
  }

  public function getOuterRightParenUNTYPED(): EditableNode {
    return $this->_outer_right_paren;
  }

  public function withOuterRightParen(EditableNode $value): this {
    if ($value === $this->_outer_right_paren) {
      return $this;
    }
    return new self(
      $this->_outer_left_paren,
      $this->_coroutine,
      $this->_function_keyword,
      $this->_inner_left_paren,
      $this->_parameter_types,
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
   * @returns RightParenToken
   */
  public function getOuterRightParen(): RightParenToken {
    return
      TypeAssert\instance_of(RightParenToken::class, $this->_outer_right_paren);
  }
}
