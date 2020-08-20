/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<3566c0e9d7a94e3d5e26207fb6d886dd>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class FunctionCallExpression
  extends Node
  implements IFunctionCallishExpression, ILambdaBody, IExpression {

  const string SYNTAX_KIND = 'function_call_expression';

  private Node $_receiver;
  private ?TypeArguments $_type_args;
  private LeftParenToken $_left_paren;
  private ?NodeList<ListItem<IExpression>> $_argument_list;
  private RightParenToken $_right_paren;

  public function __construct(
    Node $receiver,
    ?TypeArguments $type_args,
    LeftParenToken $left_paren,
    ?NodeList<ListItem<IExpression>> $argument_list,
    RightParenToken $right_paren,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_receiver = $receiver;
    $this->_type_args = $type_args;
    $this->_left_paren = $left_paren;
    $this->_argument_list = $argument_list;
    $this->_right_paren = $right_paren;
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
      /* HH_FIXME[4110] */ $json['function_call_receiver'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $receiver = $receiver as nonnull;
    $offset += $receiver->getWidth();
    $type_args = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['function_call_type_args'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'TypeArguments',
    );
    $offset += $type_args?->getWidth() ?? 0;
    $left_paren = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['function_call_left_paren'],
      $file,
      $offset,
      $source,
      'LeftParenToken',
    );
    $left_paren = $left_paren as nonnull;
    $offset += $left_paren->getWidth();
    $argument_list = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['function_call_argument_list'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'NodeList<ListItem<IExpression>>',
    );
    $offset += $argument_list?->getWidth() ?? 0;
    $right_paren = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['function_call_right_paren'],
      $file,
      $offset,
      $source,
      'RightParenToken',
    );
    $right_paren = $right_paren as nonnull;
    $offset += $right_paren->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $receiver,
      /* HH_IGNORE_ERROR[4110] */ $type_args,
      /* HH_IGNORE_ERROR[4110] */ $left_paren,
      /* HH_IGNORE_ERROR[4110] */ $argument_list,
      /* HH_IGNORE_ERROR[4110] */ $right_paren,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'receiver' => $this->_receiver,
      'type_args' => $this->_type_args,
      'left_paren' => $this->_left_paren,
      'argument_list' => $this->_argument_list,
      'right_paren' => $this->_right_paren,
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
    $type_args = $this->_type_args === null
      ? null
      : $rewriter($this->_type_args, $parents);
    $left_paren = $rewriter($this->_left_paren, $parents);
    $argument_list = $this->_argument_list === null
      ? null
      : $rewriter($this->_argument_list, $parents);
    $right_paren = $rewriter($this->_right_paren, $parents);
    if (
      $receiver === $this->_receiver &&
      $type_args === $this->_type_args &&
      $left_paren === $this->_left_paren &&
      $argument_list === $this->_argument_list &&
      $right_paren === $this->_right_paren
    ) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $receiver,
      /* HH_FIXME[4110] use `as` */ $type_args,
      /* HH_FIXME[4110] use `as` */ $left_paren,
      /* HH_FIXME[4110] use `as` */ $argument_list,
      /* HH_FIXME[4110] use `as` */ $right_paren,
    );
  }

  public function getReceiverUNTYPED(): ?Node {
    return $this->_receiver;
  }

  public function withReceiver(Node $value): this {
    if ($value === $this->_receiver) {
      return $this;
    }
    return new static(
      $value,
      $this->_type_args,
      $this->_left_paren,
      $this->_argument_list,
      $this->_right_paren,
    );
  }

  public function hasReceiver(): bool {
    return $this->_receiver !== null;
  }

  /**
   * @return function_call_expression | member_selection_expression |
   * parenthesized_expression | qualified_name |
   * safe_member_selection_expression | scope_resolution_expression |
   * subscript_expression | token:name | variable
   */
  public function getReceiver(): Node {
    return $this->_receiver;
  }

  /**
   * @return function_call_expression | member_selection_expression |
   * parenthesized_expression | qualified_name |
   * safe_member_selection_expression | scope_resolution_expression |
   * subscript_expression | token:name | variable
   */
  public function getReceiverx(): Node {
    return $this->getReceiver();
  }

  public function getTypeArgsUNTYPED(): ?Node {
    return $this->_type_args;
  }

  public function withTypeArgs(?TypeArguments $value): this {
    if ($value === $this->_type_args) {
      return $this;
    }
    return new static(
      $this->_receiver,
      $value,
      $this->_left_paren,
      $this->_argument_list,
      $this->_right_paren,
    );
  }

  public function hasTypeArgs(): bool {
    return $this->_type_args !== null;
  }

  /**
   * @return null | TypeArguments
   */
  public function getTypeArgs(): ?TypeArguments {
    return $this->_type_args;
  }

  /**
   * @return TypeArguments
   */
  public function getTypeArgsx(): TypeArguments {
    return TypeAssert\not_null($this->getTypeArgs());
  }

  public function getLeftParenUNTYPED(): ?Node {
    return $this->_left_paren;
  }

  public function withLeftParen(LeftParenToken $value): this {
    if ($value === $this->_left_paren) {
      return $this;
    }
    return new static(
      $this->_receiver,
      $this->_type_args,
      $value,
      $this->_argument_list,
      $this->_right_paren,
    );
  }

  public function hasLeftParen(): bool {
    return $this->_left_paren !== null;
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

  public function getArgumentListUNTYPED(): ?Node {
    return $this->_argument_list;
  }

  public function withArgumentList(
    ?NodeList<ListItem<IExpression>> $value,
  ): this {
    if ($value === $this->_argument_list) {
      return $this;
    }
    return new static(
      $this->_receiver,
      $this->_type_args,
      $this->_left_paren,
      $value,
      $this->_right_paren,
    );
  }

  public function hasArgumentList(): bool {
    return $this->_argument_list !== null;
  }

  /**
   * @return NodeList<ListItem<AnonymousFunction>> |
   * NodeList<ListItem<IExpression>> | NodeList<ListItem<AsExpression>> |
   * NodeList<ListItem<AwaitableCreationExpression>> |
   * NodeList<ListItem<BinaryExpression>> | NodeList<ListItem<IHasOperator>> |
   * NodeList<ListItem<CastExpression>> |
   * NodeList<ListItem<CollectionLiteralExpression>> |
   * NodeList<ListItem<IContainer>> | NodeList<ListItem<ConditionalExpression>>
   * | NodeList<ListItem<DarrayIntrinsicExpression>> |
   * NodeList<ListItem<DecoratedExpression>> |
   * NodeList<ListItem<DictionaryIntrinsicExpression>> |
   * NodeList<ListItem<IHackArray>> |
   * NodeList<ListItem<FunctionCallExpression>> |
   * NodeList<ListItem<IFunctionCallishExpression>> |
   * NodeList<ListItem<IsExpression>> | NodeList<ListItem<IssetExpression>> |
   * NodeList<ListItem<KeysetIntrinsicExpression>> |
   * NodeList<ListItem<LambdaExpression>> |
   * NodeList<ListItem<LiteralExpression>> |
   * NodeList<ListItem<MemberSelectionExpression>> |
   * NodeList<ListItem<ObjectCreationExpression>> |
   * NodeList<ListItem<ParenthesizedExpression>> |
   * NodeList<ListItem<PipeVariableExpression>> |
   * NodeList<ListItem<PostfixUnaryExpression>> |
   * NodeList<ListItem<PrefixUnaryExpression>> |
   * NodeList<ListItem<QualifiedName>> |
   * NodeList<ListItem<SafeMemberSelectionExpression>> |
   * NodeList<ListItem<ScopeResolutionExpression>> |
   * NodeList<ListItem<ShapeExpression>> |
   * NodeList<ListItem<SubscriptExpression>> | NodeList<ListItem<NameToken>> |
   * NodeList<ListItem<TupleExpression>> |
   * NodeList<ListItem<VariableExpression>> |
   * NodeList<ListItem<VarrayIntrinsicExpression>> |
   * NodeList<ListItem<VectorIntrinsicExpression>> |
   * NodeList<ListItem<XHPExpression>> | null
   */
  public function getArgumentList(): ?NodeList<ListItem<IExpression>> {
    return $this->_argument_list;
  }

  /**
   * @return NodeList<ListItem<AnonymousFunction>> |
   * NodeList<ListItem<IExpression>> | NodeList<ListItem<AsExpression>> |
   * NodeList<ListItem<AwaitableCreationExpression>> |
   * NodeList<ListItem<BinaryExpression>> | NodeList<ListItem<IHasOperator>> |
   * NodeList<ListItem<CastExpression>> |
   * NodeList<ListItem<CollectionLiteralExpression>> |
   * NodeList<ListItem<IContainer>> | NodeList<ListItem<ConditionalExpression>>
   * | NodeList<ListItem<DarrayIntrinsicExpression>> |
   * NodeList<ListItem<DecoratedExpression>> |
   * NodeList<ListItem<DictionaryIntrinsicExpression>> |
   * NodeList<ListItem<IHackArray>> |
   * NodeList<ListItem<FunctionCallExpression>> |
   * NodeList<ListItem<IFunctionCallishExpression>> |
   * NodeList<ListItem<IsExpression>> | NodeList<ListItem<IssetExpression>> |
   * NodeList<ListItem<KeysetIntrinsicExpression>> |
   * NodeList<ListItem<LambdaExpression>> |
   * NodeList<ListItem<LiteralExpression>> |
   * NodeList<ListItem<MemberSelectionExpression>> |
   * NodeList<ListItem<ObjectCreationExpression>> |
   * NodeList<ListItem<ParenthesizedExpression>> |
   * NodeList<ListItem<PipeVariableExpression>> |
   * NodeList<ListItem<PostfixUnaryExpression>> |
   * NodeList<ListItem<PrefixUnaryExpression>> |
   * NodeList<ListItem<QualifiedName>> |
   * NodeList<ListItem<SafeMemberSelectionExpression>> |
   * NodeList<ListItem<ScopeResolutionExpression>> |
   * NodeList<ListItem<ShapeExpression>> |
   * NodeList<ListItem<SubscriptExpression>> | NodeList<ListItem<NameToken>> |
   * NodeList<ListItem<TupleExpression>> |
   * NodeList<ListItem<VariableExpression>> |
   * NodeList<ListItem<VarrayIntrinsicExpression>> |
   * NodeList<ListItem<VectorIntrinsicExpression>> |
   * NodeList<ListItem<XHPExpression>>
   */
  public function getArgumentListx(): NodeList<ListItem<IExpression>> {
    return TypeAssert\not_null($this->getArgumentList());
  }

  public function getRightParenUNTYPED(): ?Node {
    return $this->_right_paren;
  }

  public function withRightParen(RightParenToken $value): this {
    if ($value === $this->_right_paren) {
      return $this;
    }
    return new static(
      $this->_receiver,
      $this->_type_args,
      $this->_left_paren,
      $this->_argument_list,
      $value,
    );
  }

  public function hasRightParen(): bool {
    return $this->_right_paren !== null;
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
}
