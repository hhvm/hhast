<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<34fe1a956b7ca7c7d9ec60262d223b16>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class CatchClause extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_left_paren;
  private EditableSyntax $_type;
  private EditableSyntax $_variable;
  private EditableSyntax $_right_paren;
  private EditableSyntax $_body;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $left_paren,
    EditableSyntax $type,
    EditableSyntax $variable,
    EditableSyntax $right_paren,
    EditableSyntax $body,
  ) {
    parent::__construct('catch_clause');
    $this->_keyword = $keyword;
    $this->_left_paren = $left_paren;
    $this->_type = $type;
    $this->_variable = $variable;
    $this->_right_paren = $right_paren;
    $this->_body = $body;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['catch_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $left_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['catch_left_paren'],
      $position,
      $source,
    );
    $position += $left_paren->width();
    $type = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['catch_type'],
      $position,
      $source,
    );
    $position += $type->width();
    $variable = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['catch_variable'],
      $position,
      $source,
    );
    $position += $variable->width();
    $right_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['catch_right_paren'],
      $position,
      $source,
    );
    $position += $right_paren->width();
    $body = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['catch_body'],
      $position,
      $source,
    );
    $position += $body->width();
    return
      new self($keyword, $left_paren, $type, $variable, $right_paren, $body);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'left_paren' => $this->_left_paren;
    yield 'type' => $this->_type;
    yield 'variable' => $this->_variable;
    yield 'right_paren' => $this->_right_paren;
    yield 'body' => $this->_body;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $left_paren = $this->_left_paren->rewrite($rewriter, $child_parents);
    $type = $this->_type->rewrite($rewriter, $child_parents);
    $variable = $this->_variable->rewrite($rewriter, $child_parents);
    $right_paren = $this->_right_paren->rewrite($rewriter, $child_parents);
    $body = $this->_body->rewrite($rewriter, $child_parents);
    if (
      $keyword === $this->_keyword &&
      $left_paren === $this->_left_paren &&
      $type === $this->_type &&
      $variable === $this->_variable &&
      $right_paren === $this->_right_paren &&
      $body === $this->_body
    ) {
      $node = $this;
    } else {
      $node =
        new self($keyword, $left_paren, $type, $variable, $right_paren, $body);
    }
    return $rewriter($node, $parents);
  }

  public function keyword(): CatchToken {
    return $this->keywordx();
  }

  public function keywordx(): CatchToken {
    return TypeAssert::isInstanceOf(CatchToken::class, $this->_keyword);
  }

  public function raw_keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self(
      $value,
      $this->_left_paren,
      $this->_type,
      $this->_variable,
      $this->_right_paren,
      $this->_body,
    );
  }

  public function left_paren(): LeftParenToken {
    return $this->left_parenx();
  }

  public function left_parenx(): LeftParenToken {
    return TypeAssert::isInstanceOf(LeftParenToken::class, $this->_left_paren);
  }

  public function raw_left_paren(): EditableSyntax {
    return $this->_left_paren;
  }

  public function with_left_paren(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $value,
      $this->_type,
      $this->_variable,
      $this->_right_paren,
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
      $this->_keyword,
      $this->_left_paren,
      $value,
      $this->_variable,
      $this->_right_paren,
      $this->_body,
    );
  }

  public function variable(): ?VariableToken {
    return $this->_variable->is_missing()
      ? null
      : TypeAssert::isInstanceOf(VariableToken::class, $this->_variable);
  }

  public function variablex(): VariableToken {
    return TypeAssert::isInstanceOf(VariableToken::class, $this->_variable);
  }

  public function raw_variable(): EditableSyntax {
    return $this->_variable;
  }

  public function with_variable(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $this->_type,
      $value,
      $this->_right_paren,
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
      $this->_keyword,
      $this->_left_paren,
      $this->_type,
      $this->_variable,
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
      $this->_keyword,
      $this->_left_paren,
      $this->_type,
      $this->_variable,
      $this->_right_paren,
      $value,
    );
  }
}
