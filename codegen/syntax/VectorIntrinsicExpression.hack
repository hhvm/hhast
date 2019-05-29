/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<c5d41dc0bd7855269e63e3b84765367f>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class VectorIntrinsicExpression
  extends Node
  implements IHackArray, IContainer, ILambdaBody, IExpression {

  const string SYNTAX_KIND = 'vector_intrinsic_expression';

  private Node $_keyword;
  private Node $_explicit_type;
  private Node $_left_bracket;
  private Node $_members;
  private Node $_right_bracket;

  public function __construct(
    Node $keyword,
    Node $explicit_type,
    Node $left_bracket,
    Node $members,
    Node $right_bracket,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_keyword = $keyword;
    $this->_explicit_type = $explicit_type;
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
  ): this {
    $offset = $initial_offset;
    $keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['vector_intrinsic_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $keyword->getWidth();
    $explicit_type = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['vector_intrinsic_explicit_type'],
      $file,
      $offset,
      $source,
    );
    $offset += $explicit_type->getWidth();
    $left_bracket = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['vector_intrinsic_left_bracket'],
      $file,
      $offset,
      $source,
    );
    $offset += $left_bracket->getWidth();
    $members = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['vector_intrinsic_members'],
      $file,
      $offset,
      $source,
    );
    $offset += $members->getWidth();
    $right_bracket = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['vector_intrinsic_right_bracket'],
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
      $keyword,
      $explicit_type,
      $left_bracket,
      $members,
      $right_bracket,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'keyword' => $this->_keyword,
      'explicit_type' => $this->_explicit_type,
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
    $keyword = $rewriter($this->_keyword, $parents);
    $explicit_type = $rewriter($this->_explicit_type, $parents);
    $left_bracket = $rewriter($this->_left_bracket, $parents);
    $members = $rewriter($this->_members, $parents);
    $right_bracket = $rewriter($this->_right_bracket, $parents);
    if (
      $keyword === $this->_keyword &&
      $explicit_type === $this->_explicit_type &&
      $left_bracket === $this->_left_bracket &&
      $members === $this->_members &&
      $right_bracket === $this->_right_bracket
    ) {
      return $this;
    }
    return new static(
      $keyword,
      $explicit_type,
      $left_bracket,
      $members,
      $right_bracket,
    );
  }

  public function getKeywordUNTYPED(): Node {
    return $this->_keyword;
  }

  public function withKeyword(Node $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static(
      $value,
      $this->_explicit_type,
      $this->_left_bracket,
      $this->_members,
      $this->_right_bracket,
    );
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  /**
   * @return VecToken
   */
  public function getKeyword(): VecToken {
    return TypeAssert\instance_of(VecToken::class, $this->_keyword);
  }

  /**
   * @return VecToken
   */
  public function getKeywordx(): VecToken {
    return $this->getKeyword();
  }

  public function getExplicitTypeUNTYPED(): Node {
    return $this->_explicit_type;
  }

  public function withExplicitType(Node $value): this {
    if ($value === $this->_explicit_type) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $value,
      $this->_left_bracket,
      $this->_members,
      $this->_right_bracket,
    );
  }

  public function hasExplicitType(): bool {
    return !$this->_explicit_type->isMissing();
  }

  /**
   * @return null | TypeArguments
   */
  public function getExplicitType(): ?TypeArguments {
    if ($this->_explicit_type->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(TypeArguments::class, $this->_explicit_type);
  }

  /**
   * @return TypeArguments
   */
  public function getExplicitTypex(): TypeArguments {
    return TypeAssert\not_null($this->getExplicitType());
  }

  public function getLeftBracketUNTYPED(): Node {
    return $this->_left_bracket;
  }

  public function withLeftBracket(Node $value): this {
    if ($value === $this->_left_bracket) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_explicit_type,
      $value,
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

  public function withMembers(Node $value): this {
    if ($value === $this->_members) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_explicit_type,
      $this->_left_bracket,
      $value,
      $this->_right_bracket,
    );
  }

  public function hasMembers(): bool {
    return !$this->_members->isMissing();
  }

  /**
   * @return NodeList<IExpression> | NodeList<IContainer> |
   * NodeList<BinaryExpression> | NodeList<CollectionLiteralExpression> |
   * NodeList<ConditionalExpression> | NodeList<DictionaryIntrinsicExpression>
   * | NodeList<IHackArray> | NodeList<FunctionCallExpression> |
   * NodeList<KeysetIntrinsicExpression> | NodeList<LiteralExpression> |
   * NodeList<ObjectCreationExpression> | NodeList<ScopeResolutionExpression> |
   * NodeList<ShapeExpression> | NodeList<NameToken> |
   * NodeList<TupleExpression> | NodeList<VariableExpression> |
   * NodeList<VectorIntrinsicExpression> | NodeList<XHPExpression> | null
   */
  public function getMembers(): ?NodeList<IExpression> {
    if ($this->_members->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(NodeList::class, $this->_members);
  }

  /**
   * @return NodeList<IExpression> | NodeList<IContainer> |
   * NodeList<BinaryExpression> | NodeList<CollectionLiteralExpression> |
   * NodeList<ConditionalExpression> | NodeList<DictionaryIntrinsicExpression>
   * | NodeList<IHackArray> | NodeList<FunctionCallExpression> |
   * NodeList<KeysetIntrinsicExpression> | NodeList<LiteralExpression> |
   * NodeList<ObjectCreationExpression> | NodeList<ScopeResolutionExpression> |
   * NodeList<ShapeExpression> | NodeList<NameToken> |
   * NodeList<TupleExpression> | NodeList<VariableExpression> |
   * NodeList<VectorIntrinsicExpression> | NodeList<XHPExpression>
   */
  public function getMembersx(): NodeList<IExpression> {
    return TypeAssert\not_null($this->getMembers());
  }

  public function getRightBracketUNTYPED(): Node {
    return $this->_right_bracket;
  }

  public function withRightBracket(Node $value): this {
    if ($value === $this->_right_bracket) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_explicit_type,
      $this->_left_bracket,
      $this->_members,
      $value,
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
