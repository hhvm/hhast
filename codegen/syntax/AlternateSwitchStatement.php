<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<338e973848ea9c7507eb8e002795a66c>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class AlternateSwitchStatement
  extends EditableNode
  implements IControlFlowStatement {

  private EditableNode $_keyword;
  private EditableNode $_left_paren;
  private EditableNode $_expression;
  private EditableNode $_right_paren;
  private EditableNode $_opening_colon;
  private EditableNode $_sections;
  private EditableNode $_closing_endswitch;
  private EditableNode $_closing_semicolon;

  public function __construct(
    EditableNode $keyword,
    EditableNode $left_paren,
    EditableNode $expression,
    EditableNode $right_paren,
    EditableNode $opening_colon,
    EditableNode $sections,
    EditableNode $closing_endswitch,
    EditableNode $closing_semicolon,
  ) {
    parent::__construct('alternate_switch_statement');
    $this->_keyword = $keyword;
    $this->_left_paren = $left_paren;
    $this->_expression = $expression;
    $this->_right_paren = $right_paren;
    $this->_opening_colon = $opening_colon;
    $this->_sections = $sections;
    $this->_closing_endswitch = $closing_endswitch;
    $this->_closing_semicolon = $closing_semicolon;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
  ): this {
    $keyword = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['alternate_switch_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $keyword->getWidth();
    $left_paren = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['alternate_switch_left_paren'],
      $file,
      $offset,
      $source,
    );
    $offset += $left_paren->getWidth();
    $expression = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['alternate_switch_expression'],
      $file,
      $offset,
      $source,
    );
    $offset += $expression->getWidth();
    $right_paren = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['alternate_switch_right_paren'],
      $file,
      $offset,
      $source,
    );
    $offset += $right_paren->getWidth();
    $opening_colon = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['alternate_switch_opening_colon'],
      $file,
      $offset,
      $source,
    );
    $offset += $opening_colon->getWidth();
    $sections = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['alternate_switch_sections'],
      $file,
      $offset,
      $source,
    );
    $offset += $sections->getWidth();
    $closing_endswitch = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['alternate_switch_closing_endswitch'],
      $file,
      $offset,
      $source,
    );
    $offset += $closing_endswitch->getWidth();
    $closing_semicolon = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['alternate_switch_closing_semicolon'],
      $file,
      $offset,
      $source,
    );
    $offset += $closing_semicolon->getWidth();
    return new static(
      $keyword,
      $left_paren,
      $expression,
      $right_paren,
      $opening_colon,
      $sections,
      $closing_endswitch,
      $closing_semicolon,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'keyword' => $this->_keyword,
      'left_paren' => $this->_left_paren,
      'expression' => $this->_expression,
      'right_paren' => $this->_right_paren,
      'opening_colon' => $this->_opening_colon,
      'sections' => $this->_sections,
      'closing_endswitch' => $this->_closing_endswitch,
      'closing_semicolon' => $this->_closing_semicolon,
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
    $opening_colon = $this->_opening_colon->rewrite($rewriter, $parents);
    $sections = $this->_sections->rewrite($rewriter, $parents);
    $closing_endswitch =
      $this->_closing_endswitch->rewrite($rewriter, $parents);
    $closing_semicolon =
      $this->_closing_semicolon->rewrite($rewriter, $parents);
    if (
      $keyword === $this->_keyword &&
      $left_paren === $this->_left_paren &&
      $expression === $this->_expression &&
      $right_paren === $this->_right_paren &&
      $opening_colon === $this->_opening_colon &&
      $sections === $this->_sections &&
      $closing_endswitch === $this->_closing_endswitch &&
      $closing_semicolon === $this->_closing_semicolon
    ) {
      return $this;
    }
    return new static(
      $keyword,
      $left_paren,
      $expression,
      $right_paren,
      $opening_colon,
      $sections,
      $closing_endswitch,
      $closing_semicolon,
    );
  }

  public function getKeywordUNTYPED(): EditableNode {
    return $this->_keyword;
  }

  public function withKeyword(EditableNode $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static(
      $value,
      $this->_left_paren,
      $this->_expression,
      $this->_right_paren,
      $this->_opening_colon,
      $this->_sections,
      $this->_closing_endswitch,
      $this->_closing_semicolon,
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

  /**
   * @returns SwitchToken
   */
  public function getKeywordx(): SwitchToken {
    return $this->getKeyword();
  }

  public function getLeftParenUNTYPED(): EditableNode {
    return $this->_left_paren;
  }

  public function withLeftParen(EditableNode $value): this {
    if ($value === $this->_left_paren) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $value,
      $this->_expression,
      $this->_right_paren,
      $this->_opening_colon,
      $this->_sections,
      $this->_closing_endswitch,
      $this->_closing_semicolon,
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

  /**
   * @returns LeftParenToken
   */
  public function getLeftParenx(): LeftParenToken {
    return $this->getLeftParen();
  }

  public function getExpressionUNTYPED(): EditableNode {
    return $this->_expression;
  }

  public function withExpression(EditableNode $value): this {
    if ($value === $this->_expression) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_left_paren,
      $value,
      $this->_right_paren,
      $this->_opening_colon,
      $this->_sections,
      $this->_closing_endswitch,
      $this->_closing_semicolon,
    );
  }

  public function hasExpression(): bool {
    return !$this->_expression->isMissing();
  }

  /**
   * @returns LiteralExpression | VariableExpression
   */
  public function getExpression(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_expression);
  }

  /**
   * @returns LiteralExpression | VariableExpression
   */
  public function getExpressionx(): EditableNode {
    return $this->getExpression();
  }

  public function getRightParenUNTYPED(): EditableNode {
    return $this->_right_paren;
  }

  public function withRightParen(EditableNode $value): this {
    if ($value === $this->_right_paren) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_left_paren,
      $this->_expression,
      $value,
      $this->_opening_colon,
      $this->_sections,
      $this->_closing_endswitch,
      $this->_closing_semicolon,
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

  /**
   * @returns RightParenToken
   */
  public function getRightParenx(): RightParenToken {
    return $this->getRightParen();
  }

  public function getOpeningColonUNTYPED(): EditableNode {
    return $this->_opening_colon;
  }

  public function withOpeningColon(EditableNode $value): this {
    if ($value === $this->_opening_colon) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_left_paren,
      $this->_expression,
      $this->_right_paren,
      $value,
      $this->_sections,
      $this->_closing_endswitch,
      $this->_closing_semicolon,
    );
  }

  public function hasOpeningColon(): bool {
    return !$this->_opening_colon->isMissing();
  }

  /**
   * @returns ColonToken
   */
  public function getOpeningColon(): ColonToken {
    return TypeAssert\instance_of(ColonToken::class, $this->_opening_colon);
  }

  /**
   * @returns ColonToken
   */
  public function getOpeningColonx(): ColonToken {
    return $this->getOpeningColon();
  }

  public function getSectionsUNTYPED(): EditableNode {
    return $this->_sections;
  }

  public function withSections(EditableNode $value): this {
    if ($value === $this->_sections) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_left_paren,
      $this->_expression,
      $this->_right_paren,
      $this->_opening_colon,
      $value,
      $this->_closing_endswitch,
      $this->_closing_semicolon,
    );
  }

  public function hasSections(): bool {
    return !$this->_sections->isMissing();
  }

  /**
   * @returns EditableList
   */
  public function getSections(): EditableList {
    return TypeAssert\instance_of(EditableList::class, $this->_sections);
  }

  /**
   * @returns EditableList
   */
  public function getSectionsx(): EditableList {
    return $this->getSections();
  }

  public function getClosingEndswitchUNTYPED(): EditableNode {
    return $this->_closing_endswitch;
  }

  public function withClosingEndswitch(EditableNode $value): this {
    if ($value === $this->_closing_endswitch) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_left_paren,
      $this->_expression,
      $this->_right_paren,
      $this->_opening_colon,
      $this->_sections,
      $value,
      $this->_closing_semicolon,
    );
  }

  public function hasClosingEndswitch(): bool {
    return !$this->_closing_endswitch->isMissing();
  }

  /**
   * @returns EndswitchToken
   */
  public function getClosingEndswitch(): EndswitchToken {
    return
      TypeAssert\instance_of(EndswitchToken::class, $this->_closing_endswitch);
  }

  /**
   * @returns EndswitchToken
   */
  public function getClosingEndswitchx(): EndswitchToken {
    return $this->getClosingEndswitch();
  }

  public function getClosingSemicolonUNTYPED(): EditableNode {
    return $this->_closing_semicolon;
  }

  public function withClosingSemicolon(EditableNode $value): this {
    if ($value === $this->_closing_semicolon) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_left_paren,
      $this->_expression,
      $this->_right_paren,
      $this->_opening_colon,
      $this->_sections,
      $this->_closing_endswitch,
      $value,
    );
  }

  public function hasClosingSemicolon(): bool {
    return !$this->_closing_semicolon->isMissing();
  }

  /**
   * @returns SemicolonToken
   */
  public function getClosingSemicolon(): SemicolonToken {
    return
      TypeAssert\instance_of(SemicolonToken::class, $this->_closing_semicolon);
  }

  /**
   * @returns SemicolonToken
   */
  public function getClosingSemicolonx(): SemicolonToken {
    return $this->getClosingSemicolon();
  }
}
