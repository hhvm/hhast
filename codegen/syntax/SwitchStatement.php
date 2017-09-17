<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<c44fb9019996a83b336ced2542d9c8d3>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class SwitchStatement extends EditableSyntax
  implements IControlFlowStatement {

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

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['switch_keyword'],
      $position,
      $source,
    );
    $position += $keyword->getWidth();
    $left_paren = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['switch_left_paren'],
      $position,
      $source,
    );
    $position += $left_paren->getWidth();
    $expression = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['switch_expression'],
      $position,
      $source,
    );
    $position += $expression->getWidth();
    $right_paren = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['switch_right_paren'],
      $position,
      $source,
    );
    $position += $right_paren->getWidth();
    $left_brace = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['switch_left_brace'],
      $position,
      $source,
    );
    $position += $left_brace->getWidth();
    $sections = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['switch_sections'],
      $position,
      $source,
    );
    $position += $sections->getWidth();
    $right_brace = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['switch_right_brace'],
      $position,
      $source,
    );
    $position += $right_brace->getWidth();
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

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'left_paren' => $this->_left_paren;
    yield 'expression' => $this->_expression;
    yield 'right_paren' => $this->_right_paren;
    yield 'left_brace' => $this->_left_brace;
    yield 'sections' => $this->_sections;
    yield 'right_brace' => $this->_right_brace;
  }

  <<__Override>>
  public function rewriteDescendants(
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

  public function getKeywordUNTYPED(): EditableSyntax {
    return $this->_keyword;
  }

  public function withKeyword(EditableSyntax $value): this {
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

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  /**
   * @returns SwitchToken
   */
  public function getKeyword(): SwitchToken {
    return TypeAssert\instance_of(SwitchToken::class, $this->_keyword);
  }

  public function getLeftParenUNTYPED(): EditableSyntax {
    return $this->_left_paren;
  }

  public function withLeftParen(EditableSyntax $value): this {
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

  public function hasLeftParen(): bool {
    return !$this->_left_paren->isMissing();
  }

  /**
   * @returns LeftParenToken
   */
  public function getLeftParen(): LeftParenToken {
    return TypeAssert\instance_of(LeftParenToken::class, $this->_left_paren);
  }

  public function getExpressionUNTYPED(): EditableSyntax {
    return $this->_expression;
  }

  public function withExpression(EditableSyntax $value): this {
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

  public function hasExpression(): bool {
    return !$this->_expression->isMissing();
  }

  /**
   * @returns BinaryExpression | VariableExpression | FunctionCallExpression |
   * SubscriptExpression | ConditionalExpression | ObjectCreationExpression |
   * PrefixUnaryExpression | LiteralExpression | MemberSelectionExpression
   */
  public function getExpression(): EditableSyntax {
    return TypeAssert\instance_of(EditableSyntax::class, $this->_expression);
  }

  public function getRightParenUNTYPED(): EditableSyntax {
    return $this->_right_paren;
  }

  public function withRightParen(EditableSyntax $value): this {
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

  public function hasRightParen(): bool {
    return !$this->_right_paren->isMissing();
  }

  /**
   * @returns RightParenToken
   */
  public function getRightParen(): RightParenToken {
    return TypeAssert\instance_of(RightParenToken::class, $this->_right_paren);
  }

  public function getLeftBraceUNTYPED(): EditableSyntax {
    return $this->_left_brace;
  }

  public function withLeftBrace(EditableSyntax $value): this {
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

  public function hasLeftBrace(): bool {
    return !$this->_left_brace->isMissing();
  }

  /**
   * @returns LeftBraceToken | Missing
   */
  public function getLeftBrace(): ?LeftBraceToken {
    if ($this->_left_brace->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(LeftBraceToken::class, $this->_left_brace);
  }

  /**
   * @returns LeftBraceToken
   */
  public function getLeftBracex(): LeftBraceToken {
    return TypeAssert\instance_of(LeftBraceToken::class, $this->_left_brace);
  }

  public function getSectionsUNTYPED(): EditableSyntax {
    return $this->_sections;
  }

  public function withSections(EditableSyntax $value): this {
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

  public function hasSections(): bool {
    return !$this->_sections->isMissing();
  }

  /**
   * @returns EditableList | Missing
   */
  public function getSections(): ?EditableList {
    if ($this->_sections->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableList::class, $this->_sections);
  }

  /**
   * @returns EditableList
   */
  public function getSectionsx(): EditableList {
    return TypeAssert\instance_of(EditableList::class, $this->_sections);
  }

  public function getRightBraceUNTYPED(): EditableSyntax {
    return $this->_right_brace;
  }

  public function withRightBrace(EditableSyntax $value): this {
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

  public function hasRightBrace(): bool {
    return !$this->_right_brace->isMissing();
  }

  /**
   * @returns RightBraceToken | Missing
   */
  public function getRightBrace(): ?RightBraceToken {
    if ($this->_right_brace->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(RightBraceToken::class, $this->_right_brace);
  }

  /**
   * @returns RightBraceToken
   */
  public function getRightBracex(): RightBraceToken {
    return TypeAssert\instance_of(RightBraceToken::class, $this->_right_brace);
  }
}
