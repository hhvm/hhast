<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<c90703af80def230422c602bc1703fb0>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class ForStatement
  extends EditableNode
  implements IControlFlowStatement, ILoopStatement {

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
  ) {
    parent::__construct('for_statement');
    $this->_keyword = $keyword;
    $this->_left_paren = $left_paren;
    $this->_initializer = $initializer;
    $this->_first_semicolon = $first_semicolon;
    $this->_control = $control;
    $this->_second_semicolon = $second_semicolon;
    $this->_end_of_loop = $end_of_loop;
    $this->_right_paren = $right_paren;
    $this->_body = $body;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
  ): this {
    $keyword = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['for_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $keyword->getWidth();
    $left_paren = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['for_left_paren'],
      $file,
      $offset,
      $source,
    );
    $offset += $left_paren->getWidth();
    $initializer = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['for_initializer'],
      $file,
      $offset,
      $source,
    );
    $offset += $initializer->getWidth();
    $first_semicolon = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['for_first_semicolon'],
      $file,
      $offset,
      $source,
    );
    $offset += $first_semicolon->getWidth();
    $control = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['for_control'],
      $file,
      $offset,
      $source,
    );
    $offset += $control->getWidth();
    $second_semicolon = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['for_second_semicolon'],
      $file,
      $offset,
      $source,
    );
    $offset += $second_semicolon->getWidth();
    $end_of_loop = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['for_end_of_loop'],
      $file,
      $offset,
      $source,
    );
    $offset += $end_of_loop->getWidth();
    $right_paren = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['for_right_paren'],
      $file,
      $offset,
      $source,
    );
    $offset += $right_paren->getWidth();
    $body = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['for_body'],
      $file,
      $offset,
      $source,
    );
    $offset += $body->getWidth();
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
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?vec<EditableNode> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $parents);
    $left_paren = $this->_left_paren->rewrite($rewriter, $parents);
    $initializer = $this->_initializer->rewrite($rewriter, $parents);
    $first_semicolon = $this->_first_semicolon->rewrite($rewriter, $parents);
    $control = $this->_control->rewrite($rewriter, $parents);
    $second_semicolon = $this->_second_semicolon->rewrite($rewriter, $parents);
    $end_of_loop = $this->_end_of_loop->rewrite($rewriter, $parents);
    $right_paren = $this->_right_paren->rewrite($rewriter, $parents);
    $body = $this->_body->rewrite($rewriter, $parents);
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
   * @return EditableList<BinaryExpression> |
   * EditableList<FunctionCallExpression> | EditableList<LiteralExpression> |
   * null
   */
  public function getInitializer(): ?EditableList<EditableNode> {
    if ($this->_initializer->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableList::class, $this->_initializer);
  }

  /**
   * @return EditableList<BinaryExpression> |
   * EditableList<FunctionCallExpression> | EditableList<LiteralExpression>
   */
  public function getInitializerx(): EditableList<EditableNode> {
    return TypeAssert\instance_of(EditableList::class, $this->_initializer);
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
    return
      TypeAssert\instance_of(SemicolonToken::class, $this->_first_semicolon);
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
   * @return EditableList<BinaryExpression> | EditableList<EditableNode> |
   * EditableList<ConditionalExpression> | EditableList<FunctionCallExpression>
   * | EditableList<PrefixUnaryExpression> | EditableList<VariableExpression> |
   * null
   */
  public function getControl(): ?EditableList<EditableNode> {
    if ($this->_control->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableList::class, $this->_control);
  }

  /**
   * @return EditableList<BinaryExpression> | EditableList<EditableNode> |
   * EditableList<ConditionalExpression> | EditableList<FunctionCallExpression>
   * | EditableList<PrefixUnaryExpression> | EditableList<VariableExpression>
   */
  public function getControlx(): EditableList<EditableNode> {
    return TypeAssert\instance_of(EditableList::class, $this->_control);
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
    return
      TypeAssert\instance_of(SemicolonToken::class, $this->_second_semicolon);
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
   * @return EditableList<BinaryExpression> |
   * EditableList<FunctionCallExpression> |
   * EditableList<PostfixUnaryExpression> | EditableList<PrefixUnaryExpression>
   * | null
   */
  public function getEndOfLoop(): ?EditableList<EditableNode> {
    if ($this->_end_of_loop->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableList::class, $this->_end_of_loop);
  }

  /**
   * @return EditableList<BinaryExpression> |
   * EditableList<FunctionCallExpression> |
   * EditableList<PostfixUnaryExpression> | EditableList<PrefixUnaryExpression>
   */
  public function getEndOfLoopx(): EditableList<EditableNode> {
    return TypeAssert\instance_of(EditableList::class, $this->_end_of_loop);
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
  public function getBody(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_body);
  }

  /**
   * @return AlternateLoopStatement | CompoundStatement | EchoStatement |
   * ExpressionStatement | ForStatement | UnsetStatement
   */
  public function getBodyx(): EditableNode {
    return $this->getBody();
  }
}
