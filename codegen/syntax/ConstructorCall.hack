/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<e75f27825b63a3cec31f0ea6655e2591>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;
/* HHAST_IGNORE_ALL[5607] 5607 is ignored because of false positives when comparing a generic to a typed value */
/* HHAST_IGNORE_ALL[5624] HHAST_IGNORE_ALL[5639] 5624 and 5639 are ignored because they insist on using co(tra)variant generics. Could this break external consumers? */

<<__ConsistentConstruct>>
final class ConstructorCall extends Node {

  const string SYNTAX_KIND = 'constructor_call';

  private Node $_type;
  private ?LeftParenToken $_left_paren;
  private ?NodeList<ListItem<IExpression>> $_argument_list;
  private ?RightParenToken $_right_paren;

  public function __construct(
    Node $type,
    ?LeftParenToken $left_paren,
    ?NodeList<ListItem<IExpression>> $argument_list,
    ?RightParenToken $right_paren,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_type = $type;
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
    $type = Node::fromJSON(
      ($json['constructor_call_type']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'Node',
    );
    $type = $type as nonnull;
    $offset += $type->getWidth();
    $left_paren = Node::fromJSON(
      ($json['constructor_call_left_paren'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'LeftParenToken',
    );
    $offset += $left_paren?->getWidth() ?? 0;
    $argument_list = Node::fromJSON(
      ($json['constructor_call_argument_list'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'NodeList<ListItem<IExpression>>',
    );
    $offset += $argument_list?->getWidth() ?? 0;
    $right_paren = Node::fromJSON(
      ($json['constructor_call_right_paren'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'RightParenToken',
    );
    $offset += $right_paren?->getWidth() ?? 0;
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      $type,
      $left_paren as ?LeftParenToken,
      \HH\FIXME\UNSAFE_CAST<?NodeList<Node>, ?NodeList<ListItem<IExpression>>>(
        $argument_list as ?NodeList<_>,
        'Open for sound approaches that are not O(n).',
      ),
      $right_paren as ?RightParenToken,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'type' => $this->_type,
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
    $type = $rewriter($this->_type, $parents);
    $left_paren = $this->_left_paren === null
      ? null
      : $rewriter($this->_left_paren, $parents);
    $argument_list = $this->_argument_list === null
      ? null
      : $rewriter($this->_argument_list, $parents);
    $right_paren = $this->_right_paren === null
      ? null
      : $rewriter($this->_right_paren, $parents);
    if (
      $type === $this->_type &&
      $left_paren === $this->_left_paren &&
      $argument_list === $this->_argument_list &&
      $right_paren === $this->_right_paren
    ) {
      return $this;
    }
    return new static(
      $type as Node,
      $left_paren as ?LeftParenToken,
      \HH\FIXME\UNSAFE_CAST<?NodeList<Node>, ?NodeList<ListItem<IExpression>>>(
        $argument_list as ?NodeList<_>,
        'Open for sound approaches that are not O(n).',
      ),
      $right_paren as ?RightParenToken,
    );
  }

  public function getTypeUNTYPED(): ?Node {
    return $this->_type;
  }

  public function withType(Node $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return new static(
      $value,
      $this->_left_paren,
      $this->_argument_list,
      $this->_right_paren,
    );
  }

  public function hasType(): bool {
    return true;
  }

  /**
   * @return GenericTypeSpecifier | QualifiedName | ScopeResolutionExpression |
   * SimpleTypeSpecifier | NameToken | ParentToken | SelfToken | StaticToken |
   * VariableExpression
   */
  public function getType(): Node {
    return $this->_type;
  }

  /**
   * @return GenericTypeSpecifier | QualifiedName | ScopeResolutionExpression |
   * SimpleTypeSpecifier | NameToken | ParentToken | SelfToken | StaticToken |
   * VariableExpression
   */
  public function getTypex(): Node {
    return $this->getType();
  }

  public function getLeftParenUNTYPED(): ?Node {
    return $this->_left_paren;
  }

  public function withLeftParen(?LeftParenToken $value): this {
    if ($value === $this->_left_paren) {
      return $this;
    }
    return new static(
      $this->_type,
      $value,
      $this->_argument_list,
      $this->_right_paren,
    );
  }

  public function hasLeftParen(): bool {
    return $this->_left_paren !== null;
  }

  /**
   * @return null | LeftParenToken
   */
  public function getLeftParen(): ?LeftParenToken {
    return $this->_left_paren;
  }

  /**
   * @return LeftParenToken
   */
  public function getLeftParenx(): LeftParenToken {
    return TypeAssert\not_null($this->getLeftParen());
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
    return
      new static($this->_type, $this->_left_paren, $value, $this->_right_paren);
  }

  public function hasArgumentList(): bool {
    return $this->_argument_list !== null;
  }

  /**
   * @return NodeList<ListItem<AnonymousFunction>> |
   * NodeList<ListItem<IExpression>> | NodeList<ListItem<BinaryExpression>> |
   * NodeList<ListItem<CastExpression>> |
   * NodeList<ListItem<CollectionLiteralExpression>> |
   * NodeList<ListItem<ConditionalExpression>> |
   * NodeList<ListItem<DarrayIntrinsicExpression>> |
   * NodeList<ListItem<DecoratedExpression>> |
   * NodeList<ListItem<DictionaryIntrinsicExpression>> |
   * NodeList<ListItem<EnumClassLabelExpression>> |
   * NodeList<ListItem<FunctionCallExpression>> |
   * NodeList<ListItem<FunctionPointerExpression>> |
   * NodeList<ListItem<KeysetIntrinsicExpression>> |
   * NodeList<ListItem<LambdaExpression>> |
   * NodeList<ListItem<LiteralExpression>> |
   * NodeList<ListItem<MemberSelectionExpression>> |
   * NodeList<ListItem<ObjectCreationExpression>> |
   * NodeList<ListItem<ParenthesizedExpression>> |
   * NodeList<ListItem<PrefixUnaryExpression>> |
   * NodeList<ListItem<ScopeResolutionExpression>> |
   * NodeList<ListItem<ShapeExpression>> |
   * NodeList<ListItem<SubscriptExpression>> | NodeList<ListItem<NameToken>> |
   * NodeList<ListItem<TupleExpression>> |
   * NodeList<ListItem<VariableExpression>> |
   * NodeList<ListItem<VarrayIntrinsicExpression>> |
   * NodeList<ListItem<VectorIntrinsicExpression>> | null
   */
  public function getArgumentList(): ?NodeList<ListItem<IExpression>> {
    return $this->_argument_list;
  }

  /**
   * @return NodeList<ListItem<AnonymousFunction>> |
   * NodeList<ListItem<IExpression>> | NodeList<ListItem<BinaryExpression>> |
   * NodeList<ListItem<CastExpression>> |
   * NodeList<ListItem<CollectionLiteralExpression>> |
   * NodeList<ListItem<ConditionalExpression>> |
   * NodeList<ListItem<DarrayIntrinsicExpression>> |
   * NodeList<ListItem<DecoratedExpression>> |
   * NodeList<ListItem<DictionaryIntrinsicExpression>> |
   * NodeList<ListItem<EnumClassLabelExpression>> |
   * NodeList<ListItem<FunctionCallExpression>> |
   * NodeList<ListItem<FunctionPointerExpression>> |
   * NodeList<ListItem<KeysetIntrinsicExpression>> |
   * NodeList<ListItem<LambdaExpression>> |
   * NodeList<ListItem<LiteralExpression>> |
   * NodeList<ListItem<MemberSelectionExpression>> |
   * NodeList<ListItem<ObjectCreationExpression>> |
   * NodeList<ListItem<ParenthesizedExpression>> |
   * NodeList<ListItem<PrefixUnaryExpression>> |
   * NodeList<ListItem<ScopeResolutionExpression>> |
   * NodeList<ListItem<ShapeExpression>> |
   * NodeList<ListItem<SubscriptExpression>> | NodeList<ListItem<NameToken>> |
   * NodeList<ListItem<TupleExpression>> |
   * NodeList<ListItem<VariableExpression>> |
   * NodeList<ListItem<VarrayIntrinsicExpression>> |
   * NodeList<ListItem<VectorIntrinsicExpression>>
   */
  public function getArgumentListx(): NodeList<ListItem<IExpression>> {
    return TypeAssert\not_null($this->getArgumentList());
  }

  public function getRightParenUNTYPED(): ?Node {
    return $this->_right_paren;
  }

  public function withRightParen(?RightParenToken $value): this {
    if ($value === $this->_right_paren) {
      return $this;
    }
    return new static(
      $this->_type,
      $this->_left_paren,
      $this->_argument_list,
      $value,
    );
  }

  public function hasRightParen(): bool {
    return $this->_right_paren !== null;
  }

  /**
   * @return null | RightParenToken
   */
  public function getRightParen(): ?RightParenToken {
    return $this->_right_paren;
  }

  /**
   * @return RightParenToken
   */
  public function getRightParenx(): RightParenToken {
    return TypeAssert\not_null($this->getRightParen());
  }
}
