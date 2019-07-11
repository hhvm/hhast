/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<ade909343e7b21cb247f6f6fde866c2e>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class SubscriptExpression
  extends Node
  implements ILambdaBody, IExpression {

  const string SYNTAX_KIND = 'subscript_expression';

  private IExpression $_receiver;
  private Token $_left_bracket;
  private ?IExpression $_index;
  private Token $_right_bracket;

  public function __construct(
    IExpression $receiver,
    Token $left_bracket,
    ?IExpression $index,
    Token $right_bracket,
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
    string $_type_hint,
  ): this {
    $offset = $initial_offset;
    $receiver = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['subscript_receiver'],
      $file,
      $offset,
      $source,
      'IExpression',
    );
    $receiver = $receiver as nonnull;
    $offset += $receiver->getWidth();
    $left_bracket = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['subscript_left_bracket'],
      $file,
      $offset,
      $source,
      'Token',
    );
    $left_bracket = $left_bracket as nonnull;
    $offset += $left_bracket->getWidth();
    $index = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['subscript_index'],
      $file,
      $offset,
      $source,
      'IExpression',
    );
    $offset += $index?->getWidth() ?? 0;
    $right_bracket = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['subscript_right_bracket'],
      $file,
      $offset,
      $source,
      'Token',
    );
    $right_bracket = $right_bracket as nonnull;
    $offset += $right_bracket->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $receiver,
      /* HH_IGNORE_ERROR[4110] */ $left_bracket,
      /* HH_IGNORE_ERROR[4110] */ $index,
      /* HH_IGNORE_ERROR[4110] */ $right_bracket,
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
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $receiver = $rewriter($this->_receiver, $parents);
    $left_bracket = $rewriter($this->_left_bracket, $parents);
    $index = $this->_index === null ? null : $rewriter($this->_index, $parents);
    $right_bracket = $rewriter($this->_right_bracket, $parents);
    if (
      $receiver === $this->_receiver &&
      $left_bracket === $this->_left_bracket &&
      $index === $this->_index &&
      $right_bracket === $this->_right_bracket
    ) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $receiver,
      /* HH_FIXME[4110] use `as` */ $left_bracket,
      /* HH_FIXME[4110] use `as` */ $index,
      /* HH_FIXME[4110] use `as` */ $right_bracket,
    );
  }

  public function getReceiverUNTYPED(): ?Node {
    return $this->_receiver;
  }

  public function withReceiver(IExpression $value): this {
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
    return $this->_receiver !== null;
  }

  /**
   * @return ArrayCreationExpression | ArrayIntrinsicExpression |
   * FunctionCallExpression | LiteralExpression | MemberSelectionExpression |
   * ParenthesizedExpression | SafeMemberSelectionExpression |
   * ScopeResolutionExpression | SubscriptExpression | NameToken |
   * VariableExpression
   */
  public function getReceiver(): IExpression {
    return TypeAssert\instance_of(IExpression::class, $this->_receiver);
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

  public function getLeftBracketUNTYPED(): ?Node {
    return $this->_left_bracket;
  }

  public function withLeftBracket(Token $value): this {
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
    return $this->_left_bracket !== null;
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

  public function getIndexUNTYPED(): ?Node {
    return $this->_index;
  }

  public function withIndex(?IExpression $value): this {
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
    return $this->_index !== null;
  }

  /**
   * @return AnonymousFunction | ArrayIntrinsicExpression | BinaryExpression |
   * CastExpression | FunctionCallExpression | LiteralExpression |
   * MemberSelectionExpression | null | ObjectCreationExpression |
   * ParenthesizedExpression | PostfixUnaryExpression | PrefixUnaryExpression |
   * ScopeResolutionExpression | SubscriptExpression | NameToken |
   * VariableExpression
   */
  public function getIndex(): ?IExpression {
    return $this->_index;
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

  public function getRightBracketUNTYPED(): ?Node {
    return $this->_right_bracket;
  }

  public function withRightBracket(Token $value): this {
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
    return $this->_right_bracket !== null;
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
