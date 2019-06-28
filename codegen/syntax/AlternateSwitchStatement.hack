/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<e744b8c7eb4f10415225bfeb4c20a793>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class AlternateSwitchStatement
  extends Node
  implements IControlFlowStatement, IStatement {

  const string SYNTAX_KIND = 'alternate_switch_statement';

  private Node $_keyword;
  private Node $_left_paren;
  private Node $_expression;
  private Node $_right_paren;
  private Node $_opening_colon;
  private Node $_sections;
  private Node $_closing_endswitch;
  private Node $_closing_semicolon;

  public function __construct(
    Node $keyword,
    Node $left_paren,
    Node $expression,
    Node $right_paren,
    Node $opening_colon,
    Node $sections,
    Node $closing_endswitch,
    Node $closing_semicolon,
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
    $offset += $keyword->getWidth();
    $left_paren = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['alternate_switch_left_paren'],
      $file,
      $offset,
      $source,
      'LeftParenToken',
    );
    $offset += $left_paren->getWidth();
    $expression = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['alternate_switch_expression'],
      $file,
      $offset,
      $source,
      'VariableExpression',
    );
    $offset += $expression->getWidth();
    $right_paren = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['alternate_switch_right_paren'],
      $file,
      $offset,
      $source,
      'RightParenToken',
    );
    $offset += $right_paren->getWidth();
    $opening_colon = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['alternate_switch_opening_colon'],
      $file,
      $offset,
      $source,
      'ColonToken',
    );
    $offset += $opening_colon->getWidth();
    $sections = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['alternate_switch_sections'],
      $file,
      $offset,
      $source,
      'NodeList<SwitchSection>',
    );
    $offset += $sections->getWidth();
    $closing_endswitch = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['alternate_switch_closing_endswitch'],
      $file,
      $offset,
      $source,
      'EndswitchToken',
    );
    $offset += $closing_endswitch->getWidth();
    $closing_semicolon = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['alternate_switch_closing_semicolon'],
      $file,
      $offset,
      $source,
      'SemicolonToken',
    );
    $offset += $closing_semicolon->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      $keyword,
      $left_paren,
      $expression,
      $right_paren,
      $opening_colon,
      $sections,
      $closing_endswitch,
      $closing_semicolon,
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
    ];
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
    $sections = $rewriter($this->_sections, $parents);
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

  public function getKeywordUNTYPED(): Node {
    return $this->_keyword;
  }

  public function withKeyword(SwitchToken $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static(
      $value ?? Missing(),
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

  public function getLeftParenUNTYPED(): Node {
    return $this->_left_paren;
  }

  public function withLeftParen(LeftParenToken $value): this {
    if ($value === $this->_left_paren) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $value ?? Missing(),
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

  public function getExpressionUNTYPED(): Node {
    return $this->_expression;
  }

  public function withExpression(VariableExpression $value): this {
    if ($value === $this->_expression) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_left_paren,
      $value ?? Missing(),
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

  public function getRightParenUNTYPED(): Node {
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
      $value ?? Missing(),
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

  public function getOpeningColonUNTYPED(): Node {
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
      $value ?? Missing(),
      $this->_sections,
      $this->_closing_endswitch,
      $this->_closing_semicolon,
    );
  }

  public function hasOpeningColon(): bool {
    return !$this->_opening_colon->isMissing();
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

  public function getSectionsUNTYPED(): Node {
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
      $value ?? Missing(),
      $this->_closing_endswitch,
      $this->_closing_semicolon,
    );
  }

  public function hasSections(): bool {
    return !$this->_sections->isMissing();
  }

  /**
   * @return NodeList<SwitchSection> | null
   */
  public function getSections(): ?NodeList<SwitchSection> {
    if ($this->_sections->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(NodeList::class, $this->_sections);
  }

  /**
   * @return NodeList<SwitchSection>
   */
  public function getSectionsx(): NodeList<SwitchSection> {
    return TypeAssert\not_null($this->getSections());
  }

  public function getClosingEndswitchUNTYPED(): Node {
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
      $value ?? Missing(),
      $this->_closing_semicolon,
    );
  }

  public function hasClosingEndswitch(): bool {
    return !$this->_closing_endswitch->isMissing();
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

  public function getClosingSemicolonUNTYPED(): Node {
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
      $value ?? Missing(),
    );
  }

  public function hasClosingSemicolon(): bool {
    return !$this->_closing_semicolon->isMissing();
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
