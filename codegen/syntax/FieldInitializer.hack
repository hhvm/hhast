/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<a7b1a3955f90f1613e0eee819b74477f>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

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
    dict<string, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
    string $_type_hint,
  ): this {
    $offset = $initial_offset;
    $name = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['field_initializer_name'],
      $file,
      $offset,
      $source,
      'IExpression',
    );
    $name = $name as nonnull;
    $offset += $name->getWidth();
    $arrow = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['field_initializer_arrow'],
      $file,
      $offset,
      $source,
      'EqualGreaterThanToken',
    );
    $arrow = $arrow as nonnull;
    $offset += $arrow->getWidth();
    $value = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['field_initializer_value'],
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
      /* HH_IGNORE_ERROR[4110] */ $name,
      /* HH_IGNORE_ERROR[4110] */ $arrow,
      /* HH_IGNORE_ERROR[4110] */ $value,
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
      /* HH_FIXME[4110] use `as` */ $name,
      /* HH_FIXME[4110] use `as` */ $arrow,
      /* HH_FIXME[4110] use `as` */ $value,
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
    return $this->_name !== null;
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
    return new static($this->_name, $this->_arrow, $value);
  }

  public function hasValue(): bool {
    return $this->_value !== null;
  }

  /**
   * @return BinaryExpression | DarrayIntrinsicExpression |
   * FunctionCallExpression | LambdaExpression | LiteralExpression |
   * ObjectCreationExpression | ScopeResolutionExpression | VariableExpression
   * | VarrayIntrinsicExpression
   */
  public function getValue(): IExpression {
    return TypeAssert\instance_of(IExpression::class, $this->_value);
  }

  /**
   * @return BinaryExpression | DarrayIntrinsicExpression |
   * FunctionCallExpression | LambdaExpression | LiteralExpression |
   * ObjectCreationExpression | ScopeResolutionExpression | VariableExpression
   * | VarrayIntrinsicExpression
   */
  public function getValuex(): IExpression {
    return $this->getValue();
  }
}
