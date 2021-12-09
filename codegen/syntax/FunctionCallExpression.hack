/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<9600f44317ae881bd473e126ff0dd2c1>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;
/* HHAST_IGNORE_ALL[5607] 5607 is ignored because of false positives when comparing a generic to a typed value */
/* HHAST_IGNORE_ALL[5624] HHAST_IGNORE_ALL[5639] 5624 and 5639 are ignored because they insist on using co(tra)variant generics. Could this break external consumers? */

<<__ConsistentConstruct>>
final class FunctionCallExpression
  extends Node
  implements IFunctionCallishExpression, ILambdaBody, IExpression {

  const string SYNTAX_KIND = 'function_call_expression';

  private Node $_receiver;
  private ?TypeArguments $_type_args;
  private ?EnumClassLabelExpression $_enum_class_label;
  private LeftParenToken $_left_paren;
  private ?NodeList<ListItem<IExpression>> $_argument_list;
  private RightParenToken $_right_paren;

  public function __construct(
    Node $receiver,
    ?TypeArguments $type_args,
    ?EnumClassLabelExpression $enum_class_label,
    LeftParenToken $left_paren,
    ?NodeList<ListItem<IExpression>> $argument_list,
    RightParenToken $right_paren,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_receiver = $receiver;
    $this->_type_args = $type_args;
    $this->_enum_class_label = $enum_class_label;
    $this->_left_paren = $left_paren;
    $this->_argument_list = $argument_list;
    $this->_right_paren = $right_paren;
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
    $receiver = Node::fromJSON(
      ($json['function_call_receiver']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'Node',
    );
    $receiver = $receiver as nonnull;
    $offset += $receiver->getWidth();
    $type_args = Node::fromJSON(
      ($json['function_call_type_args'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'TypeArguments',
    );
    $offset += $type_args?->getWidth() ?? 0;
    $enum_class_label = Node::fromJSON(
      ($json['function_call_enum_class_label'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'EnumClassLabelExpression',
    );
    $offset += $enum_class_label?->getWidth() ?? 0;
    $left_paren = Node::fromJSON(
      ($json['function_call_left_paren']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'LeftParenToken',
    );
    $left_paren = $left_paren as nonnull;
    $offset += $left_paren->getWidth();
    $argument_list = Node::fromJSON(
      ($json['function_call_argument_list'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'NodeList<ListItem<IExpression>>',
    );
    $offset += $argument_list?->getWidth() ?? 0;
    $right_paren = Node::fromJSON(
      ($json['function_call_right_paren']) as dict<_, _>,
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
      /* HH_IGNORE_ERROR[4110] */ $enum_class_label,
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
      'enum_class_label' => $this->_enum_class_label,
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
    $enum_class_label = $this->_enum_class_label === null
      ? null
      : $rewriter($this->_enum_class_label, $parents);
    $left_paren = $rewriter($this->_left_paren, $parents);
    $argument_list = $this->_argument_list === null
      ? null
      : $rewriter($this->_argument_list, $parents);
    $right_paren = $rewriter($this->_right_paren, $parents);
    if (
      $receiver === $this->_receiver &&
      $type_args === $this->_type_args &&
      $enum_class_label === $this->_enum_class_label &&
      $left_paren === $this->_left_paren &&
      $argument_list === $this->_argument_list &&
      $right_paren === $this->_right_paren
    ) {
      return $this;
    }
    return new static(
      $receiver as Node,
      $type_args as ?TypeArguments,
      $enum_class_label as ?EnumClassLabelExpression,
      $left_paren as LeftParenToken,
      /* HH_FIXME[4110] ?NodeList<ListItem<IExpression>> may not be enforceable */ $argument_list,
      $right_paren as RightParenToken,
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
      $this->_enum_class_label,
      $this->_left_paren,
      $this->_argument_list,
      $this->_right_paren,
    );
  }

  public function hasReceiver(): bool {
    return true;
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
      $this->_enum_class_label,
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

  public function getEnumClassLabelUNTYPED(): ?Node {
    return $this->_enum_class_label;
  }

  public function withEnumClassLabel(?EnumClassLabelExpression $value): this {
    if ($value === $this->_enum_class_label) {
      return $this;
    }
    return new static(
      $this->_receiver,
      $this->_type_args,
      $value,
      $this->_left_paren,
      $this->_argument_list,
      $this->_right_paren,
    );
  }

  public function hasEnumClassLabel(): bool {
    return $this->_enum_class_label !== null;
  }

  /**
   * @return EnumClassLabelExpression | null
   */
  public function getEnumClassLabel(): ?EnumClassLabelExpression {
    return $this->_enum_class_label;
  }

  /**
   * @return EnumClassLabelExpression
   */
  public function getEnumClassLabelx(): EnumClassLabelExpression {
    return TypeAssert\not_null($this->getEnumClassLabel());
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
      $this->_enum_class_label,
      $value,
      $this->_argument_list,
      $this->_right_paren,
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
      $this->_enum_class_label,
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
   * NodeList<ListItem<EnumClassLabelExpression>> |
   * NodeList<ListItem<FunctionCallExpression>> |
   * NodeList<ListItem<IFunctionCallishExpression>> |
   * NodeList<ListItem<FunctionPointerExpression>> |
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
   * NodeList<ListItem<EnumClassLabelExpression>> |
   * NodeList<ListItem<FunctionCallExpression>> |
   * NodeList<ListItem<IFunctionCallishExpression>> |
   * NodeList<ListItem<FunctionPointerExpression>> |
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
      $this->_enum_class_label,
      $this->_left_paren,
      $this->_argument_list,
      $value,
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
}
