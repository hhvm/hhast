/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<96d085c469992b9436ca0b970b75f6b9>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;
/* HHAST_IGNORE_ALL[5607] 5607 is ignored because of false positives when comparing a generic to a typed value */
/* HHAST_IGNORE_ALL[5624] HHAST_IGNORE_ALL[5639] 5624 and 5639 are ignored because they insist on using co(tra)variant generics. Could this break external consumers? */

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
    dict<arraykey, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
    string $_type_hint,
  ): this {
    $offset = $initial_offset;
    $key = Node::fromJSON(
      ($json['element_key']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'IExpression',
    );
    $key = $key as nonnull;
    $offset += $key->getWidth();
    $arrow = Node::fromJSON(
      ($json['element_arrow']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'EqualGreaterThanToken',
    );
    $arrow = $arrow as nonnull;
    $offset += $arrow->getWidth();
    $value = Node::fromJSON(
      ($json['element_value']) as dict<_, _>,
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
      $key as IExpression,
      $arrow as EqualGreaterThanToken,
      $value as IExpression,
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
      $key as IExpression,
      $arrow as EqualGreaterThanToken,
      $value as IExpression,
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
    return true;
  }

  /**
   * @return AsExpression | BinaryExpression | CastExpression |
   * FunctionCallExpression | FunctionPointerExpression | LiteralExpression |
   * ParenthesizedExpression | PrefixUnaryExpression | QualifiedName |
   * ScopeResolutionExpression | SubscriptExpression | NameToken |
   * VariableExpression | VarrayIntrinsicExpression
   */
  public function getKey(): IExpression {
    return TypeAssert\instance_of(IExpression::class, $this->_key);
  }

  /**
   * @return AsExpression | BinaryExpression | CastExpression |
   * FunctionCallExpression | FunctionPointerExpression | LiteralExpression |
   * ParenthesizedExpression | PrefixUnaryExpression | QualifiedName |
   * ScopeResolutionExpression | SubscriptExpression | NameToken |
   * VariableExpression | VarrayIntrinsicExpression
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
    return true;
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
    return true;
  }

  /**
   * @return AnonymousFunction | AwaitableCreationExpression | BinaryExpression
   * | CastExpression | CollectionLiteralExpression | ConditionalExpression |
   * DarrayIntrinsicExpression | DictionaryIntrinsicExpression |
   * FunctionCallExpression | FunctionPointerExpression | IssetExpression |
   * KeysetIntrinsicExpression | LambdaExpression | LiteralExpression |
   * MemberSelectionExpression | ObjectCreationExpression |
   * ParenthesizedExpression | PrefixUnaryExpression | QualifiedName |
   * ScopeResolutionExpression | ShapeExpression | SubscriptExpression |
   * NameToken | TupleExpression | VariableExpression |
   * VarrayIntrinsicExpression | VectorIntrinsicExpression
   */
  public function getValue(): IExpression {
    return TypeAssert\instance_of(IExpression::class, $this->_value);
  }

  /**
   * @return AnonymousFunction | AwaitableCreationExpression | BinaryExpression
   * | CastExpression | CollectionLiteralExpression | ConditionalExpression |
   * DarrayIntrinsicExpression | DictionaryIntrinsicExpression |
   * FunctionCallExpression | FunctionPointerExpression | IssetExpression |
   * KeysetIntrinsicExpression | LambdaExpression | LiteralExpression |
   * MemberSelectionExpression | ObjectCreationExpression |
   * ParenthesizedExpression | PrefixUnaryExpression | QualifiedName |
   * ScopeResolutionExpression | ShapeExpression | SubscriptExpression |
   * NameToken | TupleExpression | VariableExpression |
   * VarrayIntrinsicExpression | VectorIntrinsicExpression
   */
  public function getValuex(): IExpression {
    return $this->getValue();
  }
}
