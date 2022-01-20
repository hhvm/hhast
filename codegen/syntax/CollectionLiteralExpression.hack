/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<786dd603c6bb60cb6ee106de52240fbb>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;
/* HHAST_IGNORE_ALL[5607] 5607 is ignored because of false positives when comparing a generic to a typed value */
/* HHAST_IGNORE_ALL[5624] HHAST_IGNORE_ALL[5639] 5624 and 5639 are ignored because they insist on using co(tra)variant generics. Could this break external consumers? */

<<__ConsistentConstruct>>
final class CollectionLiteralExpression
  extends Node
  implements IContainer, ILambdaBody, IExpression {

  const string SYNTAX_KIND = 'collection_literal_expression';

  private ISimpleCreationSpecifier $_name;
  private LeftBraceToken $_left_brace;
  private ?NodeList<ListItem<Node>> $_initializers;
  private RightBraceToken $_right_brace;

  public function __construct(
    ISimpleCreationSpecifier $name,
    LeftBraceToken $left_brace,
    ?NodeList<ListItem<Node>> $initializers,
    RightBraceToken $right_brace,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_name = $name;
    $this->_left_brace = $left_brace;
    $this->_initializers = $initializers;
    $this->_right_brace = $right_brace;
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
    $name = Node::fromJSON(
      ($json['collection_literal_name']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'ISimpleCreationSpecifier',
    );
    $name = $name as nonnull;
    $offset += $name->getWidth();
    $left_brace = Node::fromJSON(
      ($json['collection_literal_left_brace']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'LeftBraceToken',
    );
    $left_brace = $left_brace as nonnull;
    $offset += $left_brace->getWidth();
    $initializers = Node::fromJSON(
      ($json['collection_literal_initializers'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'NodeList<ListItem<Node>>',
    );
    $offset += $initializers?->getWidth() ?? 0;
    $right_brace = Node::fromJSON(
      ($json['collection_literal_right_brace']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'RightBraceToken',
    );
    $right_brace = $right_brace as nonnull;
    $offset += $right_brace->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $name,
      /* HH_IGNORE_ERROR[4110] */ $left_brace,
      /* HH_IGNORE_ERROR[4110] */ $initializers,
      /* HH_IGNORE_ERROR[4110] */ $right_brace,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'name' => $this->_name,
      'left_brace' => $this->_left_brace,
      'initializers' => $this->_initializers,
      'right_brace' => $this->_right_brace,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $name = $rewriter($this->_name, $parents);
    $left_brace = $rewriter($this->_left_brace, $parents);
    $initializers = $this->_initializers === null
      ? null
      : $rewriter($this->_initializers, $parents);
    $right_brace = $rewriter($this->_right_brace, $parents);
    if (
      $name === $this->_name &&
      $left_brace === $this->_left_brace &&
      $initializers === $this->_initializers &&
      $right_brace === $this->_right_brace
    ) {
      return $this;
    }
    return new static(
      $name as ISimpleCreationSpecifier,
      $left_brace as LeftBraceToken,
      /* HH_FIXME[4110] ?NodeList<ListItem<Node>> may not be enforceable */ $initializers,
      $right_brace as RightBraceToken,
    );
  }

  public function getNameUNTYPED(): ?Node {
    return $this->_name;
  }

  public function withName(ISimpleCreationSpecifier $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new static(
      $value,
      $this->_left_brace,
      $this->_initializers,
      $this->_right_brace,
    );
  }

  public function hasName(): bool {
    return true;
  }

  /**
   * @return GenericTypeSpecifier | SimpleTypeSpecifier
   */
  public function getName(): ISimpleCreationSpecifier {
    return
      TypeAssert\instance_of(ISimpleCreationSpecifier::class, $this->_name);
  }

  /**
   * @return GenericTypeSpecifier | SimpleTypeSpecifier
   */
  public function getNamex(): ISimpleCreationSpecifier {
    return $this->getName();
  }

  public function getLeftBraceUNTYPED(): ?Node {
    return $this->_left_brace;
  }

  public function withLeftBrace(LeftBraceToken $value): this {
    if ($value === $this->_left_brace) {
      return $this;
    }
    return new static(
      $this->_name,
      $value,
      $this->_initializers,
      $this->_right_brace,
    );
  }

  public function hasLeftBrace(): bool {
    return true;
  }

  /**
   * @return LeftBraceToken
   */
  public function getLeftBrace(): LeftBraceToken {
    return TypeAssert\instance_of(LeftBraceToken::class, $this->_left_brace);
  }

  /**
   * @return LeftBraceToken
   */
  public function getLeftBracex(): LeftBraceToken {
    return $this->getLeftBrace();
  }

  public function getInitializersUNTYPED(): ?Node {
    return $this->_initializers;
  }

  public function withInitializers(?NodeList<ListItem<Node>> $value): this {
    if ($value === $this->_initializers) {
      return $this;
    }
    return
      new static($this->_name, $this->_left_brace, $value, $this->_right_brace);
  }

  public function hasInitializers(): bool {
    return $this->_initializers !== null;
  }

  /**
   * @return NodeList<ListItem<AnonymousFunction>> |
   * NodeList<ListItem<IExpression>> | NodeList<ListItem<CastExpression>> |
   * NodeList<ListItem<CollectionLiteralExpression>> |
   * NodeList<ListItem<IContainer>> |
   * NodeList<ListItem<DarrayIntrinsicExpression>> |
   * NodeList<ListItem<DictionaryIntrinsicExpression>> |
   * NodeList<ListItem<ElementInitializer>> |
   * NodeList<ListItem<FunctionCallExpression>> |
   * NodeList<ListItem<LambdaExpression>> |
   * NodeList<ListItem<LiteralExpression>> |
   * NodeList<ListItem<ObjectCreationExpression>> |
   * NodeList<ListItem<PrefixUnaryExpression>> |
   * NodeList<ListItem<ScopeResolutionExpression>> |
   * NodeList<ListItem<ShapeExpression>> |
   * NodeList<ListItem<SubscriptExpression>> |
   * NodeList<ListItem<TupleExpression>> |
   * NodeList<ListItem<VariableExpression>> |
   * NodeList<ListItem<VarrayIntrinsicExpression>> |
   * NodeList<ListItem<VectorIntrinsicExpression>> | null
   */
  public function getInitializers(): ?NodeList<ListItem<Node>> {
    return $this->_initializers;
  }

  /**
   * @return NodeList<ListItem<AnonymousFunction>> |
   * NodeList<ListItem<IExpression>> | NodeList<ListItem<CastExpression>> |
   * NodeList<ListItem<CollectionLiteralExpression>> |
   * NodeList<ListItem<IContainer>> |
   * NodeList<ListItem<DarrayIntrinsicExpression>> |
   * NodeList<ListItem<DictionaryIntrinsicExpression>> |
   * NodeList<ListItem<ElementInitializer>> |
   * NodeList<ListItem<FunctionCallExpression>> |
   * NodeList<ListItem<LambdaExpression>> |
   * NodeList<ListItem<LiteralExpression>> |
   * NodeList<ListItem<ObjectCreationExpression>> |
   * NodeList<ListItem<PrefixUnaryExpression>> |
   * NodeList<ListItem<ScopeResolutionExpression>> |
   * NodeList<ListItem<ShapeExpression>> |
   * NodeList<ListItem<SubscriptExpression>> |
   * NodeList<ListItem<TupleExpression>> |
   * NodeList<ListItem<VariableExpression>> |
   * NodeList<ListItem<VarrayIntrinsicExpression>> |
   * NodeList<ListItem<VectorIntrinsicExpression>>
   */
  public function getInitializersx(): NodeList<ListItem<Node>> {
    return TypeAssert\not_null($this->getInitializers());
  }

  public function getRightBraceUNTYPED(): ?Node {
    return $this->_right_brace;
  }

  public function withRightBrace(RightBraceToken $value): this {
    if ($value === $this->_right_brace) {
      return $this;
    }
    return new static(
      $this->_name,
      $this->_left_brace,
      $this->_initializers,
      $value,
    );
  }

  public function hasRightBrace(): bool {
    return true;
  }

  /**
   * @return RightBraceToken
   */
  public function getRightBrace(): RightBraceToken {
    return TypeAssert\instance_of(RightBraceToken::class, $this->_right_brace);
  }

  /**
   * @return RightBraceToken
   */
  public function getRightBracex(): RightBraceToken {
    return $this->getRightBrace();
  }
}
