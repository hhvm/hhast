<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<9b2d3dc00e4950251ef4f56ef3aaba75>>
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

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $static_keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['anonymous_static_keyword'],
      $position,
      $source,
    );
    $position += $static_keyword->width();
    $async_keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['anonymous_async_keyword'],
      $position,
      $source,
    );
    $position += $async_keyword->width();
    $coroutine_keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['anonymous_coroutine_keyword'],
      $position,
      $source,
    );
    $position += $coroutine_keyword->width();
    $function_keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['anonymous_function_keyword'],
      $position,
      $source,
    );
    $position += $function_keyword->width();
    $left_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['anonymous_left_paren'],
      $position,
      $source,
    );
    $position += $left_paren->width();
    $parameters = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['anonymous_parameters'],
      $position,
      $source,
    );
    $position += $parameters->width();
    $right_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['anonymous_right_paren'],
      $position,
      $source,
    );
    $position += $right_paren->width();
    $colon = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['anonymous_colon'],
      $position,
      $source,
    );
    $position += $colon->width();
    $type = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['anonymous_type'],
      $position,
      $source,
    );
    $position += $type->width();
    $use = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['anonymous_use'],
      $position,
      $source,
    );
    $position += $use->width();
    $body = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['anonymous_body'],
      $position,
      $source,
    );
    $position += $body->width();
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

  public function children(): KeyedTraversable<string, EditableSyntax> {
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

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $static_keyword =
      $this->_static_keyword->rewrite($rewriter, $child_parents);
    $async_keyword = $this->_async_keyword->rewrite($rewriter, $child_parents);
    $coroutine_keyword =
      $this->_coroutine_keyword->rewrite($rewriter, $child_parents);
    $function_keyword =
      $this->_function_keyword->rewrite($rewriter, $child_parents);
    $left_paren = $this->_left_paren->rewrite($rewriter, $child_parents);
    $parameters = $this->_parameters->rewrite($rewriter, $child_parents);
    $right_paren = $this->_right_paren->rewrite($rewriter, $child_parents);
    $colon = $this->_colon->rewrite($rewriter, $child_parents);
    $type = $this->_type->rewrite($rewriter, $child_parents);
    $use = $this->_use->rewrite($rewriter, $child_parents);
    $body = $this->_body->rewrite($rewriter, $child_parents);
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
      $node = $this;
    } else {
      $node = new self(
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
    return $rewriter($node, $parents);
  }

  public function static_keyword(): ?StaticToken {
    return $this->_static_keyword->is_missing()
      ? null
      : TypeAssert::isInstanceOf(StaticToken::class, $this->_static_keyword);
  }

  public function static_keywordx(): StaticToken {
    return TypeAssert::isInstanceOf(StaticToken::class, $this->_static_keyword);
  }

  public function raw_static_keyword(): EditableSyntax {
    return $this->_static_keyword;
  }

  public function with_static_keyword(EditableSyntax $value): this {
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

  public function async_keyword(): ?AsyncToken {
    return $this->_async_keyword->is_missing()
      ? null
      : TypeAssert::isInstanceOf(AsyncToken::class, $this->_async_keyword);
  }

  public function async_keywordx(): AsyncToken {
    return TypeAssert::isInstanceOf(AsyncToken::class, $this->_async_keyword);
  }

  public function raw_async_keyword(): EditableSyntax {
    return $this->_async_keyword;
  }

  public function with_async_keyword(EditableSyntax $value): this {
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

  public function coroutine_keyword(): EditableSyntax {
    return $this->coroutine_keywordx();
  }

  public function coroutine_keywordx(): EditableSyntax {
    return TypeAssert::isInstanceOf(
      EditableSyntax::class,
      $this->_coroutine_keyword,
    );
  }

  public function raw_coroutine_keyword(): EditableSyntax {
    return $this->_coroutine_keyword;
  }

  public function with_coroutine_keyword(EditableSyntax $value): this {
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

  public function function_keyword(): FunctionToken {
    return $this->function_keywordx();
  }

  public function function_keywordx(): FunctionToken {
    return
      TypeAssert::isInstanceOf(FunctionToken::class, $this->_function_keyword);
  }

  public function raw_function_keyword(): EditableSyntax {
    return $this->_function_keyword;
  }

  public function with_function_keyword(EditableSyntax $value): this {
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

  public function left_paren(): ?LeftParenToken {
    return $this->_left_paren->is_missing()
      ? null
      : TypeAssert::isInstanceOf(LeftParenToken::class, $this->_left_paren);
  }

  public function left_parenx(): LeftParenToken {
    return TypeAssert::isInstanceOf(LeftParenToken::class, $this->_left_paren);
  }

  public function raw_left_paren(): EditableSyntax {
    return $this->_left_paren;
  }

  public function with_left_paren(EditableSyntax $value): this {
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

  public function parameters(): ?EditableList {
    return $this->_parameters->is_missing()
      ? null
      : TypeAssert::isInstanceOf(EditableList::class, $this->_parameters);
  }

  public function parametersx(): EditableList {
    return TypeAssert::isInstanceOf(EditableList::class, $this->_parameters);
  }

  public function raw_parameters(): EditableSyntax {
    return $this->_parameters;
  }

  public function with_parameters(EditableSyntax $value): this {
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

  public function right_paren(): ?RightParenToken {
    return $this->_right_paren->is_missing()
      ? null
      : TypeAssert::isInstanceOf(RightParenToken::class, $this->_right_paren);
  }

  public function right_parenx(): RightParenToken {
    return
      TypeAssert::isInstanceOf(RightParenToken::class, $this->_right_paren);
  }

  public function raw_right_paren(): EditableSyntax {
    return $this->_right_paren;
  }

  public function with_right_paren(EditableSyntax $value): this {
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

  public function colon(): ?ColonToken {
    return $this->_colon->is_missing()
      ? null
      : TypeAssert::isInstanceOf(ColonToken::class, $this->_colon);
  }

  public function colonx(): ColonToken {
    return TypeAssert::isInstanceOf(ColonToken::class, $this->_colon);
  }

  public function raw_colon(): EditableSyntax {
    return $this->_colon;
  }

  public function with_colon(EditableSyntax $value): this {
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

  public function type(): EditableSyntax {
    return $this->typex();
  }

  public function typex(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_type);
  }

  public function raw_type(): EditableSyntax {
    return $this->_type;
  }

  public function with_type(EditableSyntax $value): this {
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

  public function use(): ?AnonymousFunctionUseClause {
    return $this->_use->is_missing()
      ? null
      : TypeAssert::isInstanceOf(
          AnonymousFunctionUseClause::class,
          $this->_use,
        );
  }

  public function usex(): AnonymousFunctionUseClause {
    return
      TypeAssert::isInstanceOf(AnonymousFunctionUseClause::class, $this->_use);
  }

  public function raw_use(): EditableSyntax {
    return $this->_use;
  }

  public function with_use(EditableSyntax $value): this {
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

  public function body(): CompoundStatement {
    return $this->bodyx();
  }

  public function bodyx(): CompoundStatement {
    return TypeAssert::isInstanceOf(CompoundStatement::class, $this->_body);
  }

  public function raw_body(): EditableSyntax {
    return $this->_body;
  }

  public function with_body(EditableSyntax $value): this {
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
}
