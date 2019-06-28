/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<c67448498114a4838256910f6bd7fb31>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class FunctionCallExpression
  extends Node
  implements IFunctionCallishExpression, ILambdaBody, IExpression {

  const string SYNTAX_KIND = 'function_call_expression';

  private Node $_receiver;
  private Node $_type_args;
  private Node $_left_paren;
  private Node $_argument_list;
  private Node $_right_paren;

  public function __construct(
    Node $receiver,
    Node $type_args,
    Node $left_paren,
    Node $argument_list,
    Node $right_paren,
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
    $offset += $receiver->getWidth();
    $type_args = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['function_call_type_args'],
      $file,
      $offset,
      $source,
      'TypeArguments',
    );
    $offset += $type_args->getWidth();
    $left_paren = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['function_call_left_paren'],
      $file,
      $offset,
      $source,
      'LeftParenToken',
    );
    $offset += $left_paren->getWidth();
    $argument_list = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['function_call_argument_list'],
      $file,
      $offset,
      $source,
      'NodeList<ListItem<IExpression>>',
    );
    $offset += $argument_list->getWidth();
    $right_paren = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['function_call_right_paren'],
      $file,
      $offset,
      $source,
      'RightParenToken',
    );
    $offset += $right_paren->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      $receiver,
      $type_args,
      $left_paren,
      $argument_list,
      $right_paren,
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
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $receiver = $rewriter($this->_receiver, $parents);
    $type_args = $rewriter($this->_type_args, $parents);
    $left_paren = $rewriter($this->_left_paren, $parents);
    $argument_list = $rewriter($this->_argument_list, $parents);
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
      $receiver,
      $type_args,
      $left_paren,
      $argument_list,
      $right_paren,
    );
  }

  public function getReceiverUNTYPED(): Node {
    return $this->_receiver;
  }

  public function withReceiver(Node $value): this {
    if ($value === $this->_receiver) {
      return $this;
    }
    return new static(
      $value ?? Missing(),
      $this->_type_args,
      $this->_left_paren,
      $this->_argument_list,
      $this->_right_paren,
    );
  }

  public function hasReceiver(): bool {
    return !$this->_receiver->isMissing();
  }

  /**
   * @return array_creation_expression | function_call_expression | literal |
   * member_selection_expression | parenthesized_expression | qualified_name |
   * safe_member_selection_expression | scope_resolution_expression |
   * subscript_expression | token:name | variable
   */
  public function getReceiver(): Node {
    return $this->_receiver;
  }

  /**
   * @return array_creation_expression | function_call_expression | literal |
   * member_selection_expression | parenthesized_expression | qualified_name |
   * safe_member_selection_expression | scope_resolution_expression |
   * subscript_expression | token:name | variable
   */
  public function getReceiverx(): Node {
    return $this->getReceiver();
  }

  public function getTypeArgsUNTYPED(): Node {
    return $this->_type_args;
  }

  public function withTypeArgs(?TypeArguments $value): this {
    if ($value === $this->_type_args) {
      return $this;
    }
    return new static(
      $this->_receiver,
      $value ?? Missing(),
      $this->_left_paren,
      $this->_argument_list,
      $this->_right_paren,
    );
  }

  public function hasTypeArgs(): bool {
    return !$this->_type_args->isMissing();
  }

  /**
   * @return null | TypeArguments
   */
  public function getTypeArgs(): ?TypeArguments {
    if ($this->_type_args->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(TypeArguments::class, $this->_type_args);
  }

  /**
   * @return TypeArguments
   */
  public function getTypeArgsx(): TypeArguments {
    return TypeAssert\not_null($this->getTypeArgs());
  }

  public function getLeftParenUNTYPED(): Node {
    return $this->_left_paren;
  }

  public function withLeftParen(LeftParenToken $value): this {
    if ($value === $this->_left_paren) {
      return $this;
    }
    return new static(
      $this->_receiver,
      $this->_type_args,
      $value ?? Missing(),
      $this->_argument_list,
      $this->_right_paren,
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

  public function getArgumentListUNTYPED(): Node {
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
      $value ?? Missing(),
      $this->_right_paren,
    );
  }

  public function hasArgumentList(): bool {
    return !$this->_argument_list->isMissing();
  }

  /**
   * @return NodeList<ListItem<AnonymousFunction>> |
   * NodeList<ListItem<IExpression>> |
   * NodeList<ListItem<ArrayCreationExpression>> |
   * NodeList<ListItem<IContainer>> |
   * NodeList<ListItem<ArrayIntrinsicExpression>> |
   * NodeList<ListItem<AsExpression>> |
   * NodeList<ListItem<AwaitableCreationExpression>> |
   * NodeList<ListItem<BinaryExpression>> | NodeList<ListItem<IHasOperator>> |
   * NodeList<ListItem<CastExpression>> |
   * NodeList<ListItem<CollectionLiteralExpression>> |
   * NodeList<ListItem<ConditionalExpression>> |
   * NodeList<ListItem<DarrayIntrinsicExpression>> |
   * NodeList<ListItem<DecoratedExpression>> |
   * NodeList<ListItem<DictionaryIntrinsicExpression>> |
   * NodeList<ListItem<IHackArray>> | NodeList<ListItem<EvalExpression>> |
   * NodeList<ListItem<FunctionCallExpression>> |
   * NodeList<ListItem<IFunctionCallishExpression>> |
   * NodeList<ListItem<InstanceofExpression>> |
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
    if ($this->_argument_list->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(NodeList::class, $this->_argument_list);
  }

  /**
   * @return NodeList<ListItem<AnonymousFunction>> |
   * NodeList<ListItem<IExpression>> |
   * NodeList<ListItem<ArrayCreationExpression>> |
   * NodeList<ListItem<IContainer>> |
   * NodeList<ListItem<ArrayIntrinsicExpression>> |
   * NodeList<ListItem<AsExpression>> |
   * NodeList<ListItem<AwaitableCreationExpression>> |
   * NodeList<ListItem<BinaryExpression>> | NodeList<ListItem<IHasOperator>> |
   * NodeList<ListItem<CastExpression>> |
   * NodeList<ListItem<CollectionLiteralExpression>> |
   * NodeList<ListItem<ConditionalExpression>> |
   * NodeList<ListItem<DarrayIntrinsicExpression>> |
   * NodeList<ListItem<DecoratedExpression>> |
   * NodeList<ListItem<DictionaryIntrinsicExpression>> |
   * NodeList<ListItem<IHackArray>> | NodeList<ListItem<EvalExpression>> |
   * NodeList<ListItem<FunctionCallExpression>> |
   * NodeList<ListItem<IFunctionCallishExpression>> |
   * NodeList<ListItem<InstanceofExpression>> |
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

  public function getRightParenUNTYPED(): Node {
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
      $value ?? Missing(),
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
}
