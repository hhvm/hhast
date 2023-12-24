/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<c0336819bde92f0980bd98e087f659a9>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;
/* HHAST_IGNORE_ALL[5607] 5607 is ignored because of false positives when comparing a generic to a typed value */
/* HHAST_IGNORE_ALL[5624] HHAST_IGNORE_ALL[5639] 5624 and 5639 are ignored because they insist on using co(tra)variant generics. Could this break external consumers? */

<<__ConsistentConstruct>>
final class FieldInitializer extends Node {

  const string SYNTAX_KIND = 'field_initializer';

  private IExpression $_name;
  private EqualGreaterThanToken $_arrow;
  private IExpression $_value;

  public function __construct(
    IExpression $name,
    EqualGreaterThanToken $arrow,
    IExpression $value,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_name = $name;
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
    $name = Node::fromJSON(
      ($json['field_initializer_name']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'IExpression',
    );
    $name = $name as nonnull;
    $offset += $name->getWidth();
    $arrow = Node::fromJSON(
      ($json['field_initializer_arrow']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'EqualGreaterThanToken',
    );
    $arrow = $arrow as nonnull;
    $offset += $arrow->getWidth();
    $value = Node::fromJSON(
      ($json['field_initializer_value']) as dict<_, _>,
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
      $name as IExpression,
      $arrow as EqualGreaterThanToken,
      $value as IExpression,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'name' => $this->_name,
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
    $name = $rewriter($this->_name, $parents);
    $arrow = $rewriter($this->_arrow, $parents);
    $value = $rewriter($this->_value, $parents);
    if (
      $name === $this->_name &&
      $arrow === $this->_arrow &&
      $value === $this->_value
    ) {
      return $this;
    }
    return new static(
      $name as IExpression,
      $arrow as EqualGreaterThanToken,
      $value as IExpression,
    );
  }

  public function getNameUNTYPED(): ?Node {
    return $this->_name;
  }

  public function withName(IExpression $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new static($value, $this->_arrow, $this->_value);
  }

  public function hasName(): bool {
    return true;
  }

  /**
   * @return LiteralExpression | ScopeResolutionExpression
   */
  public function getName(): IExpression {
    return TypeAssert\instance_of(IExpression::class, $this->_name);
  }

  /**
   * @return LiteralExpression | ScopeResolutionExpression
   */
  public function getNamex(): IExpression {
    return $this->getName();
  }

  public function getArrowUNTYPED(): ?Node {
    return $this->_arrow;
  }

  public function withArrow(EqualGreaterThanToken $value): this {
    if ($value === $this->_arrow) {
      return $this;
    }
    return new static($this->_name, $value, $this->_value);
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
    return new static($this->_name, $this->_arrow, $value);
  }

  public function hasValue(): bool {
    return true;
  }

  /**
   * @return BinaryExpression | DarrayIntrinsicExpression |
   * DictionaryIntrinsicExpression | FunctionCallExpression |
   * FunctionPointerExpression | KeysetIntrinsicExpression | LambdaExpression |
   * LiteralExpression | ObjectCreationExpression | ScopeResolutionExpression |
   * ShapeExpression | SubscriptExpression | VariableExpression |
   * VarrayIntrinsicExpression | VectorIntrinsicExpression
   */
  public function getValue(): IExpression {
    return TypeAssert\instance_of(IExpression::class, $this->_value);
  }

  /**
   * @return BinaryExpression | DarrayIntrinsicExpression |
   * DictionaryIntrinsicExpression | FunctionCallExpression |
   * FunctionPointerExpression | KeysetIntrinsicExpression | LambdaExpression |
   * LiteralExpression | ObjectCreationExpression | ScopeResolutionExpression |
   * ShapeExpression | SubscriptExpression | VariableExpression |
   * VarrayIntrinsicExpression | VectorIntrinsicExpression
   */
  public function getValuex(): IExpression {
    return $this->getValue();
  }
}
