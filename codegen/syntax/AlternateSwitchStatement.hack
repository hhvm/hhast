/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<8cb54540c0bcdc6408409b6c53bf6c24>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class AlternateSwitchStatement
  extends Node
  implements IControlFlowStatement, IStatement {

  const string SYNTAX_KIND = 'alternate_switch_statement';

  private SwitchToken $_keyword;
  private LeftParenToken $_left_paren;
  private VariableExpression $_expression;
  private RightParenToken $_right_paren;
  private ColonToken $_opening_colon;
  private ?NodeList<SwitchSection> $_sections;
  private EndswitchToken $_closing_endswitch;
  private SemicolonToken $_closing_semicolon;

  public function __construct(
    SwitchToken $keyword,
    LeftParenToken $left_paren,
    VariableExpression $expression,
    RightParenToken $right_paren,
    ColonToken $opening_colon,
    ?NodeList<SwitchSection> $sections,
    EndswitchToken $closing_endswitch,
    SemicolonToken $closing_semicolon,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_keyword = $keyword;
    $this->_left_paren = $left_paren;
    $this->_expression = $expression;
    $this->_right_paren = $right_paren;
    $this->_opening_colon = $opening_colon;
    $this->_sections = $sections;
    $this->_closing_endswitch = $closing_endswitch;
    $this->_closing_semicolon = $closing_semicolon;
    parent::__construct($source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
    string $_type_hint,
  ): this {
    $offset = $initial_offset;
    $keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['alternate_switch_keyword'],
      $file,
      $offset,
      $source,
      'SwitchToken',
    );
    $keyword = $keyword as nonnull;
    $offset += $keyword->getWidth();
    $left_paren = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['alternate_switch_left_paren'],
      $file,
      $offset,
      $source,
      'LeftParenToken',
    );
    $left_paren = $left_paren as nonnull;
    $offset += $left_paren->getWidth();
    $expression = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['alternate_switch_expression'],
      $file,
      $offset,
      $source,
      'VariableExpression',
    );
    $expression = $expression as nonnull;
    $offset += $expression->getWidth();
    $right_paren = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['alternate_switch_right_paren'],
      $file,
      $offset,
      $source,
      'RightParenToken',
    );
    $right_paren = $right_paren as nonnull;
    $offset += $right_paren->getWidth();
    $opening_colon = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['alternate_switch_opening_colon'],
      $file,
      $offset,
      $source,
      'ColonToken',
    );
    $opening_colon = $opening_colon as nonnull;
    $offset += $opening_colon->getWidth();
    $sections = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['alternate_switch_sections'],
      $file,
      $offset,
      $source,
      'NodeList<SwitchSection>',
    );
    $offset += $sections?->getWidth() ?? 0;
    $closing_endswitch = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['alternate_switch_closing_endswitch'],
      $file,
      $offset,
      $source,
      'EndswitchToken',
    );
    $closing_endswitch = $closing_endswitch as nonnull;
    $offset += $closing_endswitch->getWidth();
    $closing_semicolon = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['alternate_switch_closing_semicolon'],
      $file,
      $offset,
      $source,
      'SemicolonToken',
    );
    $closing_semicolon = $closing_semicolon as nonnull;
    $offset += $closing_semicolon->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $keyword,
      /* HH_IGNORE_ERROR[4110] */ $left_paren,
      /* HH_IGNORE_ERROR[4110] */ $expression,
      /* HH_IGNORE_ERROR[4110] */ $right_paren,
      /* HH_IGNORE_ERROR[4110] */ $opening_colon,
      /* HH_IGNORE_ERROR[4110] */ $sections,
      /* HH_IGNORE_ERROR[4110] */ $closing_endswitch,
      /* HH_IGNORE_ERROR[4110] */ $closing_semicolon,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'keyword' => $this->_keyword,
      'left_paren' => $this->_left_paren,
      'expression' => $this->_expression,
      'right_paren' => $this->_right_paren,
      'opening_colon' => $this->_opening_colon,
      'sections' => $this->_sections,
      'closing_endswitch' => $this->_closing_endswitch,
      'closing_semicolon' => $this->_closing_semicolon,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $keyword = $rewriter($this->_keyword, $parents);
    $left_paren = $rewriter($this->_left_paren, $parents);
    $expression = $rewriter($this->_expression, $parents);
    $right_paren = $rewriter($this->_right_paren, $parents);
    $opening_colon = $rewriter($this->_opening_colon, $parents);
    $sections = $this->_sections === null
      ? null
      : $rewriter($this->_sections, $parents);
    $closing_endswitch = $rewriter($this->_closing_endswitch, $parents);
    $closing_semicolon = $rewriter($this->_closing_semicolon, $parents);
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
      /* HH_FIXME[4110] use `as` */ $keyword,
      /* HH_FIXME[4110] use `as` */ $left_paren,
      /* HH_FIXME[4110] use `as` */ $expression,
      /* HH_FIXME[4110] use `as` */ $right_paren,
      /* HH_FIXME[4110] use `as` */ $opening_colon,
      /* HH_FIXME[4110] use `as` */ $sections,
      /* HH_FIXME[4110] use `as` */ $closing_endswitch,
      /* HH_FIXME[4110] use `as` */ $closing_semicolon,
    );
  }

  public function getKeywordUNTYPED(): ?Node {
    return $this->_keyword;
  }

  public function withKeyword(SwitchToken $value): this {
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
    return $this->_keyword !== null;
  }

  /**
   * @return SwitchToken
   */
  public function getKeyword(): SwitchToken {
    return TypeAssert\instance_of(SwitchToken::class, $this->_keyword);
  }

  /**
   * @return SwitchToken
   */
  public function getKeywordx(): SwitchToken {
    return $this->getKeyword();
  }

  public function getLeftParenUNTYPED(): ?Node {
    return $this->_left_paren;
  }

  public function withLeftParen(LeftParenToken $value): this {
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
    return $this->_left_paren !== null;
  }

  /**
   * @return LeftParenToken
   */
  public function getLeftParen(): LeftParenToken {
    return TypeAssert\instance_of(LeftParenToken::class, $this->_left_paren);
  }

  /**
   * @return LeftParenToken
   */
  public function getLeftParenx(): LeftParenToken {
    return $this->getLeftParen();
  }

  public function getExpressionUNTYPED(): ?Node {
    return $this->_expression;
  }

  public function withExpression(VariableExpression $value): this {
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
    return $this->_expression !== null;
  }

  /**
   * @return VariableExpression
   */
  public function getExpression(): VariableExpression {
    return TypeAssert\instance_of(
      VariableExpression::class,
      $this->_expression,
    );
  }

  /**
   * @return VariableExpression
   */
  public function getExpressionx(): VariableExpression {
    return $this->getExpression();
  }

  public function getRightParenUNTYPED(): ?Node {
    return $this->_right_paren;
  }

  public function withRightParen(RightParenToken $value): this {
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
    return $this->_right_paren !== null;
  }

  /**
   * @return RightParenToken
   */
  public function getRightParen(): RightParenToken {
    return TypeAssert\instance_of(RightParenToken::class, $this->_right_paren);
  }

  /**
   * @return RightParenToken
   */
  public function getRightParenx(): RightParenToken {
    return $this->getRightParen();
  }

  public function getOpeningColonUNTYPED(): ?Node {
    return $this->_opening_colon;
  }

  public function withOpeningColon(ColonToken $value): this {
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
    return $this->_opening_colon !== null;
  }

  /**
   * @return ColonToken
   */
  public function getOpeningColon(): ColonToken {
    return TypeAssert\instance_of(ColonToken::class, $this->_opening_colon);
  }

  /**
   * @return ColonToken
   */
  public function getOpeningColonx(): ColonToken {
    return $this->getOpeningColon();
  }

  public function getSectionsUNTYPED(): ?Node {
    return $this->_sections;
  }

  public function withSections(?NodeList<SwitchSection> $value): this {
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
    return $this->_sections !== null;
  }

  /**
   * @return NodeList<SwitchSection> | null
   */
  public function getSections(): ?NodeList<SwitchSection> {
    return $this->_sections;
  }

  /**
   * @return NodeList<SwitchSection>
   */
  public function getSectionsx(): NodeList<SwitchSection> {
    return TypeAssert\not_null($this->getSections());
  }

  public function getClosingEndswitchUNTYPED(): ?Node {
    return $this->_closing_endswitch;
  }

  public function withClosingEndswitch(EndswitchToken $value): this {
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
    return $this->_closing_endswitch !== null;
  }

  /**
   * @return EndswitchToken
   */
  public function getClosingEndswitch(): EndswitchToken {
    return TypeAssert\instance_of(
      EndswitchToken::class,
      $this->_closing_endswitch,
    );
  }

  /**
   * @return EndswitchToken
   */
  public function getClosingEndswitchx(): EndswitchToken {
    return $this->getClosingEndswitch();
  }

  public function getClosingSemicolonUNTYPED(): ?Node {
    return $this->_closing_semicolon;
  }

  public function withClosingSemicolon(SemicolonToken $value): this {
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
    return $this->_closing_semicolon !== null;
  }

  /**
   * @return SemicolonToken
   */
  public function getClosingSemicolon(): SemicolonToken {
    return TypeAssert\instance_of(
      SemicolonToken::class,
      $this->_closing_semicolon,
    );
  }

  /**
   * @return SemicolonToken
   */
  public function getClosingSemicolonx(): SemicolonToken {
    return $this->getClosingSemicolon();
  }
}
