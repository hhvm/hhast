/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<2b27c7d94f78684cc93c804c295333c1>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class DoStatement
  extends Node
  implements IControlFlowStatement, ILoopStatement, IStatement {

  const string SYNTAX_KIND = 'do_statement';

  private Node $_keyword;
  private Node $_body;
  private Node $_while_keyword;
  private Node $_left_paren;
  private Node $_condition;
  private Node $_right_paren;
  private Node $_semicolon;

  public function __construct(
    Node $keyword,
    Node $body,
    Node $while_keyword,
    Node $left_paren,
    Node $condition,
    Node $right_paren,
    Node $semicolon,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_keyword = $keyword;
    $this->_body = $body;
    $this->_while_keyword = $while_keyword;
    $this->_left_paren = $left_paren;
    $this->_condition = $condition;
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
      /* HH_FIXME[4110] */ $json['do_keyword'],
      $file,
      $offset,
      $source,
      'DoToken',
    );
    $offset += $keyword->getWidth();
    $body = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['do_body'],
      $file,
      $offset,
      $source,
      'IStatement',
    );
    $offset += $body->getWidth();
    $while_keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['do_while_keyword'],
      $file,
      $offset,
      $source,
      'WhileToken',
    );
    $offset += $while_keyword->getWidth();
    $left_paren = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['do_left_paren'],
      $file,
      $offset,
      $source,
      'LeftParenToken',
    );
    $offset += $left_paren->getWidth();
    $condition = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['do_condition'],
      $file,
      $offset,
      $source,
      'IExpression',
    );
    $offset += $condition->getWidth();
    $right_paren = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['do_right_paren'],
      $file,
      $offset,
      $source,
      'RightParenToken',
    );
    $offset += $right_paren->getWidth();
    $semicolon = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['do_semicolon'],
      $file,
      $offset,
      $source,
      'SemicolonToken',
    );
    $offset += $semicolon->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      $keyword,
      $body,
      $while_keyword,
      $left_paren,
      $condition,
      $right_paren,
      $semicolon,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'keyword' => $this->_keyword,
      'body' => $this->_body,
      'while_keyword' => $this->_while_keyword,
      'left_paren' => $this->_left_paren,
      'condition' => $this->_condition,
      'right_paren' => $this->_right_paren,
      'semicolon' => $this->_semicolon,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $keyword = $rewriter($this->_keyword, $parents);
    $body = $rewriter($this->_body, $parents);
    $while_keyword = $rewriter($this->_while_keyword, $parents);
    $left_paren = $rewriter($this->_left_paren, $parents);
    $condition = $rewriter($this->_condition, $parents);
    $right_paren = $rewriter($this->_right_paren, $parents);
    $semicolon = $rewriter($this->_semicolon, $parents);
    if (
      $keyword === $this->_keyword &&
      $body === $this->_body &&
      $while_keyword === $this->_while_keyword &&
      $left_paren === $this->_left_paren &&
      $condition === $this->_condition &&
      $right_paren === $this->_right_paren &&
      $semicolon === $this->_semicolon
    ) {
      return $this;
    }
    return new static(
      $keyword,
      $body,
      $while_keyword,
      $left_paren,
      $condition,
      $right_paren,
      $semicolon,
    );
  }

  public function getKeywordUNTYPED(): Node {
    return $this->_keyword;
  }

  public function withKeyword(DoToken $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static(
      $value ?? Missing(),
      $this->_body,
      $this->_while_keyword,
      $this->_left_paren,
      $this->_condition,
      $this->_right_paren,
      $this->_semicolon,
    );
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  /**
   * @return DoToken
   */
  public function getKeyword(): DoToken {
    return TypeAssert\instance_of(DoToken::class, $this->_keyword);
  }

  /**
   * @return DoToken
   */
  public function getKeywordx(): DoToken {
    return $this->getKeyword();
  }

  public function getBodyUNTYPED(): Node {
    return $this->_body;
  }

  public function withBody(IStatement $value): this {
    if ($value === $this->_body) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $value ?? Missing(),
      $this->_while_keyword,
      $this->_left_paren,
      $this->_condition,
      $this->_right_paren,
      $this->_semicolon,
    );
  }

  public function hasBody(): bool {
    return !$this->_body->isMissing();
  }

  /**
   * @return CompoundStatement | ExpressionStatement
   */
  public function getBody(): IStatement {
    return TypeAssert\instance_of(IStatement::class, $this->_body);
  }

  /**
   * @return CompoundStatement | ExpressionStatement
   */
  public function getBodyx(): IStatement {
    return $this->getBody();
  }

  public function getWhileKeywordUNTYPED(): Node {
    return $this->_while_keyword;
  }

  public function withWhileKeyword(WhileToken $value): this {
    if ($value === $this->_while_keyword) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_body,
      $value ?? Missing(),
      $this->_left_paren,
      $this->_condition,
      $this->_right_paren,
      $this->_semicolon,
    );
  }

  public function hasWhileKeyword(): bool {
    return !$this->_while_keyword->isMissing();
  }

  /**
   * @return WhileToken
   */
  public function getWhileKeyword(): WhileToken {
    return TypeAssert\instance_of(WhileToken::class, $this->_while_keyword);
  }

  /**
   * @return WhileToken
   */
  public function getWhileKeywordx(): WhileToken {
    return $this->getWhileKeyword();
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
      $this->_body,
      $this->_while_keyword,
      $value ?? Missing(),
      $this->_condition,
      $this->_right_paren,
      $this->_semicolon,
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

  public function getConditionUNTYPED(): Node {
    return $this->_condition;
  }

  public function withCondition(IExpression $value): this {
    if ($value === $this->_condition) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_body,
      $this->_while_keyword,
      $this->_left_paren,
      $value ?? Missing(),
      $this->_right_paren,
      $this->_semicolon,
    );
  }

  public function hasCondition(): bool {
    return !$this->_condition->isMissing();
  }

  /**
   * @return BinaryExpression | FunctionCallExpression | LiteralExpression |
   * PrefixUnaryExpression | SubscriptExpression | VariableExpression
   */
  public function getCondition(): IExpression {
    return TypeAssert\instance_of(IExpression::class, $this->_condition);
  }

  /**
   * @return BinaryExpression | FunctionCallExpression | LiteralExpression |
   * PrefixUnaryExpression | SubscriptExpression | VariableExpression
   */
  public function getConditionx(): IExpression {
    return $this->getCondition();
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
      $this->_body,
      $this->_while_keyword,
      $this->_left_paren,
      $this->_condition,
      $value ?? Missing(),
      $this->_semicolon,
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

  public function getSemicolonUNTYPED(): Node {
    return $this->_semicolon;
  }

  public function withSemicolon(SemicolonToken $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_body,
      $this->_while_keyword,
      $this->_left_paren,
      $this->_condition,
      $this->_right_paren,
      $value ?? Missing(),
    );
  }

  public function hasSemicolon(): bool {
    return !$this->_semicolon->isMissing();
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
