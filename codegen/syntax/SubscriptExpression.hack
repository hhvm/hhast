/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<6d4907a742d3c4ae240b3ece98d3f7b3>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class SubscriptExpression
  extends Node
  implements ILambdaBody, IExpression {

  const string SYNTAX_KIND = 'subscript_expression';

  private Node $_receiver;
  private Node $_left_bracket;
  private Node $_index;
  private Node $_right_bracket;

  public function __construct(
    Node $receiver,
    Node $left_bracket,
    Node $index,
    Node $right_bracket,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_receiver = $receiver;
    $this->_left_bracket = $left_bracket;
    $this->_index = $index;
    $this->_right_bracket = $right_bracket;
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
    $receiver = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['subscript_receiver'],
      $file,
      $offset,
      $source,
    );
    $offset += $receiver->getWidth();
    $left_bracket = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['subscript_left_bracket'],
      $file,
      $offset,
      $source,
    );
    $offset += $left_bracket->getWidth();
    $index = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['subscript_index'],
      $file,
      $offset,
      $source,
    );
    $offset += $index->getWidth();
    $right_bracket = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['subscript_right_bracket'],
      $file,
      $offset,
      $source,
    );
    $offset += $right_bracket->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      $receiver,
      $left_bracket,
      $index,
      $right_bracket,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'receiver' => $this->_receiver,
      'left_bracket' => $this->_left_bracket,
      'index' => $this->_index,
      'right_bracket' => $this->_right_bracket,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $receiver = $rewriter($this->_receiver, $parents);
    $left_bracket = $rewriter($this->_left_bracket, $parents);
    $index = $rewriter($this->_index, $parents);
    $right_bracket = $rewriter($this->_right_bracket, $parents);
    if (
      $receiver === $this->_receiver &&
      $left_bracket === $this->_left_bracket &&
      $index === $this->_index &&
      $right_bracket === $this->_right_bracket
    ) {
      return $this;
    }
    return new static($receiver, $left_bracket, $index, $right_bracket);
  }

  public function getReceiverUNTYPED(): Node {
    return $this->_receiver;
  }

  public function withReceiver(Node $value): this {
    if ($value === $this->_receiver) {
      return $this;
    }
    return new static(
      $value,
      $this->_left_bracket,
      $this->_index,
      $this->_right_bracket,
    );
  }

  public function hasReceiver(): bool {
    return !$this->_receiver->isMissing();
  }

  /**
   * @return ArrayCreationExpression | ArrayIntrinsicExpression |
   * FunctionCallExpression | LiteralExpression | MemberSelectionExpression |
   * ParenthesizedExpression | SafeMemberSelectionExpression |
   * ScopeResolutionExpression | SubscriptExpression | NameToken |
   * VariableExpression
   */
  <<__Memoize>>
  public function getReceiver(): IExpression {
    return __Private\Wrap\wrap_IExpression($this->_receiver);
  }

  /**
   * @return ArrayCreationExpression | ArrayIntrinsicExpression |
   * FunctionCallExpression | LiteralExpression | MemberSelectionExpression |
   * ParenthesizedExpression | SafeMemberSelectionExpression |
   * ScopeResolutionExpression | SubscriptExpression | NameToken |
   * VariableExpression
   */
  public function getReceiverx(): IExpression {
    return $this->getReceiver();
  }

  public function getLeftBracketUNTYPED(): Node {
    return $this->_left_bracket;
  }

  public function withLeftBracket(Node $value): this {
    if ($value === $this->_left_bracket) {
      return $this;
    }
    return new static(
      $this->_receiver,
      $value,
      $this->_index,
      $this->_right_bracket,
    );
  }

  public function hasLeftBracket(): bool {
    return !$this->_left_bracket->isMissing();
  }

  /**
   * @return LeftBracketToken | LeftBraceToken
   */
  public function getLeftBracket(): Token {
    return TypeAssert\instance_of(Token::class, $this->_left_bracket);
  }

  /**
   * @return LeftBracketToken | LeftBraceToken
   */
  public function getLeftBracketx(): Token {
    return $this->getLeftBracket();
  }

  public function getIndexUNTYPED(): Node {
    return $this->_index;
  }

  public function withIndex(Node $value): this {
    if ($value === $this->_index) {
      return $this;
    }
    return new static(
      $this->_receiver,
      $this->_left_bracket,
      $value,
      $this->_right_bracket,
    );
  }

  public function hasIndex(): bool {
    return !$this->_index->isMissing();
  }

  /**
   * @return AnonymousFunction | ArrayIntrinsicExpression | BinaryExpression |
   * CastExpression | FunctionCallExpression | LiteralExpression |
   * MemberSelectionExpression | null | ObjectCreationExpression |
   * ParenthesizedExpression | PostfixUnaryExpression | PrefixUnaryExpression |
   * ScopeResolutionExpression | SubscriptExpression | NameToken |
   * VariableExpression
   */
  <<__Memoize>>
  public function getIndex(): ?IExpression {
    if ($this->_index->isMissing()) {
      return null;
    }
    return __Private\Wrap\wrap_IExpression($this->_index);
  }

  /**
   * @return AnonymousFunction | ArrayIntrinsicExpression | BinaryExpression |
   * CastExpression | FunctionCallExpression | LiteralExpression |
   * MemberSelectionExpression | ObjectCreationExpression |
   * ParenthesizedExpression | PostfixUnaryExpression | PrefixUnaryExpression |
   * ScopeResolutionExpression | SubscriptExpression | NameToken |
   * VariableExpression
   */
  public function getIndexx(): IExpression {
    return TypeAssert\not_null($this->getIndex());
  }

  public function getRightBracketUNTYPED(): Node {
    return $this->_right_bracket;
  }

  public function withRightBracket(Node $value): this {
    if ($value === $this->_right_bracket) {
      return $this;
    }
    return new static(
      $this->_receiver,
      $this->_left_bracket,
      $this->_index,
      $value,
    );
  }

  public function hasRightBracket(): bool {
    return !$this->_right_bracket->isMissing();
  }

  /**
   * @return RightBracketToken | RightBraceToken
   */
  public function getRightBracket(): Token {
    return TypeAssert\instance_of(Token::class, $this->_right_bracket);
  }

  /**
   * @return RightBracketToken | RightBraceToken
   */
  public function getRightBracketx(): Token {
    return $this->getRightBracket();
  }
}
