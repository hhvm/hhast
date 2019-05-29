/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<0c173085dc42f10444f3a7c242e5e3bf>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class ConstructorCall extends Node {

  const string SYNTAX_KIND = 'constructor_call';

  private Node $_type;
  private Node $_left_paren;
  private Node $_argument_list;
  private Node $_right_paren;

  public function __construct(
    Node $type,
    Node $left_paren,
    Node $argument_list,
    Node $right_paren,
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
    dict<string, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
  ): this {
    $offset = $initial_offset;
    $type = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['constructor_call_type'],
      $file,
      $offset,
      $source,
    );
    $offset += $type->getWidth();
    $left_paren = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['constructor_call_left_paren'],
      $file,
      $offset,
      $source,
    );
    $offset += $left_paren->getWidth();
    $argument_list = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['constructor_call_argument_list'],
      $file,
      $offset,
      $source,
    );
    $offset += $argument_list->getWidth();
    $right_paren = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['constructor_call_right_paren'],
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
      $type,
      $left_paren,
      $argument_list,
      $right_paren,
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
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $type = $rewriter($this->_type, $parents);
    $left_paren = $rewriter($this->_left_paren, $parents);
    $argument_list = $rewriter($this->_argument_list, $parents);
    $right_paren = $rewriter($this->_right_paren, $parents);
    if (
      $type === $this->_type &&
      $left_paren === $this->_left_paren &&
      $argument_list === $this->_argument_list &&
      $right_paren === $this->_right_paren
    ) {
      return $this;
    }
    return new static($type, $left_paren, $argument_list, $right_paren);
  }

  public function getTypeUNTYPED(): Node {
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
    return !$this->_type->isMissing();
  }

  /**
   * @return GenericTypeSpecifier | MemberSelectionExpression |
   * ParenthesizedExpression | QualifiedName | ScopeResolutionExpression |
   * SimpleTypeSpecifier | SubscriptExpression | NameToken | ParentToken |
   * SelfToken | StaticToken | VariableExpression
   */
  public function getType(): Node {
    return $this->_type;
  }

  /**
   * @return GenericTypeSpecifier | MemberSelectionExpression |
   * ParenthesizedExpression | QualifiedName | ScopeResolutionExpression |
   * SimpleTypeSpecifier | SubscriptExpression | NameToken | ParentToken |
   * SelfToken | StaticToken | VariableExpression
   */
  public function getTypex(): Node {
    return $this->getType();
  }

  public function getLeftParenUNTYPED(): Node {
    return $this->_left_paren;
  }

  public function withLeftParen(Node $value): this {
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
    return !$this->_left_paren->isMissing();
  }

  /**
   * @return null | LeftParenToken
   */
  public function getLeftParen(): ?LeftParenToken {
    if ($this->_left_paren->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(LeftParenToken::class, $this->_left_paren);
  }

  /**
   * @return LeftParenToken
   */
  public function getLeftParenx(): LeftParenToken {
    return TypeAssert\not_null($this->getLeftParen());
  }

  public function getArgumentListUNTYPED(): Node {
    return $this->_argument_list;
  }

  public function withArgumentList(Node $value): this {
    if ($value === $this->_argument_list) {
      return $this;
    }
    return new static(
      $this->_type,
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
   * NodeList<ArrayCreationExpression> | NodeList<ArrayIntrinsicExpression> |
   * NodeList<BinaryExpression> | NodeList<CastExpression> |
   * NodeList<CollectionLiteralExpression> | NodeList<ConditionalExpression> |
   * NodeList<DarrayIntrinsicExpression> | NodeList<DecoratedExpression> |
   * NodeList<DictionaryIntrinsicExpression> | NodeList<FunctionCallExpression>
   * | NodeList<LambdaExpression> | NodeList<LiteralExpression> |
   * NodeList<MemberSelectionExpression> | NodeList<ObjectCreationExpression> |
   * NodeList<ParenthesizedExpression> | NodeList<PipeVariableExpression> |
   * NodeList<PrefixUnaryExpression> | NodeList<ScopeResolutionExpression> |
   * NodeList<ShapeExpression> | NodeList<SubscriptExpression> |
   * NodeList<NameToken> | NodeList<TupleExpression> |
   * NodeList<VariableExpression> | NodeList<VarrayIntrinsicExpression> |
   * NodeList<VectorIntrinsicExpression> | null
   */
  public function getArgumentList(): ?NodeList<IExpression> {
    if ($this->_argument_list->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(NodeList::class, $this->_argument_list);
  }

  /**
   * @return NodeList<AnonymousFunction> | NodeList<IExpression> |
   * NodeList<ArrayCreationExpression> | NodeList<ArrayIntrinsicExpression> |
   * NodeList<BinaryExpression> | NodeList<CastExpression> |
   * NodeList<CollectionLiteralExpression> | NodeList<ConditionalExpression> |
   * NodeList<DarrayIntrinsicExpression> | NodeList<DecoratedExpression> |
   * NodeList<DictionaryIntrinsicExpression> | NodeList<FunctionCallExpression>
   * | NodeList<LambdaExpression> | NodeList<LiteralExpression> |
   * NodeList<MemberSelectionExpression> | NodeList<ObjectCreationExpression> |
   * NodeList<ParenthesizedExpression> | NodeList<PipeVariableExpression> |
   * NodeList<PrefixUnaryExpression> | NodeList<ScopeResolutionExpression> |
   * NodeList<ShapeExpression> | NodeList<SubscriptExpression> |
   * NodeList<NameToken> | NodeList<TupleExpression> |
   * NodeList<VariableExpression> | NodeList<VarrayIntrinsicExpression> |
   * NodeList<VectorIntrinsicExpression>
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
      $this->_type,
      $this->_left_paren,
      $this->_argument_list,
      $value,
    );
  }

  public function hasRightParen(): bool {
    return !$this->_right_paren->isMissing();
  }

  /**
   * @return null | RightParenToken
   */
  public function getRightParen(): ?RightParenToken {
    if ($this->_right_paren->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(RightParenToken::class, $this->_right_paren);
  }

  /**
   * @return RightParenToken
   */
  public function getRightParenx(): RightParenToken {
    return TypeAssert\not_null($this->getRightParen());
  }
}
