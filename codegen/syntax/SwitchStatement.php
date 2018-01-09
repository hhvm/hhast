<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<b791c4acf6da61756a336a6f1fd99b57>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class SwitchStatement extends EditableNode
  implements IControlFlowStatement {

  private EditableNode $_keyword;
  private EditableNode $_left_paren;
  private EditableNode $_expression;
  private EditableNode $_right_paren;
  private EditableNode $_left_brace;
  private EditableNode $_sections;
  private EditableNode $_right_brace;

  public function __construct(
    EditableNode $keyword,
    EditableNode $left_paren,
    EditableNode $expression,
    EditableNode $right_paren,
    EditableNode $left_brace,
    EditableNode $sections,
    EditableNode $right_brace,
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
    string $file,
    int $offset,
    string $source,
  ): this {
    $keyword = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['switch_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $keyword->getWidth();
    $left_paren = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['switch_left_paren'],
      $file,
      $offset,
      $source,
    );
    $offset += $left_paren->getWidth();
    $expression = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['switch_expression'],
      $file,
      $offset,
      $source,
    );
    $offset += $expression->getWidth();
    $right_paren = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['switch_right_paren'],
      $file,
      $offset,
      $source,
    );
    $offset += $right_paren->getWidth();
    $left_brace = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['switch_left_brace'],
      $file,
      $offset,
      $source,
    );
    $offset += $left_brace->getWidth();
    $sections = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['switch_sections'],
      $file,
      $offset,
      $source,
    );
    $offset += $sections->getWidth();
    $right_brace = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['switch_right_brace'],
      $file,
      $offset,
      $source,
    );
    $offset += $right_brace->getWidth();
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
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'keyword' => $this->_keyword,
      'left_paren' => $this->_left_paren,
      'expression' => $this->_expression,
      'right_paren' => $this->_right_paren,
      'left_brace' => $this->_left_brace,
      'sections' => $this->_sections,
      'right_brace' => $this->_right_brace,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?vec<EditableNode> $parents = null,
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

  public function getKeywordUNTYPED(): EditableNode {
    return $this->_keyword;
  }

  public function withKeyword(EditableNode $value): this {
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

  public function getLeftParenUNTYPED(): EditableNode {
    return $this->_left_paren;
  }

  public function withLeftParen(EditableNode $value): this {
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

  public function getExpressionUNTYPED(): EditableNode {
    return $this->_expression;
  }

  public function withExpression(EditableNode $value): this {
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
   * @returns VariableExpression | BinaryExpression | SubscriptExpression |
   * FunctionCallExpression | ObjectCreationExpression | PrefixUnaryExpression
   * | LiteralExpression | MemberSelectionExpression
   */
  public function getExpression(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_expression);
  }

  public function getRightParenUNTYPED(): EditableNode {
    return $this->_right_paren;
  }

  public function withRightParen(EditableNode $value): this {
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

  public function getLeftBraceUNTYPED(): EditableNode {
    return $this->_left_brace;
  }

  public function withLeftBrace(EditableNode $value): this {
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

  public function getSectionsUNTYPED(): EditableNode {
    return $this->_sections;
  }

  public function withSections(EditableNode $value): this {
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

  public function getRightBraceUNTYPED(): EditableNode {
    return $this->_right_brace;
  }

  public function withRightBrace(EditableNode $value): this {
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
