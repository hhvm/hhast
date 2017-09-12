<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<92bda99a90ad15dfdda21e37d5c5e2c6>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class ClosureTypeSpecifier extends EditableSyntax {

  private EditableSyntax $_outer_left_paren;
  private EditableSyntax $_coroutine;
  private EditableSyntax $_function_keyword;
  private EditableSyntax $_inner_left_paren;
  private EditableSyntax $_parameter_types;
  private EditableSyntax $_inner_right_paren;
  private EditableSyntax $_colon;
  private EditableSyntax $_return_type;
  private EditableSyntax $_outer_right_paren;

  public function __construct(
    EditableSyntax $outer_left_paren,
    EditableSyntax $coroutine,
    EditableSyntax $function_keyword,
    EditableSyntax $inner_left_paren,
    EditableSyntax $parameter_types,
    EditableSyntax $inner_right_paren,
    EditableSyntax $colon,
    EditableSyntax $return_type,
    EditableSyntax $outer_right_paren,
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
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $outer_left_paren = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['closure_outer_left_paren'],
      $position,
      $source,
    );
    $position += $outer_left_paren->getWidth();
    $coroutine = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['closure_coroutine'],
      $position,
      $source,
    );
    $position += $coroutine->getWidth();
    $function_keyword = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['closure_function_keyword'],
      $position,
      $source,
    );
    $position += $function_keyword->getWidth();
    $inner_left_paren = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['closure_inner_left_paren'],
      $position,
      $source,
    );
    $position += $inner_left_paren->getWidth();
    $parameter_types = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['closure_parameter_types'],
      $position,
      $source,
    );
    $position += $parameter_types->getWidth();
    $inner_right_paren = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['closure_inner_right_paren'],
      $position,
      $source,
    );
    $position += $inner_right_paren->getWidth();
    $colon = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['closure_colon'],
      $position,
      $source,
    );
    $position += $colon->getWidth();
    $return_type = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['closure_return_type'],
      $position,
      $source,
    );
    $position += $return_type->getWidth();
    $outer_right_paren = EditableSyntax::fromJSON(
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
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
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
  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $outer_left_paren = $this->_outer_left_paren->rewrite($rewriter, $parents);
    $coroutine = $this->_coroutine->rewrite($rewriter, $parents);
    $function_keyword = $this->_function_keyword->rewrite($rewriter, $parents);
    $inner_left_paren = $this->_inner_left_paren->rewrite($rewriter, $parents);
    $parameter_types = $this->_parameter_types->rewrite($rewriter, $parents);
    $inner_right_paren = $this->_inner_right_paren->rewrite($rewriter, $parents);
    $colon = $this->_colon->rewrite($rewriter, $parents);
    $return_type = $this->_return_type->rewrite($rewriter, $parents);
    $outer_right_paren = $this->_outer_right_paren->rewrite($rewriter, $parents);
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

  public function getOuterLeftParenUNTYPED(): EditableSyntax {
    return $this->_outer_left_paren;
  }

  public function withOuterLeftParen(EditableSyntax $value): this {
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

  public function getOuterLeftParen(): LeftParenToken {
    return TypeAssert::isInstanceOf(LeftParenToken::class, $this->_outer_left_paren);
  }

  public function getCoroutineUNTYPED(): EditableSyntax {
    return $this->_coroutine;
  }

  public function withCoroutine(EditableSyntax $value): this {
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

  public function getCoroutine(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_coroutine);
  }

  public function getFunctionKeywordUNTYPED(): EditableSyntax {
    return $this->_function_keyword;
  }

  public function withFunctionKeyword(EditableSyntax $value): this {
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

  public function getFunctionKeyword(): FunctionToken {
    return TypeAssert::isInstanceOf(FunctionToken::class, $this->_function_keyword);
  }

  public function getInnerLeftParenUNTYPED(): EditableSyntax {
    return $this->_inner_left_paren;
  }

  public function withInnerLeftParen(EditableSyntax $value): this {
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

  public function getInnerLeftParen(): LeftParenToken {
    return TypeAssert::isInstanceOf(LeftParenToken::class, $this->_inner_left_paren);
  }

  public function getParameterTypesUNTYPED(): EditableSyntax {
    return $this->_parameter_types;
  }

  public function withParameterTypes(EditableSyntax $value): this {
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

  public function getParameterTypes(): ?EditableList {
    if ($this->_parameter_types->isMissing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(EditableList::class, $this->_parameter_types);
  }

  public function getParameterTypesx(): EditableList {
    return TypeAssert::isInstanceOf(EditableList::class, $this->_parameter_types);
  }

  public function getInnerRightParenUNTYPED(): EditableSyntax {
    return $this->_inner_right_paren;
  }

  public function withInnerRightParen(EditableSyntax $value): this {
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

  public function getInnerRightParen(): RightParenToken {
    return TypeAssert::isInstanceOf(RightParenToken::class, $this->_inner_right_paren);
  }

  public function getColonUNTYPED(): EditableSyntax {
    return $this->_colon;
  }

  public function withColon(EditableSyntax $value): this {
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

  public function getColon(): ColonToken {
    return TypeAssert::isInstanceOf(ColonToken::class, $this->_colon);
  }

  public function getReturnTypeUNTYPED(): EditableSyntax {
    return $this->_return_type;
  }

  public function withReturnType(EditableSyntax $value): this {
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

  public function getReturnType(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_return_type);
  }

  public function getOuterRightParenUNTYPED(): EditableSyntax {
    return $this->_outer_right_paren;
  }

  public function withOuterRightParen(EditableSyntax $value): this {
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

  public function getOuterRightParen(): RightParenToken {
    return TypeAssert::isInstanceOf(RightParenToken::class, $this->_outer_right_paren);
  }
}
