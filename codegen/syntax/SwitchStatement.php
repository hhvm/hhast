<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<e7401513ddcf509b24bdea179d2f8ddf>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class SwitchStatement extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_left_paren;
  private EditableSyntax $_expression;
  private EditableSyntax $_right_paren;
  private EditableSyntax $_left_brace;
  private EditableSyntax $_sections;
  private EditableSyntax $_right_brace;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $left_paren,
    EditableSyntax $expression,
    EditableSyntax $right_paren,
    EditableSyntax $left_brace,
    EditableSyntax $sections,
    EditableSyntax $right_brace,
  ) {
    parent::__construct('switch_statement');
    $this->_keyword = $keyword;
    $this->_left_paren = $left_paren;
    $this->_expression = $expression;
    $this->_right_paren = $right_paren;
    $this->_left_brace = $left_brace;
    $this->_sections = $sections;
    $this->_right_brace = $right_brace;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['switch_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $left_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['switch_left_paren'],
      $position,
      $source,
    );
    $position += $left_paren->width();
    $expression = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['switch_expression'],
      $position,
      $source,
    );
    $position += $expression->width();
    $right_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['switch_right_paren'],
      $position,
      $source,
    );
    $position += $right_paren->width();
    $left_brace = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['switch_left_brace'],
      $position,
      $source,
    );
    $position += $left_brace->width();
    $sections = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['switch_sections'],
      $position,
      $source,
    );
    $position += $sections->width();
    $right_brace = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['switch_right_brace'],
      $position,
      $source,
    );
    $position += $right_brace->width();
    return new self(
      $keyword,
      $left_paren,
      $expression,
      $right_paren,
      $left_brace,
      $sections,
      $right_brace,
    );
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'left_paren' => $this->_left_paren;
    yield 'expression' => $this->_expression;
    yield 'right_paren' => $this->_right_paren;
    yield 'left_brace' => $this->_left_brace;
    yield 'sections' => $this->_sections;
    yield 'right_brace' => $this->_right_brace;
  }

  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $parents);
    $left_paren = $this->_left_paren->rewrite($rewriter, $parents);
    $expression = $this->_expression->rewrite($rewriter, $parents);
    $right_paren = $this->_right_paren->rewrite($rewriter, $parents);
    $left_brace = $this->_left_brace->rewrite($rewriter, $parents);
    $sections = $this->_sections->rewrite($rewriter, $parents);
    $right_brace = $this->_right_brace->rewrite($rewriter, $parents);
    if (
      $keyword === $this->_keyword &&
      $left_paren === $this->_left_paren &&
      $expression === $this->_expression &&
      $right_paren === $this->_right_paren &&
      $left_brace === $this->_left_brace &&
      $sections === $this->_sections &&
      $right_brace === $this->_right_brace
    ) {
      return $this;
    }
    return new self(
      $keyword,
      $left_paren,
      $expression,
      $right_paren,
      $left_brace,
      $sections,
      $right_brace,
    );
  }

  public function keyword(): SwitchToken {
    return $this->keywordx();
  }

  public function keywordx(): SwitchToken {
    return TypeAssert::isInstanceOf(SwitchToken::class, $this->_keyword);
  }

  public function raw_keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new self(
      $value,
      $this->_left_paren,
      $this->_expression,
      $this->_right_paren,
      $this->_left_brace,
      $this->_sections,
      $this->_right_brace,
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
    if ($value === $this->_left_paren) {
      return $this;
    }
    return new self(
      $this->_keyword,
      $value,
      $this->_expression,
      $this->_right_paren,
      $this->_left_brace,
      $this->_sections,
      $this->_right_brace,
    );
  }

  public function expression(): EditableSyntax {
    return $this->expressionx();
  }

  public function expressionx(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_expression);
  }

  public function raw_expression(): EditableSyntax {
    return $this->_expression;
  }

  public function with_expression(EditableSyntax $value): this {
    if ($value === $this->_expression) {
      return $this;
    }
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $value,
      $this->_right_paren,
      $this->_left_brace,
      $this->_sections,
      $this->_right_brace,
    );
  }

  public function right_paren(): RightParenToken {
    return $this->right_parenx();
  }

  public function right_parenx(): RightParenToken {
    return TypeAssert::isInstanceOf(RightParenToken::class, $this->_right_paren);
  }

  public function raw_right_paren(): EditableSyntax {
    return $this->_right_paren;
  }

  public function with_right_paren(EditableSyntax $value): this {
    if ($value === $this->_right_paren) {
      return $this;
    }
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $this->_expression,
      $value,
      $this->_left_brace,
      $this->_sections,
      $this->_right_brace,
    );
  }

  public function left_brace(): ?LeftBraceToken {
    return $this->_left_brace->is_missing() ? null : TypeAssert::isInstanceOf(LeftBraceToken::class, $this->_left_brace);
  }

  public function left_bracex(): LeftBraceToken {
    return TypeAssert::isInstanceOf(LeftBraceToken::class, $this->_left_brace);
  }

  public function raw_left_brace(): EditableSyntax {
    return $this->_left_brace;
  }

  public function with_left_brace(EditableSyntax $value): this {
    if ($value === $this->_left_brace) {
      return $this;
    }
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $this->_expression,
      $this->_right_paren,
      $value,
      $this->_sections,
      $this->_right_brace,
    );
  }

  public function sections(): ?EditableList {
    return $this->_sections->is_missing() ? null : TypeAssert::isInstanceOf(EditableList::class, $this->_sections);
  }

  public function sectionsx(): EditableList {
    return TypeAssert::isInstanceOf(EditableList::class, $this->_sections);
  }

  public function raw_sections(): EditableSyntax {
    return $this->_sections;
  }

  public function with_sections(EditableSyntax $value): this {
    if ($value === $this->_sections) {
      return $this;
    }
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $this->_expression,
      $this->_right_paren,
      $this->_left_brace,
      $value,
      $this->_right_brace,
    );
  }

  public function right_brace(): ?RightBraceToken {
    return $this->_right_brace->is_missing() ? null : TypeAssert::isInstanceOf(RightBraceToken::class, $this->_right_brace);
  }

  public function right_bracex(): RightBraceToken {
    return TypeAssert::isInstanceOf(RightBraceToken::class, $this->_right_brace);
  }

  public function raw_right_brace(): EditableSyntax {
    return $this->_right_brace;
  }

  public function with_right_brace(EditableSyntax $value): this {
    if ($value === $this->_right_brace) {
      return $this;
    }
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $this->_expression,
      $this->_right_paren,
      $this->_left_brace,
      $this->_sections,
      $value,
    );
  }
}
