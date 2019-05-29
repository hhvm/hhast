/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<07496ae879ed8b500d5e7d44ce199be2>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class ForStatement
  extends Node
  implements IControlFlowStatement, ILoopStatement, IStatement {

  const string SYNTAX_KIND = 'for_statement';

  private Node $_keyword;
  private Node $_left_paren;
  private Node $_initializer;
  private Node $_first_semicolon;
  private Node $_control;
  private Node $_second_semicolon;
  private Node $_end_of_loop;
  private Node $_right_paren;
  private Node $_body;

  public function __construct(
    Node $keyword,
    Node $left_paren,
    Node $initializer,
    Node $first_semicolon,
    Node $control,
    Node $second_semicolon,
    Node $end_of_loop,
    Node $right_paren,
    Node $body,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_keyword = $keyword;
    $this->_left_paren = $left_paren;
    $this->_initializer = $initializer;
    $this->_first_semicolon = $first_semicolon;
    $this->_control = $control;
    $this->_second_semicolon = $second_semicolon;
    $this->_end_of_loop = $end_of_loop;
    $this->_right_paren = $right_paren;
    $this->_body = $body;
    parent::__construct($source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
  ): this {
    $offset = $initial_offset;
    $keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['for_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $keyword->getWidth();
    $left_paren = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['for_left_paren'],
      $file,
      $offset,
      $source,
    );
    $offset += $left_paren->getWidth();
    $initializer = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['for_initializer'],
      $file,
      $offset,
      $source,
    );
    $offset += $initializer->getWidth();
    $first_semicolon = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['for_first_semicolon'],
      $file,
      $offset,
      $source,
    );
    $offset += $first_semicolon->getWidth();
    $control = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['for_control'],
      $file,
      $offset,
      $source,
    );
    $offset += $control->getWidth();
    $second_semicolon = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['for_second_semicolon'],
      $file,
      $offset,
      $source,
    );
    $offset += $second_semicolon->getWidth();
    $end_of_loop = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['for_end_of_loop'],
      $file,
      $offset,
      $source,
    );
    $offset += $end_of_loop->getWidth();
    $right_paren = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['for_right_paren'],
      $file,
      $offset,
      $source,
    );
    $offset += $right_paren->getWidth();
    $body = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['for_body'],
      $file,
      $offset,
      $source,
    );
    $offset += $body->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      $keyword,
      $left_paren,
      $initializer,
      $first_semicolon,
      $control,
      $second_semicolon,
      $end_of_loop,
      $right_paren,
      $body,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'keyword' => $this->_keyword,
      'left_paren' => $this->_left_paren,
      'initializer' => $this->_initializer,
      'first_semicolon' => $this->_first_semicolon,
      'control' => $this->_control,
      'second_semicolon' => $this->_second_semicolon,
      'end_of_loop' => $this->_end_of_loop,
      'right_paren' => $this->_right_paren,
      'body' => $this->_body,
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
    $initializer = $rewriter($this->_initializer, $parents);
    $first_semicolon = $rewriter($this->_first_semicolon, $parents);
    $control = $rewriter($this->_control, $parents);
    $second_semicolon = $rewriter($this->_second_semicolon, $parents);
    $end_of_loop = $rewriter($this->_end_of_loop, $parents);
    $right_paren = $rewriter($this->_right_paren, $parents);
    $body = $rewriter($this->_body, $parents);
    if (
      $keyword === $this->_keyword &&
      $left_paren === $this->_left_paren &&
      $initializer === $this->_initializer &&
      $first_semicolon === $this->_first_semicolon &&
      $control === $this->_control &&
      $second_semicolon === $this->_second_semicolon &&
      $end_of_loop === $this->_end_of_loop &&
      $right_paren === $this->_right_paren &&
      $body === $this->_body
    ) {
      return $this;
    }
    return new static(
      $keyword,
      $left_paren,
      $initializer,
      $first_semicolon,
      $control,
      $second_semicolon,
      $end_of_loop,
      $right_paren,
      $body,
    );
  }

  public function getKeywordUNTYPED(): Node {
    return $this->_keyword;
  }

  public function withKeyword(Node $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static(
      $value,
      $this->_left_paren,
      $this->_initializer,
      $this->_first_semicolon,
      $this->_control,
      $this->_second_semicolon,
      $this->_end_of_loop,
      $this->_right_paren,
      $this->_body,
    );
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  /**
   * @return ForToken
   */
  public function getKeyword(): ForToken {
    return TypeAssert\instance_of(ForToken::class, $this->_keyword);
  }

  /**
   * @return ForToken
   */
  public function getKeywordx(): ForToken {
    return $this->getKeyword();
  }

  public function getLeftParenUNTYPED(): Node {
    return $this->_left_paren;
  }

  public function withLeftParen(Node $value): this {
    if ($value === $this->_left_paren) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $value,
      $this->_initializer,
      $this->_first_semicolon,
      $this->_control,
      $this->_second_semicolon,
      $this->_end_of_loop,
      $this->_right_paren,
      $this->_body,
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

  public function getInitializerUNTYPED(): Node {
    return $this->_initializer;
  }

  public function withInitializer(Node $value): this {
    if ($value === $this->_initializer) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_left_paren,
      $value,
      $this->_first_semicolon,
      $this->_control,
      $this->_second_semicolon,
      $this->_end_of_loop,
      $this->_right_paren,
      $this->_body,
    );
  }

  public function hasInitializer(): bool {
    return !$this->_initializer->isMissing();
  }

  /**
   * @return NodeList<BinaryExpression> | NodeList<IExpression> |
   * NodeList<FunctionCallExpression> | NodeList<LiteralExpression> | null
   */
  public function getInitializer(): ?NodeList<IExpression> {
    if ($this->_initializer->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(NodeList::class, $this->_initializer);
  }

  /**
   * @return NodeList<BinaryExpression> | NodeList<IExpression> |
   * NodeList<FunctionCallExpression> | NodeList<LiteralExpression>
   */
  public function getInitializerx(): NodeList<IExpression> {
    return TypeAssert\not_null($this->getInitializer());
  }

  public function getFirstSemicolonUNTYPED(): Node {
    return $this->_first_semicolon;
  }

  public function withFirstSemicolon(Node $value): this {
    if ($value === $this->_first_semicolon) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_left_paren,
      $this->_initializer,
      $value,
      $this->_control,
      $this->_second_semicolon,
      $this->_end_of_loop,
      $this->_right_paren,
      $this->_body,
    );
  }

  public function hasFirstSemicolon(): bool {
    return !$this->_first_semicolon->isMissing();
  }

  /**
   * @return SemicolonToken
   */
  public function getFirstSemicolon(): SemicolonToken {
    return TypeAssert\instance_of(
      SemicolonToken::class,
      $this->_first_semicolon,
    );
  }

  /**
   * @return SemicolonToken
   */
  public function getFirstSemicolonx(): SemicolonToken {
    return $this->getFirstSemicolon();
  }

  public function getControlUNTYPED(): Node {
    return $this->_control;
  }

  public function withControl(Node $value): this {
    if ($value === $this->_control) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_left_paren,
      $this->_initializer,
      $this->_first_semicolon,
      $value,
      $this->_second_semicolon,
      $this->_end_of_loop,
      $this->_right_paren,
      $this->_body,
    );
  }

  public function hasControl(): bool {
    return !$this->_control->isMissing();
  }

  /**
   * @return NodeList<BinaryExpression> | NodeList<IHasOperator> |
   * NodeList<ConditionalExpression> | NodeList<FunctionCallExpression> |
   * NodeList<PrefixUnaryExpression> | NodeList<VariableExpression> | null
   */
  public function getControl(): ?NodeList<IExpression> {
    if ($this->_control->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(NodeList::class, $this->_control);
  }

  /**
   * @return NodeList<BinaryExpression> | NodeList<IHasOperator> |
   * NodeList<ConditionalExpression> | NodeList<FunctionCallExpression> |
   * NodeList<PrefixUnaryExpression> | NodeList<VariableExpression>
   */
  public function getControlx(): NodeList<IExpression> {
    return TypeAssert\not_null($this->getControl());
  }

  public function getSecondSemicolonUNTYPED(): Node {
    return $this->_second_semicolon;
  }

  public function withSecondSemicolon(Node $value): this {
    if ($value === $this->_second_semicolon) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_left_paren,
      $this->_initializer,
      $this->_first_semicolon,
      $this->_control,
      $value,
      $this->_end_of_loop,
      $this->_right_paren,
      $this->_body,
    );
  }

  public function hasSecondSemicolon(): bool {
    return !$this->_second_semicolon->isMissing();
  }

  /**
   * @return SemicolonToken
   */
  public function getSecondSemicolon(): SemicolonToken {
    return TypeAssert\instance_of(
      SemicolonToken::class,
      $this->_second_semicolon,
    );
  }

  /**
   * @return SemicolonToken
   */
  public function getSecondSemicolonx(): SemicolonToken {
    return $this->getSecondSemicolon();
  }

  public function getEndOfLoopUNTYPED(): Node {
    return $this->_end_of_loop;
  }

  public function withEndOfLoop(Node $value): this {
    if ($value === $this->_end_of_loop) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_left_paren,
      $this->_initializer,
      $this->_first_semicolon,
      $this->_control,
      $this->_second_semicolon,
      $value,
      $this->_right_paren,
      $this->_body,
    );
  }

  public function hasEndOfLoop(): bool {
    return !$this->_end_of_loop->isMissing();
  }

  /**
   * @return NodeList<BinaryExpression> | NodeList<IHasOperator> |
   * NodeList<FunctionCallExpression> | NodeList<PostfixUnaryExpression> |
   * NodeList<PrefixUnaryExpression> | null
   */
  public function getEndOfLoop(): ?NodeList<IExpression> {
    if ($this->_end_of_loop->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(NodeList::class, $this->_end_of_loop);
  }

  /**
   * @return NodeList<BinaryExpression> | NodeList<IHasOperator> |
   * NodeList<FunctionCallExpression> | NodeList<PostfixUnaryExpression> |
   * NodeList<PrefixUnaryExpression>
   */
  public function getEndOfLoopx(): NodeList<IExpression> {
    return TypeAssert\not_null($this->getEndOfLoop());
  }

  public function getRightParenUNTYPED(): Node {
    return $this->_right_paren;
  }

  public function withRightParen(Node $value): this {
    if ($value === $this->_right_paren) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_left_paren,
      $this->_initializer,
      $this->_first_semicolon,
      $this->_control,
      $this->_second_semicolon,
      $this->_end_of_loop,
      $value,
      $this->_body,
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

  public function getBodyUNTYPED(): Node {
    return $this->_body;
  }

  public function withBody(Node $value): this {
    if ($value === $this->_body) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_left_paren,
      $this->_initializer,
      $this->_first_semicolon,
      $this->_control,
      $this->_second_semicolon,
      $this->_end_of_loop,
      $this->_right_paren,
      $value,
    );
  }

  public function hasBody(): bool {
    return !$this->_body->isMissing();
  }

  /**
   * @return AlternateLoopStatement | CompoundStatement | EchoStatement |
   * ExpressionStatement | ForStatement | UnsetStatement
   */
  public function getBody(): IStatement {
    return TypeAssert\instance_of(IStatement::class, $this->_body);
  }

  /**
   * @return AlternateLoopStatement | CompoundStatement | EchoStatement |
   * ExpressionStatement | ForStatement | UnsetStatement
   */
  public function getBodyx(): IStatement {
    return $this->getBody();
  }
}
