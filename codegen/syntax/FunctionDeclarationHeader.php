<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<0bc1e11671eae4642c53fb6ef26ba459>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class FunctionDeclarationHeader extends EditableSyntax {

  private EditableSyntax $_async;
  private EditableSyntax $_coroutine;
  private EditableSyntax $_keyword;
  private EditableSyntax $_ampersand;
  private EditableSyntax $_name;
  private EditableSyntax $_type_parameter_list;
  private EditableSyntax $_left_paren;
  private EditableSyntax $_parameter_list;
  private EditableSyntax $_right_paren;
  private EditableSyntax $_colon;
  private EditableSyntax $_type;
  private EditableSyntax $_where_clause;

  public function __construct(
    EditableSyntax $async,
    EditableSyntax $coroutine,
    EditableSyntax $keyword,
    EditableSyntax $ampersand,
    EditableSyntax $name,
    EditableSyntax $type_parameter_list,
    EditableSyntax $left_paren,
    EditableSyntax $parameter_list,
    EditableSyntax $right_paren,
    EditableSyntax $colon,
    EditableSyntax $type,
    EditableSyntax $where_clause,
  ) {
    parent::__construct('function_declaration_header');
    $this->_async = $async;
    $this->_coroutine = $coroutine;
    $this->_keyword = $keyword;
    $this->_ampersand = $ampersand;
    $this->_name = $name;
    $this->_type_parameter_list = $type_parameter_list;
    $this->_left_paren = $left_paren;
    $this->_parameter_list = $parameter_list;
    $this->_right_paren = $right_paren;
    $this->_colon = $colon;
    $this->_type = $type;
    $this->_where_clause = $where_clause;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $async = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['function_async'],
      $position,
      $source,
    );
    $position += $async->width();
    $coroutine = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['function_coroutine'],
      $position,
      $source,
    );
    $position += $coroutine->width();
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['function_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $ampersand = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['function_ampersand'],
      $position,
      $source,
    );
    $position += $ampersand->width();
    $name = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['function_name'],
      $position,
      $source,
    );
    $position += $name->width();
    $type_parameter_list = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['function_type_parameter_list'],
      $position,
      $source,
    );
    $position += $type_parameter_list->width();
    $left_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['function_left_paren'],
      $position,
      $source,
    );
    $position += $left_paren->width();
    $parameter_list = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['function_parameter_list'],
      $position,
      $source,
    );
    $position += $parameter_list->width();
    $right_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['function_right_paren'],
      $position,
      $source,
    );
    $position += $right_paren->width();
    $colon = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['function_colon'],
      $position,
      $source,
    );
    $position += $colon->width();
    $type = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['function_type'],
      $position,
      $source,
    );
    $position += $type->width();
    $where_clause = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['function_where_clause'],
      $position,
      $source,
    );
    $position += $where_clause->width();
    return new self(
      $async,
      $coroutine,
      $keyword,
      $ampersand,
      $name,
      $type_parameter_list,
      $left_paren,
      $parameter_list,
      $right_paren,
      $colon,
      $type,
      $where_clause,
    );
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'async' => $this->_async;
    yield 'coroutine' => $this->_coroutine;
    yield 'keyword' => $this->_keyword;
    yield 'ampersand' => $this->_ampersand;
    yield 'name' => $this->_name;
    yield 'type_parameter_list' => $this->_type_parameter_list;
    yield 'left_paren' => $this->_left_paren;
    yield 'parameter_list' => $this->_parameter_list;
    yield 'right_paren' => $this->_right_paren;
    yield 'colon' => $this->_colon;
    yield 'type' => $this->_type;
    yield 'where_clause' => $this->_where_clause;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $async = $this->_async->rewrite($rewriter, $child_parents);
    $coroutine = $this->_coroutine->rewrite($rewriter, $child_parents);
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $ampersand = $this->_ampersand->rewrite($rewriter, $child_parents);
    $name = $this->_name->rewrite($rewriter, $child_parents);
    $type_parameter_list =
      $this->_type_parameter_list->rewrite($rewriter, $child_parents);
    $left_paren = $this->_left_paren->rewrite($rewriter, $child_parents);
    $parameter_list =
      $this->_parameter_list->rewrite($rewriter, $child_parents);
    $right_paren = $this->_right_paren->rewrite($rewriter, $child_parents);
    $colon = $this->_colon->rewrite($rewriter, $child_parents);
    $type = $this->_type->rewrite($rewriter, $child_parents);
    $where_clause = $this->_where_clause->rewrite($rewriter, $child_parents);
    if (
      $async === $this->_async &&
      $coroutine === $this->_coroutine &&
      $keyword === $this->_keyword &&
      $ampersand === $this->_ampersand &&
      $name === $this->_name &&
      $type_parameter_list === $this->_type_parameter_list &&
      $left_paren === $this->_left_paren &&
      $parameter_list === $this->_parameter_list &&
      $right_paren === $this->_right_paren &&
      $colon === $this->_colon &&
      $type === $this->_type &&
      $where_clause === $this->_where_clause
    ) {
      $node = $this;
    } else {
      $node = new self(
        $async,
        $coroutine,
        $keyword,
        $ampersand,
        $name,
        $type_parameter_list,
        $left_paren,
        $parameter_list,
        $right_paren,
        $colon,
        $type,
        $where_clause,
      );
    }
    return $rewriter($node, $parents);
  }

  public function async(): ?AsyncToken {
    return $this->_async->is_missing()
      ? null
      : TypeAssert::isInstanceOf(AsyncToken::class, $this->_async);
  }

  public function asyncx(): AsyncToken {
    return TypeAssert::isInstanceOf(AsyncToken::class, $this->_async);
  }

  public function raw_async(): EditableSyntax {
    return $this->_async;
  }

  public function with_async(EditableSyntax $value): this {
    return new self(
      $value,
      $this->_coroutine,
      $this->_keyword,
      $this->_ampersand,
      $this->_name,
      $this->_type_parameter_list,
      $this->_left_paren,
      $this->_parameter_list,
      $this->_right_paren,
      $this->_colon,
      $this->_type,
      $this->_where_clause,
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
    return new self(
      $this->_async,
      $value,
      $this->_keyword,
      $this->_ampersand,
      $this->_name,
      $this->_type_parameter_list,
      $this->_left_paren,
      $this->_parameter_list,
      $this->_right_paren,
      $this->_colon,
      $this->_type,
      $this->_where_clause,
    );
  }

  public function keyword(): ?FunctionToken {
    return $this->_keyword->is_missing()
      ? null
      : TypeAssert::isInstanceOf(FunctionToken::class, $this->_keyword);
  }

  public function keywordx(): FunctionToken {
    return TypeAssert::isInstanceOf(FunctionToken::class, $this->_keyword);
  }

  public function raw_keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self(
      $this->_async,
      $this->_coroutine,
      $value,
      $this->_ampersand,
      $this->_name,
      $this->_type_parameter_list,
      $this->_left_paren,
      $this->_parameter_list,
      $this->_right_paren,
      $this->_colon,
      $this->_type,
      $this->_where_clause,
    );
  }

  public function ampersand(): ?AmpersandToken {
    return $this->_ampersand->is_missing()
      ? null
      : TypeAssert::isInstanceOf(AmpersandToken::class, $this->_ampersand);
  }

  public function ampersandx(): AmpersandToken {
    return TypeAssert::isInstanceOf(AmpersandToken::class, $this->_ampersand);
  }

  public function raw_ampersand(): EditableSyntax {
    return $this->_ampersand;
  }

  public function with_ampersand(EditableSyntax $value): this {
    return new self(
      $this->_async,
      $this->_coroutine,
      $this->_keyword,
      $value,
      $this->_name,
      $this->_type_parameter_list,
      $this->_left_paren,
      $this->_parameter_list,
      $this->_right_paren,
      $this->_colon,
      $this->_type,
      $this->_where_clause,
    );
  }

  public function name(): EditableSyntax {
    return $this->namex();
  }

  public function namex(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_name);
  }

  public function raw_name(): EditableSyntax {
    return $this->_name;
  }

  public function with_name(EditableSyntax $value): this {
    return new self(
      $this->_async,
      $this->_coroutine,
      $this->_keyword,
      $this->_ampersand,
      $value,
      $this->_type_parameter_list,
      $this->_left_paren,
      $this->_parameter_list,
      $this->_right_paren,
      $this->_colon,
      $this->_type,
      $this->_where_clause,
    );
  }

  public function type_parameter_list(): ?TypeParameters {
    return $this->_type_parameter_list->is_missing()
      ? null
      : TypeAssert::isInstanceOf(
          TypeParameters::class,
          $this->_type_parameter_list,
        );
  }

  public function type_parameter_listx(): TypeParameters {
    return TypeAssert::isInstanceOf(
      TypeParameters::class,
      $this->_type_parameter_list,
    );
  }

  public function raw_type_parameter_list(): EditableSyntax {
    return $this->_type_parameter_list;
  }

  public function with_type_parameter_list(EditableSyntax $value): this {
    return new self(
      $this->_async,
      $this->_coroutine,
      $this->_keyword,
      $this->_ampersand,
      $this->_name,
      $value,
      $this->_left_paren,
      $this->_parameter_list,
      $this->_right_paren,
      $this->_colon,
      $this->_type,
      $this->_where_clause,
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
      $this->_async,
      $this->_coroutine,
      $this->_keyword,
      $this->_ampersand,
      $this->_name,
      $this->_type_parameter_list,
      $value,
      $this->_parameter_list,
      $this->_right_paren,
      $this->_colon,
      $this->_type,
      $this->_where_clause,
    );
  }

  public function parameter_list(): ?EditableList {
    return $this->_parameter_list->is_missing()
      ? null
      : TypeAssert::isInstanceOf(EditableList::class, $this->_parameter_list);
  }

  public function parameter_listx(): EditableList {
    return
      TypeAssert::isInstanceOf(EditableList::class, $this->_parameter_list);
  }

  public function raw_parameter_list(): EditableSyntax {
    return $this->_parameter_list;
  }

  public function with_parameter_list(EditableSyntax $value): this {
    return new self(
      $this->_async,
      $this->_coroutine,
      $this->_keyword,
      $this->_ampersand,
      $this->_name,
      $this->_type_parameter_list,
      $this->_left_paren,
      $value,
      $this->_right_paren,
      $this->_colon,
      $this->_type,
      $this->_where_clause,
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
      $this->_async,
      $this->_coroutine,
      $this->_keyword,
      $this->_ampersand,
      $this->_name,
      $this->_type_parameter_list,
      $this->_left_paren,
      $this->_parameter_list,
      $value,
      $this->_colon,
      $this->_type,
      $this->_where_clause,
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
      $this->_async,
      $this->_coroutine,
      $this->_keyword,
      $this->_ampersand,
      $this->_name,
      $this->_type_parameter_list,
      $this->_left_paren,
      $this->_parameter_list,
      $this->_right_paren,
      $value,
      $this->_type,
      $this->_where_clause,
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
      $this->_async,
      $this->_coroutine,
      $this->_keyword,
      $this->_ampersand,
      $this->_name,
      $this->_type_parameter_list,
      $this->_left_paren,
      $this->_parameter_list,
      $this->_right_paren,
      $this->_colon,
      $value,
      $this->_where_clause,
    );
  }

  public function where_clause(): ?WhereClause {
    return $this->_where_clause->is_missing()
      ? null
      : TypeAssert::isInstanceOf(WhereClause::class, $this->_where_clause);
  }

  public function where_clausex(): WhereClause {
    return TypeAssert::isInstanceOf(WhereClause::class, $this->_where_clause);
  }

  public function raw_where_clause(): EditableSyntax {
    return $this->_where_clause;
  }

  public function with_where_clause(EditableSyntax $value): this {
    return new self(
      $this->_async,
      $this->_coroutine,
      $this->_keyword,
      $this->_ampersand,
      $this->_name,
      $this->_type_parameter_list,
      $this->_left_paren,
      $this->_parameter_list,
      $this->_right_paren,
      $this->_colon,
      $this->_type,
      $value,
    );
  }
}
