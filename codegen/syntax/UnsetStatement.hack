/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<1b7a46747b4e718e1f59f558ce30067d>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class UnsetStatement extends Node implements IStatement {

  const string SYNTAX_KIND = 'unset_statement';

  private UnsetToken $_keyword;
  private LeftParenToken $_left_paren;
  private NodeList<ListItem<IExpression>> $_variables;
  private RightParenToken $_right_paren;
  private SemicolonToken $_semicolon;

  public function __construct(
    UnsetToken $keyword,
    LeftParenToken $left_paren,
    NodeList<ListItem<IExpression>> $variables,
    RightParenToken $right_paren,
    SemicolonToken $semicolon,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_keyword = $keyword;
    $this->_left_paren = $left_paren;
    $this->_variables = $variables;
    $this->_right_paren = $right_paren;
    $this->_semicolon = $semicolon;
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
      /* HH_FIXME[4110] */ $json['unset_keyword'],
      $file,
      $offset,
      $source,
      'UnsetToken',
    );
    $keyword = $keyword as nonnull;
    $offset += $keyword->getWidth();
    $left_paren = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['unset_left_paren'],
      $file,
      $offset,
      $source,
      'LeftParenToken',
    );
    $left_paren = $left_paren as nonnull;
    $offset += $left_paren->getWidth();
    $variables = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['unset_variables'],
      $file,
      $offset,
      $source,
      'NodeList<ListItem<IExpression>>',
    );
    $variables = $variables as nonnull;
    $offset += $variables->getWidth();
    $right_paren = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['unset_right_paren'],
      $file,
      $offset,
      $source,
      'RightParenToken',
    );
    $right_paren = $right_paren as nonnull;
    $offset += $right_paren->getWidth();
    $semicolon = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['unset_semicolon'],
      $file,
      $offset,
      $source,
      'SemicolonToken',
    );
    $semicolon = $semicolon as nonnull;
    $offset += $semicolon->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $keyword,
      /* HH_IGNORE_ERROR[4110] */ $left_paren,
      /* HH_IGNORE_ERROR[4110] */ $variables,
      /* HH_IGNORE_ERROR[4110] */ $right_paren,
      /* HH_IGNORE_ERROR[4110] */ $semicolon,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'keyword' => $this->_keyword,
      'left_paren' => $this->_left_paren,
      'variables' => $this->_variables,
      'right_paren' => $this->_right_paren,
      'semicolon' => $this->_semicolon,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $keyword = $rewriter($this->_keyword, $parents);
    $left_paren = $rewriter($this->_left_paren, $parents);
    $variables = $rewriter($this->_variables, $parents);
    $right_paren = $rewriter($this->_right_paren, $parents);
    $semicolon = $rewriter($this->_semicolon, $parents);
    if (
      $keyword === $this->_keyword &&
      $left_paren === $this->_left_paren &&
      $variables === $this->_variables &&
      $right_paren === $this->_right_paren &&
      $semicolon === $this->_semicolon
    ) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $keyword,
      /* HH_FIXME[4110] use `as` */ $left_paren,
      /* HH_FIXME[4110] use `as` */ $variables,
      /* HH_FIXME[4110] use `as` */ $right_paren,
      /* HH_FIXME[4110] use `as` */ $semicolon,
    );
  }

  public function getKeywordUNTYPED(): ?Node {
    return $this->_keyword;
  }

  public function withKeyword(UnsetToken $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static(
      $value,
      $this->_left_paren,
      $this->_variables,
      $this->_right_paren,
      $this->_semicolon,
    );
  }

  public function hasKeyword(): bool {
    return $this->_keyword !== null;
  }

  /**
   * @return UnsetToken
   */
  public function getKeyword(): UnsetToken {
    return TypeAssert\instance_of(UnsetToken::class, $this->_keyword);
  }

  /**
   * @return UnsetToken
   */
  public function getKeywordx(): UnsetToken {
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
      $this->_variables,
      $this->_right_paren,
      $this->_semicolon,
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

  public function getVariablesUNTYPED(): ?Node {
    return $this->_variables;
  }

  public function withVariables(NodeList<ListItem<IExpression>> $value): this {
    if ($value === $this->_variables) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_left_paren,
      $value,
      $this->_right_paren,
      $this->_semicolon,
    );
  }

  public function hasVariables(): bool {
    return $this->_variables !== null;
  }

  /**
   * @return NodeList<ListItem<MemberSelectionExpression>> |
   * NodeList<ListItem<ScopeResolutionExpression>> |
   * NodeList<ListItem<SubscriptExpression>> |
   * NodeList<ListItem<VariableExpression>>
   */
  public function getVariables(): NodeList<ListItem<IExpression>> {
    return TypeAssert\instance_of(NodeList::class, $this->_variables);
  }

  /**
   * @return NodeList<ListItem<MemberSelectionExpression>> |
   * NodeList<ListItem<ScopeResolutionExpression>> |
   * NodeList<ListItem<SubscriptExpression>> |
   * NodeList<ListItem<VariableExpression>>
   */
  public function getVariablesx(): NodeList<ListItem<IExpression>> {
    return $this->getVariables();
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
      $this->_variables,
      $value,
      $this->_semicolon,
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

  public function getSemicolonUNTYPED(): ?Node {
    return $this->_semicolon;
  }

  public function withSemicolon(SemicolonToken $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_left_paren,
      $this->_variables,
      $this->_right_paren,
      $value,
    );
  }

  public function hasSemicolon(): bool {
    return $this->_semicolon !== null;
  }

  /**
   * @return SemicolonToken
   */
  public function getSemicolon(): SemicolonToken {
    return TypeAssert\instance_of(SemicolonToken::class, $this->_semicolon);
  }

  /**
   * @return SemicolonToken
   */
  public function getSemicolonx(): SemicolonToken {
    return $this->getSemicolon();
  }
}
