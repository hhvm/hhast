/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<002a43b7f90f37e07befd6f3e1e730de>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class ArrayCreationExpression
  extends Node
  implements IPHPArray, IContainer, ILambdaBody, IExpression {

  const string SYNTAX_KIND = 'array_creation_expression';

  private Node $_left_bracket;
  private Node $_members;
  private Node $_right_bracket;

  public function __construct(
    Node $left_bracket,
    Node $members,
    Node $right_bracket,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_left_bracket = $left_bracket;
    $this->_members = $members;
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
    $left_bracket = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['array_creation_left_bracket'],
      $file,
      $offset,
      $source,
      'LeftBracketToken',
    );
    $offset += $left_bracket->getWidth();
    $members = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['array_creation_members'],
      $file,
      $offset,
      $source,
      'NodeList<ListItem<Node>>',
    );
    $offset += $members->getWidth();
    $right_bracket = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['array_creation_right_bracket'],
      $file,
      $offset,
      $source,
      'RightBracketToken',
    );
    $offset += $right_bracket->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static($left_bracket, $members, $right_bracket, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'left_bracket' => $this->_left_bracket,
      'members' => $this->_members,
      'right_bracket' => $this->_right_bracket,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $left_bracket = $rewriter($this->_left_bracket, $parents);
    $members = $rewriter($this->_members, $parents);
    $right_bracket = $rewriter($this->_right_bracket, $parents);
    if (
      $left_bracket === $this->_left_bracket &&
      $members === $this->_members &&
      $right_bracket === $this->_right_bracket
    ) {
      return $this;
    }
    return new static($left_bracket, $members, $right_bracket);
  }

  public function getLeftBracketUNTYPED(): Node {
    return $this->_left_bracket;
  }

  public function withLeftBracket(LeftBracketToken $value): this {
    if ($value === $this->_left_bracket) {
      return $this;
    }
    return new static(
      $value ?? Missing(),
      $this->_members,
      $this->_right_bracket,
    );
  }

  public function hasLeftBracket(): bool {
    return !$this->_left_bracket->isMissing();
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

  public function getMembersUNTYPED(): Node {
    return $this->_members;
  }

  public function withMembers(?NodeList<ListItem<Node>> $value): this {
    if ($value === $this->_members) {
      return $this;
    }
    return new static(
      $this->_left_bracket,
      $value ?? Missing(),
      $this->_right_bracket,
    );
  }

  public function hasMembers(): bool {
    return !$this->_members->isMissing();
  }

  /**
   * @return NodeList<ListItem<AnonymousFunction>> |
   * NodeList<ListItem<IExpression>> |
   * NodeList<ListItem<ArrayCreationExpression>> |
   * NodeList<ListItem<IPHPArray>> | NodeList<ListItem<IContainer>> |
   * NodeList<ListItem<Node>> | NodeList<ListItem<BinaryExpression>> |
   * NodeList<ListItem<ConditionalExpression>> |
   * NodeList<ListItem<DictionaryIntrinsicExpression>> |
   * NodeList<ListItem<IHackArray>> | NodeList<ListItem<ElementInitializer>> |
   * NodeList<ListItem<FunctionCallExpression>> |
   * NodeList<ListItem<KeysetIntrinsicExpression>> |
   * NodeList<ListItem<LiteralExpression>> |
   * NodeList<ListItem<MemberSelectionExpression>> |
   * NodeList<ListItem<ObjectCreationExpression>> |
   * NodeList<ListItem<PrefixUnaryExpression>> |
   * NodeList<ListItem<ScopeResolutionExpression>> |
   * NodeList<ListItem<SubscriptExpression>> | NodeList<ListItem<NameToken>> |
   * NodeList<ListItem<VariableExpression>> |
   * NodeList<ListItem<VarrayIntrinsicExpression>> |
   * NodeList<ListItem<VectorIntrinsicExpression>> | null
   */
  public function getMembers(): ?NodeList<ListItem<Node>> {
    if ($this->_members->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(NodeList::class, $this->_members);
  }

  /**
   * @return NodeList<ListItem<AnonymousFunction>> |
   * NodeList<ListItem<IExpression>> |
   * NodeList<ListItem<ArrayCreationExpression>> |
   * NodeList<ListItem<IPHPArray>> | NodeList<ListItem<IContainer>> |
   * NodeList<ListItem<Node>> | NodeList<ListItem<BinaryExpression>> |
   * NodeList<ListItem<ConditionalExpression>> |
   * NodeList<ListItem<DictionaryIntrinsicExpression>> |
   * NodeList<ListItem<IHackArray>> | NodeList<ListItem<ElementInitializer>> |
   * NodeList<ListItem<FunctionCallExpression>> |
   * NodeList<ListItem<KeysetIntrinsicExpression>> |
   * NodeList<ListItem<LiteralExpression>> |
   * NodeList<ListItem<MemberSelectionExpression>> |
   * NodeList<ListItem<ObjectCreationExpression>> |
   * NodeList<ListItem<PrefixUnaryExpression>> |
   * NodeList<ListItem<ScopeResolutionExpression>> |
   * NodeList<ListItem<SubscriptExpression>> | NodeList<ListItem<NameToken>> |
   * NodeList<ListItem<VariableExpression>> |
   * NodeList<ListItem<VarrayIntrinsicExpression>> |
   * NodeList<ListItem<VectorIntrinsicExpression>>
   */
  public function getMembersx(): NodeList<ListItem<Node>> {
    return TypeAssert\not_null($this->getMembers());
  }

  public function getRightBracketUNTYPED(): Node {
    return $this->_right_bracket;
  }

  public function withRightBracket(RightBracketToken $value): this {
    if ($value === $this->_right_bracket) {
      return $this;
    }
    return new static(
      $this->_left_bracket,
      $this->_members,
      $value ?? Missing(),
    );
  }

  public function hasRightBracket(): bool {
    return !$this->_right_bracket->isMissing();
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
