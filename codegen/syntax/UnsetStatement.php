<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<8f7b9bf2866829bee960e8f1de7d18ee>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class UnsetStatement extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_left_paren;
  private EditableSyntax $_variables;
  private EditableSyntax $_right_paren;
  private EditableSyntax $_semicolon;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $left_paren,
    EditableSyntax $variables,
    EditableSyntax $right_paren,
    EditableSyntax $semicolon,
  ) {
    parent::__construct('unset_statement');
    $this->_keyword = $keyword;
    $this->_left_paren = $left_paren;
    $this->_variables = $variables;
    $this->_right_paren = $right_paren;
    $this->_semicolon = $semicolon;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['unset_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $left_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['unset_left_paren'],
      $position,
      $source,
    );
    $position += $left_paren->width();
    $variables = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['unset_variables'],
      $position,
      $source,
    );
    $position += $variables->width();
    $right_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['unset_right_paren'],
      $position,
      $source,
    );
    $position += $right_paren->width();
    $semicolon = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['unset_semicolon'],
      $position,
      $source,
    );
    $position += $semicolon->width();
    return new self(
      $keyword,
      $left_paren,
      $variables,
      $right_paren,
      $semicolon,
    );
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'left_paren' => $this->_left_paren;
    yield 'variables' => $this->_variables;
    yield 'right_paren' => $this->_right_paren;
    yield 'semicolon' => $this->_semicolon;
  }

  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $parents);
    $left_paren = $this->_left_paren->rewrite($rewriter, $parents);
    $variables = $this->_variables->rewrite($rewriter, $parents);
    $right_paren = $this->_right_paren->rewrite($rewriter, $parents);
    $semicolon = $this->_semicolon->rewrite($rewriter, $parents);
    if (
      $keyword === $this->_keyword &&
      $left_paren === $this->_left_paren &&
      $variables === $this->_variables &&
      $right_paren === $this->_right_paren &&
      $semicolon === $this->_semicolon
    ) {
      return $this;
    }
    return new self($keyword, $left_paren, $variables, $right_paren, $semicolon);
  }

  public function keyword(): UnsetToken {
    return $this->keywordx();
  }

  public function keywordx(): UnsetToken {
    return TypeAssert::isInstanceOf(UnsetToken::class, $this->_keyword);
  }

  public function raw_keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self(
      $value,
      $this->_left_paren,
      $this->_variables,
      $this->_right_paren,
      $this->_semicolon,
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
      $this->_variables,
      $this->_right_paren,
      $this->_semicolon,
    );
  }

  public function variables(): EditableList {
    return $this->variablesx();
  }

  public function variablesx(): EditableList {
    return TypeAssert::isInstanceOf(EditableList::class, $this->_variables);
  }

  public function raw_variables(): EditableSyntax {
    return $this->_variables;
  }

  public function with_variables(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $value,
      $this->_right_paren,
      $this->_semicolon,
    );
  }

  public function right_paren(): ?RightParenToken {
    return $this->_right_paren->is_missing() ? null : TypeAssert::isInstanceOf(RightParenToken::class, $this->_right_paren);
  }

  public function right_parenx(): RightParenToken {
    return TypeAssert::isInstanceOf(RightParenToken::class, $this->_right_paren);
  }

  public function raw_right_paren(): EditableSyntax {
    return $this->_right_paren;
  }

  public function with_right_paren(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $this->_variables,
      $value,
      $this->_semicolon,
    );
  }

  public function semicolon(): ?SemicolonToken {
    return $this->_semicolon->is_missing() ? null : TypeAssert::isInstanceOf(SemicolonToken::class, $this->_semicolon);
  }

  public function semicolonx(): SemicolonToken {
    return TypeAssert::isInstanceOf(SemicolonToken::class, $this->_semicolon);
  }

  public function raw_semicolon(): EditableSyntax {
    return $this->_semicolon;
  }

  public function with_semicolon(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $this->_variables,
      $this->_right_paren,
      $value,
    );
  }
}
