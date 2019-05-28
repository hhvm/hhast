/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<1697331826f63a36763d6d30b53f9142>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class ForStatement
  extends EditableNode
  implements IControlFlowStatement, ILoopStatement, IStatement {

  const string SYNTAX_KIND = 'for_statement';

  private EditableNode $_keyword;
  private EditableNode $_left_paren;
  private EditableNode $_initializer;
  private EditableNode $_first_semicolon;
  private EditableNode $_control;
  private EditableNode $_second_semicolon;
  private EditableNode $_end_of_loop;
  private EditableNode $_right_paren;
  private EditableNode $_body;

  public function __construct(
    EditableNode $keyword,
    EditableNode $left_paren,
    EditableNode $initializer,
    EditableNode $first_semicolon,
    EditableNode $control,
    EditableNode $second_semicolon,
    EditableNode $end_of_loop,
    EditableNode $right_paren,
    EditableNode $body,
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
    $keyword = EditableNode::fromJSON(
      /* HH_FIXME[4110] */ $json['for_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $keyword->getWidth();
    $left_paren = EditableNode::fromJSON(
      /* HH_FIXME[4110] */ $json['for_left_paren'],
      $file,
      $offset,
      $source,
    );
    $offset += $left_paren->getWidth();
    $initializer = EditableNode::fromJSON(
      /* HH_FIXME[4110] */ $json['for_initializer'],
      $file,
      $offset,
      $source,
    );
    $offset += $initializer->getWidth();
    $first_semicolon = EditableNode::fromJSON(
      /* HH_FIXME[4110] */ $json['for_first_semicolon'],
      $file,
      $offset,
      $source,
    );
    $offset += $first_semicolon->getWidth();
    $control = EditableNode::fromJSON(
      /* HH_FIXME[4110] */ $json['for_control'],
      $file,
      $offset,
      $source,
    );
    $offset += $control->getWidth();
    $second_semicolon = EditableNode::fromJSON(
      /* HH_FIXME[4110] */ $json['for_second_semicolon'],
      $file,
      $offset,
      $source,
    );
    $offset += $second_semicolon->getWidth();
    $end_of_loop = EditableNode::fromJSON(
      /* HH_FIXME[4110] */ $json['for_end_of_loop'],
      $file,
      $offset,
      $source,
    );
    $offset += $end_of_loop->getWidth();
    $right_paren = EditableNode::fromJSON(
      /* HH_FIXME[4110] */ $json['for_right_paren'],
      $file,
      $offset,
      $source,
    );
    $offset += $right_paren->getWidth();
    $body = EditableNode::fromJSON(
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
  public function getChildren(): dict<string, EditableNode> {
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
    vec<EditableNode> $parents = vec[],
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

  public function getInitializerUNTYPED(): EditableNode {
    return $this->_initializer;
  }

  public function withInitializer(EditableNode $value): this {
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
   * @return EditableList<BinaryExpression> | EditableList<IExpression> |
   * EditableList<FunctionCallExpression> | EditableList<LiteralExpression> |
   * null
   */
  public function getInitializer(): ?EditableList<IExpression> {
    if ($this->_initializer->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableList::class, $this->_initializer);
  }

  /**
   * @return EditableList<BinaryExpression> | EditableList<IExpression> |
   * EditableList<FunctionCallExpression> | EditableList<LiteralExpression>
   */
  public function getInitializerx(): EditableList<IExpression> {
    return TypeAssert\not_null($this->getInitializer());
  }

  public function getFirstSemicolonUNTYPED(): EditableNode {
    return $this->_first_semicolon;
  }

  public function withFirstSemicolon(EditableNode $value): this {
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

  public function getControlUNTYPED(): EditableNode {
    return $this->_control;
  }

  public function withControl(EditableNode $value): this {
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
   * @return EditableList<BinaryExpression> | EditableList<IHasOperator> |
   * EditableList<ConditionalExpression> | EditableList<FunctionCallExpression>
   * | EditableList<PrefixUnaryExpression> | EditableList<VariableExpression> |
   * null
   */
  public function getControl(): ?EditableList<IExpression> {
    if ($this->_control->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableList::class, $this->_control);
  }

  /**
   * @return EditableList<BinaryExpression> | EditableList<IHasOperator> |
   * EditableList<ConditionalExpression> | EditableList<FunctionCallExpression>
   * | EditableList<PrefixUnaryExpression> | EditableList<VariableExpression>
   */
  public function getControlx(): EditableList<IExpression> {
    return TypeAssert\not_null($this->getControl());
  }

  public function getSecondSemicolonUNTYPED(): EditableNode {
    return $this->_second_semicolon;
  }

  public function withSecondSemicolon(EditableNode $value): this {
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

  public function getEndOfLoopUNTYPED(): EditableNode {
    return $this->_end_of_loop;
  }

  public function withEndOfLoop(EditableNode $value): this {
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
   * @return EditableList<BinaryExpression> | EditableList<IHasOperator> |
   * EditableList<FunctionCallExpression> |
   * EditableList<PostfixUnaryExpression> | EditableList<PrefixUnaryExpression>
   * | null
   */
  public function getEndOfLoop(): ?EditableList<IExpression> {
    if ($this->_end_of_loop->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableList::class, $this->_end_of_loop);
  }

  /**
   * @return EditableList<BinaryExpression> | EditableList<IHasOperator> |
   * EditableList<FunctionCallExpression> |
   * EditableList<PostfixUnaryExpression> | EditableList<PrefixUnaryExpression>
   */
  public function getEndOfLoopx(): EditableList<IExpression> {
    return TypeAssert\not_null($this->getEndOfLoop());
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

  public function getBodyUNTYPED(): EditableNode {
    return $this->_body;
  }

  public function withBody(EditableNode $value): this {
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
