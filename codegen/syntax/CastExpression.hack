/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<90dc9fcd51c22ffcbb1a02f311b39919>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class CastExpression extends Node implements ILambdaBody, IExpression {

  const string SYNTAX_KIND = 'cast_expression';

  private Node $_left_paren;
  private Node $_type;
  private Node $_right_paren;
  private Node $_operand;

  public function __construct(
    Node $left_paren,
    Node $type,
    Node $right_paren,
    Node $operand,
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
    dict<string, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
    string $_type_hint,
  ): this {
    $offset = $initial_offset;
    $left_paren = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['cast_left_paren'],
      $file,
      $offset,
      $source,
      'LeftParenToken',
    );
    $offset += $left_paren->getWidth();
    $type = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['cast_type'],
      $file,
      $offset,
      $source,
      'Token',
    );
    $offset += $type->getWidth();
    $right_paren = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['cast_right_paren'],
      $file,
      $offset,
      $source,
      'RightParenToken',
    );
    $offset += $right_paren->getWidth();
    $operand = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['cast_operand'],
      $file,
      $offset,
      $source,
      'IExpression',
    );
    $offset += $operand->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static($left_paren, $type, $right_paren, $operand, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'left_paren' => $this->_left_paren,
      'type' => $this->_type,
      'right_paren' => $this->_right_paren,
      'operand' => $this->_operand,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
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
    return new static($left_paren, $type, $right_paren, $operand);
  }

  public function getLeftParenUNTYPED(): Node {
    return $this->_left_paren;
  }

  public function withLeftParen(Node $value): this {
    if ($value === $this->_left_paren) {
      return $this;
    }
    return new static(
      $value,
      $this->_type,
      $this->_right_paren,
      $this->_operand,
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

  public function getTypeUNTYPED(): Node {
    return $this->_type;
  }

  public function withType(Node $value): this {
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
    return !$this->_type->isMissing();
  }

  /**
   * @return ArrayToken | BinaryToken | BoolToken | BooleanToken | DoubleToken
   * | FloatToken | IntToken | IntegerToken | ObjectToken | StringToken |
   * UnsetToken
   */
  public function getType(): Token {
    return TypeAssert\instance_of(Token::class, $this->_type);
  }

  /**
   * @return ArrayToken | BinaryToken | BoolToken | BooleanToken | DoubleToken
   * | FloatToken | IntToken | IntegerToken | ObjectToken | StringToken |
   * UnsetToken
   */
  public function getTypex(): Token {
    return $this->getType();
  }

  public function getRightParenUNTYPED(): Node {
    return $this->_right_paren;
  }

  public function withRightParen(Node $value): this {
    if ($value === $this->_right_paren) {
      return $this;
    }
    return new static(
      $this->_left_paren,
      $this->_type,
      $value,
      $this->_operand,
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

  public function getOperandUNTYPED(): Node {
    return $this->_operand;
  }

  public function withOperand(Node $value): this {
    if ($value === $this->_operand) {
      return $this;
    }
    return new static(
      $this->_left_paren,
      $this->_type,
      $this->_right_paren,
      $value,
    );
  }

  public function hasOperand(): bool {
    return !$this->_operand->isMissing();
  }

  /**
   * @return ArrayCreationExpression | ArrayIntrinsicExpression |
   * CollectionLiteralExpression | DictionaryIntrinsicExpression |
   * FunctionCallExpression | KeysetIntrinsicExpression | LiteralExpression |
   * MemberSelectionExpression | ObjectCreationExpression |
   * ParenthesizedExpression | PrefixUnaryExpression |
   * ScopeResolutionExpression | SubscriptExpression | NameToken |
   * VariableExpression | XHPExpression
   */
  public function getOperand(): IExpression {
    return TypeAssert\instance_of(IExpression::class, $this->_operand);
  }

  /**
   * @return ArrayCreationExpression | ArrayIntrinsicExpression |
   * CollectionLiteralExpression | DictionaryIntrinsicExpression |
   * FunctionCallExpression | KeysetIntrinsicExpression | LiteralExpression |
   * MemberSelectionExpression | ObjectCreationExpression |
   * ParenthesizedExpression | PrefixUnaryExpression |
   * ScopeResolutionExpression | SubscriptExpression | NameToken |
   * VariableExpression | XHPExpression
   */
  public function getOperandx(): IExpression {
    return $this->getOperand();
  }
}
