/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<e128b65f2f73ae9e8683bffe1856252a>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class ElementInitializer extends Node {

  const string SYNTAX_KIND = 'element_initializer';

  private IExpression $_key;
  private EqualGreaterThanToken $_arrow;
  private IExpression $_value;

  public function __construct(
    IExpression $key,
    EqualGreaterThanToken $arrow,
    IExpression $value,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_key = $key;
    $this->_arrow = $arrow;
    $this->_value = $value;
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
    $key = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['element_key'],
      $file,
      $offset,
      $source,
      'IExpression',
    );
    $key = $key as nonnull;
    $offset += $key->getWidth();
    $arrow = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['element_arrow'],
      $file,
      $offset,
      $source,
      'EqualGreaterThanToken',
    );
    $arrow = $arrow as nonnull;
    $offset += $arrow->getWidth();
    $value = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['element_value'],
      $file,
      $offset,
      $source,
      'IExpression',
    );
    $value = $value as nonnull;
    $offset += $value->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $key,
      /* HH_IGNORE_ERROR[4110] */ $arrow,
      /* HH_IGNORE_ERROR[4110] */ $value,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'key' => $this->_key,
      'arrow' => $this->_arrow,
      'value' => $this->_value,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $key = $rewriter($this->_key, $parents);
    $arrow = $rewriter($this->_arrow, $parents);
    $value = $rewriter($this->_value, $parents);
    if (
      $key === $this->_key &&
      $arrow === $this->_arrow &&
      $value === $this->_value
    ) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $key,
      /* HH_FIXME[4110] use `as` */ $arrow,
      /* HH_FIXME[4110] use `as` */ $value,
    );
  }

  public function getKeyUNTYPED(): ?Node {
    return $this->_key;
  }

  public function withKey(IExpression $value): this {
    if ($value === $this->_key) {
      return $this;
    }
    return new static($value, $this->_arrow, $this->_value);
  }

  public function hasKey(): bool {
    return $this->_key !== null;
  }

  /**
   * @return AsExpression | BinaryExpression | CastExpression |
   * FunctionCallExpression | LiteralExpression | ParenthesizedExpression |
   * PrefixUnaryExpression | QualifiedName | ScopeResolutionExpression |
   * SubscriptExpression | NameToken | VariableExpression |
   * VarrayIntrinsicExpression
   */
  public function getKey(): IExpression {
    return TypeAssert\instance_of(IExpression::class, $this->_key);
  }

  /**
   * @return AsExpression | BinaryExpression | CastExpression |
   * FunctionCallExpression | LiteralExpression | ParenthesizedExpression |
   * PrefixUnaryExpression | QualifiedName | ScopeResolutionExpression |
   * SubscriptExpression | NameToken | VariableExpression |
   * VarrayIntrinsicExpression
   */
  public function getKeyx(): IExpression {
    return $this->getKey();
  }

  public function getArrowUNTYPED(): ?Node {
    return $this->_arrow;
  }

  public function withArrow(EqualGreaterThanToken $value): this {
    if ($value === $this->_arrow) {
      return $this;
    }
    return new static($this->_key, $value, $this->_value);
  }

  public function hasArrow(): bool {
    return $this->_arrow !== null;
  }

  /**
   * @return EqualGreaterThanToken
   */
  public function getArrow(): EqualGreaterThanToken {
    return TypeAssert\instance_of(EqualGreaterThanToken::class, $this->_arrow);
  }

  /**
   * @return EqualGreaterThanToken
   */
  public function getArrowx(): EqualGreaterThanToken {
    return $this->getArrow();
  }

  public function getValueUNTYPED(): ?Node {
    return $this->_value;
  }

  public function withValue(IExpression $value): this {
    if ($value === $this->_value) {
      return $this;
    }
    return new static($this->_key, $this->_arrow, $value);
  }

  public function hasValue(): bool {
    return $this->_value !== null;
  }

  /**
   * @return AnonymousFunction | AwaitableCreationExpression | BinaryExpression
   * | CastExpression | CollectionLiteralExpression | ConditionalExpression |
   * DarrayIntrinsicExpression | DictionaryIntrinsicExpression |
   * FunctionCallExpression | IssetExpression | KeysetIntrinsicExpression |
   * LambdaExpression | LiteralExpression | MemberSelectionExpression |
   * ObjectCreationExpression | ParenthesizedExpression | PrefixUnaryExpression
   * | QualifiedName | ScopeResolutionExpression | ShapeExpression |
   * SubscriptExpression | NameToken | TupleExpression | VariableExpression |
   * VarrayIntrinsicExpression | VectorIntrinsicExpression
   */
  public function getValue(): IExpression {
    return TypeAssert\instance_of(IExpression::class, $this->_value);
  }

  /**
   * @return AnonymousFunction | AwaitableCreationExpression | BinaryExpression
   * | CastExpression | CollectionLiteralExpression | ConditionalExpression |
   * DarrayIntrinsicExpression | DictionaryIntrinsicExpression |
   * FunctionCallExpression | IssetExpression | KeysetIntrinsicExpression |
   * LambdaExpression | LiteralExpression | MemberSelectionExpression |
   * ObjectCreationExpression | ParenthesizedExpression | PrefixUnaryExpression
   * | QualifiedName | ScopeResolutionExpression | ShapeExpression |
   * SubscriptExpression | NameToken | TupleExpression | VariableExpression |
   * VarrayIntrinsicExpression | VectorIntrinsicExpression
   */
  public function getValuex(): IExpression {
    return $this->getValue();
  }
}
