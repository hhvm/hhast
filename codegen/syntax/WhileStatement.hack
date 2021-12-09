/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<c053aa583989efc8b1d2e470979a0e10>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;
/* HHAST_IGNORE_ALL[5607] 5607 is ignored because of false positives when comparing a generic to a typed value */
/* HHAST_IGNORE_ALL[5624] HHAST_IGNORE_ALL[5639] 5624 and 5639 are ignored because they insist on using co(tra)variant generics. Could this break external consumers? */

<<__ConsistentConstruct>>
final class WhileStatement
  extends Node
  implements IControlFlowStatement, ILoopStatement, IStatement {

  const string SYNTAX_KIND = 'while_statement';

  private WhileToken $_keyword;
  private LeftParenToken $_left_paren;
  private IExpression $_condition;
  private RightParenToken $_right_paren;
  private IStatement $_body;

  public function __construct(
    WhileToken $keyword,
    LeftParenToken $left_paren,
    IExpression $condition,
    RightParenToken $right_paren,
    IStatement $body,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_keyword = $keyword;
    $this->_left_paren = $left_paren;
    $this->_condition = $condition;
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
      ($json['while_keyword']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'WhileToken',
    );
    $keyword = $keyword as nonnull;
    $offset += $keyword->getWidth();
    $left_paren = Node::fromJSON(
      ($json['while_left_paren']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'LeftParenToken',
    );
    $left_paren = $left_paren as nonnull;
    $offset += $left_paren->getWidth();
    $condition = Node::fromJSON(
      ($json['while_condition']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'IExpression',
    );
    $condition = $condition as nonnull;
    $offset += $condition->getWidth();
    $right_paren = Node::fromJSON(
      ($json['while_right_paren']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'RightParenToken',
    );
    $right_paren = $right_paren as nonnull;
    $offset += $right_paren->getWidth();
    $body = Node::fromJSON(
      ($json['while_body']) as dict<_, _>,
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
      /* HH_IGNORE_ERROR[4110] */ $condition,
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
      'condition' => $this->_condition,
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
    $condition = $rewriter($this->_condition, $parents);
    $right_paren = $rewriter($this->_right_paren, $parents);
    $body = $rewriter($this->_body, $parents);
    if (
      $keyword === $this->_keyword &&
      $left_paren === $this->_left_paren &&
      $condition === $this->_condition &&
      $right_paren === $this->_right_paren &&
      $body === $this->_body
    ) {
      return $this;
    }
    return new static(
      $keyword as WhileToken,
      $left_paren as LeftParenToken,
      $condition as IExpression,
      $right_paren as RightParenToken,
      $body as IStatement,
    );
  }

  public function getKeywordUNTYPED(): ?Node {
    return $this->_keyword;
  }

  public function withKeyword(WhileToken $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static(
      $value,
      $this->_left_paren,
      $this->_condition,
      $this->_right_paren,
      $this->_body,
    );
  }

  public function hasKeyword(): bool {
    return true;
  }

  /**
   * @return WhileToken
   */
  public function getKeyword(): WhileToken {
    return TypeAssert\instance_of(WhileToken::class, $this->_keyword);
  }

  /**
   * @return WhileToken
   */
  public function getKeywordx(): WhileToken {
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

  public function getConditionUNTYPED(): ?Node {
    return $this->_condition;
  }

  public function withCondition(IExpression $value): this {
    if ($value === $this->_condition) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_left_paren,
      $value,
      $this->_right_paren,
      $this->_body,
    );
  }

  public function hasCondition(): bool {
    return true;
  }

  /**
   * @return BinaryExpression | FunctionCallExpression | IsExpression |
   * LiteralExpression | MemberSelectionExpression | ParenthesizedExpression |
   * PostfixUnaryExpression | PrefixUnaryExpression | VariableExpression
   */
  public function getCondition(): IExpression {
    return TypeAssert\instance_of(IExpression::class, $this->_condition);
  }

  /**
   * @return BinaryExpression | FunctionCallExpression | IsExpression |
   * LiteralExpression | MemberSelectionExpression | ParenthesizedExpression |
   * PostfixUnaryExpression | PrefixUnaryExpression | VariableExpression
   */
  public function getConditionx(): IExpression {
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
      $this->_condition,
      $this->_right_paren,
      $value,
    );
  }

  public function hasBody(): bool {
    return true;
  }

  /**
   * @return CompoundStatement | ContinueStatement | ExpressionStatement
   */
  public function getBody(): IStatement {
    return TypeAssert\instance_of(IStatement::class, $this->_body);
  }

  /**
   * @return CompoundStatement | ContinueStatement | ExpressionStatement
   */
  public function getBodyx(): IStatement {
    return $this->getBody();
  }
}
