/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<6476ec2ecf79454cd4902f6d79ffc865>>
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
  ): this {
    $offset = $initial_offset;
    $receiver = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['function_call_receiver'],
      $file,
      $offset,
      $source,
    );
    $offset += $receiver->getWidth();
    $type_args = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['function_call_type_args'],
      $file,
      $offset,
      $source,
    );
    $offset += $type_args->getWidth();
    $left_paren = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['function_call_left_paren'],
      $file,
      $offset,
      $source,
    );
    $offset += $left_paren->getWidth();
    $argument_list = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['function_call_argument_list'],
      $file,
      $offset,
      $source,
    );
    $offset += $argument_list->getWidth();
    $right_paren = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['function_call_right_paren'],
      $file,
      $offset,
      $source,
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
      $value,
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

  public function withTypeArgs(Node $value): this {
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

  public function withLeftParen(Node $value): this {
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

  public function withArgumentList(Node $value): this {
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
    return !$this->_argument_list->isMissing();
  }

  /**
   * @return NodeList<AnonymousFunction> | NodeList<IExpression> |
   * NodeList<ArrayCreationExpression> | NodeList<IContainer> |
   * NodeList<ArrayIntrinsicExpression> | NodeList<AsExpression> |
   * NodeList<AwaitableCreationExpression> | NodeList<BinaryExpression> |
   * NodeList<IHasOperator> | NodeList<CastExpression> |
   * NodeList<CollectionLiteralExpression> | NodeList<ConditionalExpression> |
   * NodeList<DarrayIntrinsicExpression> | NodeList<DecoratedExpression> |
   * NodeList<DictionaryIntrinsicExpression> | NodeList<IHackArray> |
   * NodeList<EmptyExpression> | NodeList<EvalExpression> |
   * NodeList<FunctionCallExpression> | NodeList<IFunctionCallishExpression> |
   * NodeList<InstanceofExpression> | NodeList<IsExpression> |
   * NodeList<IssetExpression> | NodeList<KeysetIntrinsicExpression> |
   * NodeList<LambdaExpression> | NodeList<LiteralExpression> |
   * NodeList<MemberSelectionExpression> | NodeList<ObjectCreationExpression> |
   * NodeList<ParenthesizedExpression> | NodeList<PipeVariableExpression> |
   * NodeList<PostfixUnaryExpression> | NodeList<PrefixUnaryExpression> |
   * NodeList<QualifiedName> | NodeList<SafeMemberSelectionExpression> |
   * NodeList<ScopeResolutionExpression> | NodeList<ShapeExpression> |
   * NodeList<SubscriptExpression> | NodeList<NameToken> |
   * NodeList<TupleExpression> | NodeList<VariableExpression> |
   * NodeList<VarrayIntrinsicExpression> | NodeList<VectorIntrinsicExpression>
   * | NodeList<XHPExpression> | null
   */
  public function getArgumentList(): ?NodeList<IExpression> {
    if ($this->_argument_list->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(NodeList::class, $this->_argument_list);
  }

  /**
   * @return NodeList<AnonymousFunction> | NodeList<IExpression> |
   * NodeList<ArrayCreationExpression> | NodeList<IContainer> |
   * NodeList<ArrayIntrinsicExpression> | NodeList<AsExpression> |
   * NodeList<AwaitableCreationExpression> | NodeList<BinaryExpression> |
   * NodeList<IHasOperator> | NodeList<CastExpression> |
   * NodeList<CollectionLiteralExpression> | NodeList<ConditionalExpression> |
   * NodeList<DarrayIntrinsicExpression> | NodeList<DecoratedExpression> |
   * NodeList<DictionaryIntrinsicExpression> | NodeList<IHackArray> |
   * NodeList<EmptyExpression> | NodeList<EvalExpression> |
   * NodeList<FunctionCallExpression> | NodeList<IFunctionCallishExpression> |
   * NodeList<InstanceofExpression> | NodeList<IsExpression> |
   * NodeList<IssetExpression> | NodeList<KeysetIntrinsicExpression> |
   * NodeList<LambdaExpression> | NodeList<LiteralExpression> |
   * NodeList<MemberSelectionExpression> | NodeList<ObjectCreationExpression> |
   * NodeList<ParenthesizedExpression> | NodeList<PipeVariableExpression> |
   * NodeList<PostfixUnaryExpression> | NodeList<PrefixUnaryExpression> |
   * NodeList<QualifiedName> | NodeList<SafeMemberSelectionExpression> |
   * NodeList<ScopeResolutionExpression> | NodeList<ShapeExpression> |
   * NodeList<SubscriptExpression> | NodeList<NameToken> |
   * NodeList<TupleExpression> | NodeList<VariableExpression> |
   * NodeList<VarrayIntrinsicExpression> | NodeList<VectorIntrinsicExpression>
   * | NodeList<XHPExpression>
   */
  public function getArgumentListx(): NodeList<IExpression> {
    return TypeAssert\not_null($this->getArgumentList());
  }

  public function getRightParenUNTYPED(): Node {
    return $this->_right_paren;
  }

  public function withRightParen(Node $value): this {
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
