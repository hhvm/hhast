/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<c87a612176d39d92e38248b57ea10336>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class CastExpression extends Node implements ILambdaBody, IExpression {

  const string SYNTAX_KIND = 'cast_expression';

  private LeftParenToken $_left_paren;
  private Token $_type;
  private RightParenToken $_right_paren;
  private IExpression $_operand;

  public function __construct(
    LeftParenToken $left_paren,
    Token $type,
    RightParenToken $right_paren,
    IExpression $operand,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_left_paren = $left_paren;
    $this->_type = $type;
    $this->_right_paren = $right_paren;
    $this->_operand = $operand;
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
    $left_paren = Node::fromJSON(
      ($json['cast_left_paren']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'LeftParenToken',
    );
    $left_paren = $left_paren as nonnull;
    $offset += $left_paren->getWidth();
    $type = Node::fromJSON(
      ($json['cast_type']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'Token',
    );
    $type = $type as nonnull;
    $offset += $type->getWidth();
    $right_paren = Node::fromJSON(
      ($json['cast_right_paren']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'RightParenToken',
    );
    $right_paren = $right_paren as nonnull;
    $offset += $right_paren->getWidth();
    $operand = Node::fromJSON(
      ($json['cast_operand']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'IExpression',
    );
    $operand = $operand as nonnull;
    $offset += $operand->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $left_paren,
      /* HH_IGNORE_ERROR[4110] */ $type,
      /* HH_IGNORE_ERROR[4110] */ $right_paren,
      /* HH_IGNORE_ERROR[4110] */ $operand,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'left_paren' => $this->_left_paren,
      'type' => $this->_type,
      'right_paren' => $this->_right_paren,
      'operand' => $this->_operand,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $left_paren = $rewriter($this->_left_paren, $parents);
    $type = $rewriter($this->_type, $parents);
    $right_paren = $rewriter($this->_right_paren, $parents);
    $operand = $rewriter($this->_operand, $parents);
    if (
      $left_paren === $this->_left_paren &&
      $type === $this->_type &&
      $right_paren === $this->_right_paren &&
      $operand === $this->_operand
    ) {
      return $this;
    }
    return new static(
      $left_paren as LeftParenToken,
      $type as Token,
      $right_paren as RightParenToken,
      $operand as IExpression,
    );
  }

  public function getLeftParenUNTYPED(): ?Node {
    return $this->_left_paren;
  }

  public function withLeftParen(LeftParenToken $value): this {
    if ($value === $this->_left_paren) {
      return $this;
    }
    return
      new static($value, $this->_type, $this->_right_paren, $this->_operand);
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

  public function getTypeUNTYPED(): ?Node {
    return $this->_type;
  }

  public function withType(Token $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return new static(
      $this->_left_paren,
      $value,
      $this->_right_paren,
      $this->_operand,
    );
  }

  public function hasType(): bool {
    return true;
  }

  /**
   * @return BoolToken | FloatToken | IntToken | StringToken
   */
  public function getType(): Token {
    return TypeAssert\instance_of(Token::class, $this->_type);
  }

  /**
   * @return BoolToken | FloatToken | IntToken | StringToken
   */
  public function getTypex(): Token {
    return $this->getType();
  }

  public function getRightParenUNTYPED(): ?Node {
    return $this->_right_paren;
  }

  public function withRightParen(RightParenToken $value): this {
    if ($value === $this->_right_paren) {
      return $this;
    }
    return
      new static($this->_left_paren, $this->_type, $value, $this->_operand);
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

  public function getOperandUNTYPED(): ?Node {
    return $this->_operand;
  }

  public function withOperand(IExpression $value): this {
    if ($value === $this->_operand) {
      return $this;
    }
    return
      new static($this->_left_paren, $this->_type, $this->_right_paren, $value);
  }

  public function hasOperand(): bool {
    return true;
  }

  /**
   * @return CollectionLiteralExpression | DarrayIntrinsicExpression |
   * FunctionCallExpression | LiteralExpression | MemberSelectionExpression |
   * ObjectCreationExpression | ParenthesizedExpression | PrefixUnaryExpression
   * | ScopeResolutionExpression | SubscriptExpression | NameToken |
   * VariableExpression | XHPExpression
   */
  public function getOperand(): IExpression {
    return TypeAssert\instance_of(IExpression::class, $this->_operand);
  }

  /**
   * @return CollectionLiteralExpression | DarrayIntrinsicExpression |
   * FunctionCallExpression | LiteralExpression | MemberSelectionExpression |
   * ObjectCreationExpression | ParenthesizedExpression | PrefixUnaryExpression
   * | ScopeResolutionExpression | SubscriptExpression | NameToken |
   * VariableExpression | XHPExpression
   */
  public function getOperandx(): IExpression {
    return $this->getOperand();
  }
}
