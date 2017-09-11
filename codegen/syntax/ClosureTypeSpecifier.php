<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<8d2422070034a5fd7cb0a096bdc11a6e>>
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

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $outer_left_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['closure_outer_left_paren'],
      $position,
      $source,
    );
    $position += $outer_left_paren->width();
    $coroutine = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['closure_coroutine'],
      $position,
      $source,
    );
    $position += $coroutine->width();
    $function_keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['closure_function_keyword'],
      $position,
      $source,
    );
    $position += $function_keyword->width();
    $inner_left_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['closure_inner_left_paren'],
      $position,
      $source,
    );
    $position += $inner_left_paren->width();
    $parameter_types = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['closure_parameter_types'],
      $position,
      $source,
    );
    $position += $parameter_types->width();
    $inner_right_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['closure_inner_right_paren'],
      $position,
      $source,
    );
    $position += $inner_right_paren->width();
    $colon = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['closure_colon'],
      $position,
      $source,
    );
    $position += $colon->width();
    $return_type = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['closure_return_type'],
      $position,
      $source,
    );
    $position += $return_type->width();
    $outer_right_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['closure_outer_right_paren'],
      $position,
      $source,
    );
    $position += $outer_right_paren->width();
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

  public function children(): KeyedTraversable<string, EditableSyntax> {
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

  public function outer_left_paren(): LeftParenToken {
    return $this->outer_left_parenx();
  }

  public function outer_left_parenx(): LeftParenToken {
    return TypeAssert::isInstanceOf(LeftParenToken::class, $this->_outer_left_paren);
  }

  public function raw_outer_left_paren(): EditableSyntax {
    return $this->_outer_left_paren;
  }

  public function with_outer_left_paren(EditableSyntax $value): this {
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

  public function function_keyword(): FunctionToken {
    return $this->function_keywordx();
  }

  public function function_keywordx(): FunctionToken {
    return TypeAssert::isInstanceOf(FunctionToken::class, $this->_function_keyword);
  }

  public function raw_function_keyword(): EditableSyntax {
    return $this->_function_keyword;
  }

  public function with_function_keyword(EditableSyntax $value): this {
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

  public function inner_left_paren(): LeftParenToken {
    return $this->inner_left_parenx();
  }

  public function inner_left_parenx(): LeftParenToken {
    return TypeAssert::isInstanceOf(LeftParenToken::class, $this->_inner_left_paren);
  }

  public function raw_inner_left_paren(): EditableSyntax {
    return $this->_inner_left_paren;
  }

  public function with_inner_left_paren(EditableSyntax $value): this {
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

  public function parameter_types(): ?EditableList {
    return $this->_parameter_types->is_missing() ? null : TypeAssert::isInstanceOf(EditableList::class, $this->_parameter_types);
  }

  public function parameter_typesx(): EditableList {
    return TypeAssert::isInstanceOf(EditableList::class, $this->_parameter_types);
  }

  public function raw_parameter_types(): EditableSyntax {
    return $this->_parameter_types;
  }

  public function with_parameter_types(EditableSyntax $value): this {
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

  public function inner_right_paren(): RightParenToken {
    return $this->inner_right_parenx();
  }

  public function inner_right_parenx(): RightParenToken {
    return TypeAssert::isInstanceOf(RightParenToken::class, $this->_inner_right_paren);
  }

  public function raw_inner_right_paren(): EditableSyntax {
    return $this->_inner_right_paren;
  }

  public function with_inner_right_paren(EditableSyntax $value): this {
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

  public function colon(): ColonToken {
    return $this->colonx();
  }

  public function colonx(): ColonToken {
    return TypeAssert::isInstanceOf(ColonToken::class, $this->_colon);
  }

  public function raw_colon(): EditableSyntax {
    return $this->_colon;
  }

  public function with_colon(EditableSyntax $value): this {
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

  public function return_type(): EditableSyntax {
    return $this->return_typex();
  }

  public function return_typex(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_return_type);
  }

  public function raw_return_type(): EditableSyntax {
    return $this->_return_type;
  }

  public function with_return_type(EditableSyntax $value): this {
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

  public function outer_right_paren(): RightParenToken {
    return $this->outer_right_parenx();
  }

  public function outer_right_parenx(): RightParenToken {
    return TypeAssert::isInstanceOf(RightParenToken::class, $this->_outer_right_paren);
  }

  public function raw_outer_right_paren(): EditableSyntax {
    return $this->_outer_right_paren;
  }

  public function with_outer_right_paren(EditableSyntax $value): this {
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
}
