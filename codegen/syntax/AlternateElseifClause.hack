/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<ee8e95eb069f49a71440d7deff8f223d>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class AlternateElseifClause
  extends Node
  implements IControlFlowStatement {

  const string SYNTAX_KIND = 'alternate_elseif_clause';

  private ElseifToken $_keyword;
  private LeftParenToken $_left_paren;
  private BinaryExpression $_condition;
  private RightParenToken $_right_paren;
  private ColonToken $_colon;
  private NodeList<ExpressionStatement> $_statement;

  public function __construct(
    ElseifToken $keyword,
    LeftParenToken $left_paren,
    BinaryExpression $condition,
    RightParenToken $right_paren,
    ColonToken $colon,
    NodeList<ExpressionStatement> $statement,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_keyword = $keyword;
    $this->_left_paren = $left_paren;
    $this->_condition = $condition;
    $this->_right_paren = $right_paren;
    $this->_colon = $colon;
    $this->_statement = $statement;
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
      /* HH_FIXME[4110] */ $json['alternate_elseif_keyword'],
      $file,
      $offset,
      $source,
      'ElseifToken',
    );
    $keyword = $keyword as nonnull;
    $offset += $keyword->getWidth();
    $left_paren = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['alternate_elseif_left_paren'],
      $file,
      $offset,
      $source,
      'LeftParenToken',
    );
    $left_paren = $left_paren as nonnull;
    $offset += $left_paren->getWidth();
    $condition = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['alternate_elseif_condition'],
      $file,
      $offset,
      $source,
      'BinaryExpression',
    );
    $condition = $condition as nonnull;
    $offset += $condition->getWidth();
    $right_paren = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['alternate_elseif_right_paren'],
      $file,
      $offset,
      $source,
      'RightParenToken',
    );
    $right_paren = $right_paren as nonnull;
    $offset += $right_paren->getWidth();
    $colon = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['alternate_elseif_colon'],
      $file,
      $offset,
      $source,
      'ColonToken',
    );
    $colon = $colon as nonnull;
    $offset += $colon->getWidth();
    $statement = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['alternate_elseif_statement'],
      $file,
      $offset,
      $source,
      'NodeList<ExpressionStatement>',
    );
    $statement = $statement as nonnull;
    $offset += $statement->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $keyword,
      /* HH_IGNORE_ERROR[4110] */ $left_paren,
      /* HH_IGNORE_ERROR[4110] */ $condition,
      /* HH_IGNORE_ERROR[4110] */ $right_paren,
      /* HH_IGNORE_ERROR[4110] */ $colon,
      /* HH_IGNORE_ERROR[4110] */ $statement,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'keyword' => $this->_keyword,
      'left_paren' => $this->_left_paren,
      'condition' => $this->_condition,
      'right_paren' => $this->_right_paren,
      'colon' => $this->_colon,
      'statement' => $this->_statement,
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
    $condition = $rewriter($this->_condition, $parents);
    $right_paren = $rewriter($this->_right_paren, $parents);
    $colon = $rewriter($this->_colon, $parents);
    $statement = $rewriter($this->_statement, $parents);
    if (
      $keyword === $this->_keyword &&
      $left_paren === $this->_left_paren &&
      $condition === $this->_condition &&
      $right_paren === $this->_right_paren &&
      $colon === $this->_colon &&
      $statement === $this->_statement
    ) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $keyword,
      /* HH_FIXME[4110] use `as` */ $left_paren,
      /* HH_FIXME[4110] use `as` */ $condition,
      /* HH_FIXME[4110] use `as` */ $right_paren,
      /* HH_FIXME[4110] use `as` */ $colon,
      /* HH_FIXME[4110] use `as` */ $statement,
    );
  }

  public function getKeywordUNTYPED(): ?Node {
    return $this->_keyword;
  }

  public function withKeyword(ElseifToken $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static(
      $value,
      $this->_left_paren,
      $this->_condition,
      $this->_right_paren,
      $this->_colon,
      $this->_statement,
    );
  }

  public function hasKeyword(): bool {
    return $this->_keyword !== null;
  }

  /**
   * @return ElseifToken
   */
  public function getKeyword(): ElseifToken {
    return TypeAssert\instance_of(ElseifToken::class, $this->_keyword);
  }

  /**
   * @return ElseifToken
   */
  public function getKeywordx(): ElseifToken {
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
      $this->_condition,
      $this->_right_paren,
      $this->_colon,
      $this->_statement,
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

  public function getConditionUNTYPED(): ?Node {
    return $this->_condition;
  }

  public function withCondition(BinaryExpression $value): this {
    if ($value === $this->_condition) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_left_paren,
      $value,
      $this->_right_paren,
      $this->_colon,
      $this->_statement,
    );
  }

  public function hasCondition(): bool {
    return $this->_condition !== null;
  }

  /**
   * @return BinaryExpression
   */
  public function getCondition(): BinaryExpression {
    return TypeAssert\instance_of(BinaryExpression::class, $this->_condition);
  }

  /**
   * @return BinaryExpression
   */
  public function getConditionx(): BinaryExpression {
    return $this->getCondition();
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
      $this->_condition,
      $value,
      $this->_colon,
      $this->_statement,
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

  public function getColonUNTYPED(): ?Node {
    return $this->_colon;
  }

  public function withColon(ColonToken $value): this {
    if ($value === $this->_colon) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_left_paren,
      $this->_condition,
      $this->_right_paren,
      $value,
      $this->_statement,
    );
  }

  public function hasColon(): bool {
    return $this->_colon !== null;
  }

  /**
   * @return ColonToken
   */
  public function getColon(): ColonToken {
    return TypeAssert\instance_of(ColonToken::class, $this->_colon);
  }

  /**
   * @return ColonToken
   */
  public function getColonx(): ColonToken {
    return $this->getColon();
  }

  public function getStatementUNTYPED(): ?Node {
    return $this->_statement;
  }

  public function withStatement(NodeList<ExpressionStatement> $value): this {
    if ($value === $this->_statement) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_left_paren,
      $this->_condition,
      $this->_right_paren,
      $this->_colon,
      $value,
    );
  }

  public function hasStatement(): bool {
    return $this->_statement !== null;
  }

  /**
   * @return NodeList<ExpressionStatement>
   */
  public function getStatement(): NodeList<ExpressionStatement> {
    return TypeAssert\instance_of(NodeList::class, $this->_statement);
  }

  /**
   * @return NodeList<ExpressionStatement>
   */
  public function getStatementx(): NodeList<ExpressionStatement> {
    return $this->getStatement();
  }
}
