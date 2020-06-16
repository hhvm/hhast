/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<63095347295063ac2853022527be4ef9>>
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
  private LeftBracketToken $_left_bracket;
  private ?IExpression $_index;
  private RightBracketToken $_right_bracket;

  public function __construct(
    IExpression $receiver,
    LeftBracketToken $left_bracket,
    ?IExpression $index,
    RightBracketToken $right_bracket,
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
      'LeftBracketToken',
    );
    $left_bracket = $left_bracket as nonnull;
    $offset += $left_bracket->getWidth();
    $index = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['subscript_index'] ?? dict['kind' => 'missing'],
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
      'RightBracketToken',
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
   * @return FunctionCallExpression | LiteralExpression |
   * MemberSelectionExpression | ParenthesizedExpression |
   * SafeMemberSelectionExpression | ScopeResolutionExpression |
   * SubscriptExpression | NameToken | VariableExpression |
   * VarrayIntrinsicExpression
   */
  public function getReceiver(): IExpression {
    return TypeAssert\instance_of(IExpression::class, $this->_receiver);
  }

  /**
   * @return FunctionCallExpression | LiteralExpression |
   * MemberSelectionExpression | ParenthesizedExpression |
   * SafeMemberSelectionExpression | ScopeResolutionExpression |
   * SubscriptExpression | NameToken | VariableExpression |
   * VarrayIntrinsicExpression
   */
  public function getReceiverx(): IExpression {
    return $this->getReceiver();
  }

  public function getLeftBracketUNTYPED(): ?Node {
    return $this->_left_bracket;
  }

  public function withLeftBracket(LeftBracketToken $value): this {
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
   * @return LeftBracketToken
   */
  public function getLeftBracket(): LeftBracketToken {
    return TypeAssert\instance_of(
      LeftBracketToken::class,
      $this->_left_bracket,
    );
  }

  /**
   * @return LeftBracketToken
   */
  public function getLeftBracketx(): LeftBracketToken {
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
   * @return BinaryExpression | CastExpression | FunctionCallExpression |
   * LiteralExpression | MemberSelectionExpression | null |
   * ParenthesizedExpression | PostfixUnaryExpression | PrefixUnaryExpression |
   * ScopeResolutionExpression | SubscriptExpression | NameToken |
   * VariableExpression
   */
  public function getIndex(): ?IExpression {
    return $this->_index;
  }

  /**
   * @return BinaryExpression | CastExpression | FunctionCallExpression |
   * LiteralExpression | MemberSelectionExpression | ParenthesizedExpression |
   * PostfixUnaryExpression | PrefixUnaryExpression | ScopeResolutionExpression
   * | SubscriptExpression | NameToken | VariableExpression
   */
  public function getIndexx(): IExpression {
    return TypeAssert\not_null($this->getIndex());
  }

  public function getRightBracketUNTYPED(): ?Node {
    return $this->_right_bracket;
  }

  public function withRightBracket(RightBracketToken $value): this {
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
   * @return RightBracketToken
   */
  public function getRightBracket(): RightBracketToken {
    return TypeAssert\instance_of(
      RightBracketToken::class,
      $this->_right_bracket,
    );
  }

  /**
   * @return RightBracketToken
   */
  public function getRightBracketx(): RightBracketToken {
    return $this->getRightBracket();
  }
}
