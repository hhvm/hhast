/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<fbe5c2fa3eba3b6ca8b27989f75c9152>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;
/* HHAST_IGNORE_ALL[5607] 5607 is ignored because of false positives when comparing a generic to a typed value */
/* HHAST_IGNORE_ALL[5624] HHAST_IGNORE_ALL[5639] 5624 and 5639 are ignored because they insist on using co(tra)variant generics. Could this break external consumers? */

<<__ConsistentConstruct>>
final class ForStatement
  extends Node
  implements IControlFlowStatement, ILoopStatement, IStatement {

  const string SYNTAX_KIND = 'for_statement';

  private ForToken $_keyword;
  private LeftParenToken $_left_paren;
  private ?NodeList<ListItem<IExpression>> $_initializer;
  private SemicolonToken $_first_semicolon;
  private ?IExpression $_control;
  private SemicolonToken $_second_semicolon;
  private ?NodeList<ListItem<IExpression>> $_end_of_loop;
  private RightParenToken $_right_paren;
  private IStatement $_body;

  public function __construct(
    ForToken $keyword,
    LeftParenToken $left_paren,
    ?NodeList<ListItem<IExpression>> $initializer,
    SemicolonToken $first_semicolon,
    ?IExpression $control,
    SemicolonToken $second_semicolon,
    ?NodeList<ListItem<IExpression>> $end_of_loop,
    RightParenToken $right_paren,
    IStatement $body,
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
    dict<arraykey, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
    string $_type_hint,
  ): this {
    $offset = $initial_offset;
    $keyword = Node::fromJSON(
      ($json['for_keyword']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'ForToken',
    );
    $keyword = $keyword as nonnull;
    $offset += $keyword->getWidth();
    $left_paren = Node::fromJSON(
      ($json['for_left_paren']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'LeftParenToken',
    );
    $left_paren = $left_paren as nonnull;
    $offset += $left_paren->getWidth();
    $initializer = Node::fromJSON(
      ($json['for_initializer'] ?? dict['kind' => 'missing']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'NodeList<ListItem<IExpression>>',
    );
    $offset += $initializer?->getWidth() ?? 0;
    $first_semicolon = Node::fromJSON(
      ($json['for_first_semicolon']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'SemicolonToken',
    );
    $first_semicolon = $first_semicolon as nonnull;
    $offset += $first_semicolon->getWidth();
    $control = Node::fromJSON(
      ($json['for_control'] ?? dict['kind' => 'missing']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'IExpression',
    );
    $offset += $control?->getWidth() ?? 0;
    $second_semicolon = Node::fromJSON(
      ($json['for_second_semicolon']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'SemicolonToken',
    );
    $second_semicolon = $second_semicolon as nonnull;
    $offset += $second_semicolon->getWidth();
    $end_of_loop = Node::fromJSON(
      ($json['for_end_of_loop'] ?? dict['kind' => 'missing']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'NodeList<ListItem<IExpression>>',
    );
    $offset += $end_of_loop?->getWidth() ?? 0;
    $right_paren = Node::fromJSON(
      ($json['for_right_paren']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'RightParenToken',
    );
    $right_paren = $right_paren as nonnull;
    $offset += $right_paren->getWidth();
    $body = Node::fromJSON(
      ($json['for_body']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'IStatement',
    );
    $body = $body as nonnull;
    $offset += $body->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $keyword,
      /* HH_IGNORE_ERROR[4110] */ $left_paren,
      /* HH_IGNORE_ERROR[4110] */ $initializer,
      /* HH_IGNORE_ERROR[4110] */ $first_semicolon,
      /* HH_IGNORE_ERROR[4110] */ $control,
      /* HH_IGNORE_ERROR[4110] */ $second_semicolon,
      /* HH_IGNORE_ERROR[4110] */ $end_of_loop,
      /* HH_IGNORE_ERROR[4110] */ $right_paren,
      /* HH_IGNORE_ERROR[4110] */ $body,
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
    $initializer = $this->_initializer === null
      ? null
      : $rewriter($this->_initializer, $parents);
    $first_semicolon = $rewriter($this->_first_semicolon, $parents);
    $control =
      $this->_control === null ? null : $rewriter($this->_control, $parents);
    $second_semicolon = $rewriter($this->_second_semicolon, $parents);
    $end_of_loop = $this->_end_of_loop === null
      ? null
      : $rewriter($this->_end_of_loop, $parents);
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
      $keyword as ForToken,
      $left_paren as LeftParenToken,
      /* HH_FIXME[4110] ?NodeList<ListItem<IExpression>> may not be enforceable */ $initializer,
      $first_semicolon as SemicolonToken,
      $control as ?IExpression,
      $second_semicolon as SemicolonToken,
      /* HH_FIXME[4110] ?NodeList<ListItem<IExpression>> may not be enforceable */ $end_of_loop,
      $right_paren as RightParenToken,
      $body as IStatement,
    );
  }

  public function getKeywordUNTYPED(): ?Node {
    return $this->_keyword;
  }

  public function withKeyword(ForToken $value): this {
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
    return true;
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
    return true;
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

  public function getInitializerUNTYPED(): ?Node {
    return $this->_initializer;
  }

  public function withInitializer(
    ?NodeList<ListItem<IExpression>> $value,
  ): this {
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
    return $this->_initializer !== null;
  }

  /**
   * @return NodeList<ListItem<BinaryExpression>> |
   * NodeList<ListItem<FunctionCallExpression>> | null
   */
  public function getInitializer(): ?NodeList<ListItem<IExpression>> {
    return $this->_initializer;
  }

  /**
   * @return NodeList<ListItem<BinaryExpression>> |
   * NodeList<ListItem<FunctionCallExpression>>
   */
  public function getInitializerx(): NodeList<ListItem<IExpression>> {
    return TypeAssert\not_null($this->getInitializer());
  }

  public function getFirstSemicolonUNTYPED(): ?Node {
    return $this->_first_semicolon;
  }

  public function withFirstSemicolon(SemicolonToken $value): this {
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
    return true;
  }

  /**
   * @return SemicolonToken
   */
  public function getFirstSemicolon(): SemicolonToken {
    return
      TypeAssert\instance_of(SemicolonToken::class, $this->_first_semicolon);
  }

  /**
   * @return SemicolonToken
   */
  public function getFirstSemicolonx(): SemicolonToken {
    return $this->getFirstSemicolon();
  }

  public function getControlUNTYPED(): ?Node {
    return $this->_control;
  }

  public function withControl(?IExpression $value): this {
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
    return $this->_control !== null;
  }

  /**
   * @return BinaryExpression | ConditionalExpression | FunctionCallExpression
   * | null | PrefixUnaryExpression | VariableExpression
   */
  public function getControl(): ?IExpression {
    return $this->_control;
  }

  /**
   * @return BinaryExpression | ConditionalExpression | FunctionCallExpression
   * | PrefixUnaryExpression | VariableExpression
   */
  public function getControlx(): IExpression {
    return TypeAssert\not_null($this->getControl());
  }

  public function getSecondSemicolonUNTYPED(): ?Node {
    return $this->_second_semicolon;
  }

  public function withSecondSemicolon(SemicolonToken $value): this {
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
    return true;
  }

  /**
   * @return SemicolonToken
   */
  public function getSecondSemicolon(): SemicolonToken {
    return
      TypeAssert\instance_of(SemicolonToken::class, $this->_second_semicolon);
  }

  /**
   * @return SemicolonToken
   */
  public function getSecondSemicolonx(): SemicolonToken {
    return $this->getSecondSemicolon();
  }

  public function getEndOfLoopUNTYPED(): ?Node {
    return $this->_end_of_loop;
  }

  public function withEndOfLoop(?NodeList<ListItem<IExpression>> $value): this {
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
    return $this->_end_of_loop !== null;
  }

  /**
   * @return NodeList<ListItem<BinaryExpression>> |
   * NodeList<ListItem<FunctionCallExpression>> |
   * NodeList<ListItem<PostfixUnaryExpression>> |
   * NodeList<ListItem<PrefixUnaryExpression>> | null
   */
  public function getEndOfLoop(): ?NodeList<ListItem<IExpression>> {
    return $this->_end_of_loop;
  }

  /**
   * @return NodeList<ListItem<BinaryExpression>> |
   * NodeList<ListItem<FunctionCallExpression>> |
   * NodeList<ListItem<PostfixUnaryExpression>> |
   * NodeList<ListItem<PrefixUnaryExpression>>
   */
  public function getEndOfLoopx(): NodeList<ListItem<IExpression>> {
    return TypeAssert\not_null($this->getEndOfLoop());
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
    return true;
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

  public function getBodyUNTYPED(): ?Node {
    return $this->_body;
  }

  public function withBody(IStatement $value): this {
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
    return true;
  }

  /**
   * @return CompoundStatement | EchoStatement | ExpressionStatement |
   * ForStatement | UnsetStatement
   */
  public function getBody(): IStatement {
    return TypeAssert\instance_of(IStatement::class, $this->_body);
  }

  /**
   * @return CompoundStatement | EchoStatement | ExpressionStatement |
   * ForStatement | UnsetStatement
   */
  public function getBodyx(): IStatement {
    return $this->getBody();
  }
}
