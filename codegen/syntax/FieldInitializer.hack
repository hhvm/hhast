/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<a0fab761aa9ef08401088d4a9d95f174>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class FieldInitializer extends Node {

  const string SYNTAX_KIND = 'field_initializer';

  private Node $_name;
  private Node $_arrow;
  private Node $_value;

  public function __construct(
    Node $name,
    Node $arrow,
    Node $value,
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
    $offset += $name->getWidth();
    $arrow = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['field_initializer_arrow'],
      $file,
      $offset,
      $source,
      'EqualGreaterThanToken',
    );
    $offset += $arrow->getWidth();
    $value = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['field_initializer_value'],
      $file,
      $offset,
      $source,
      'IExpression',
    );
    $offset += $value->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static($name, $arrow, $value, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'name' => $this->_name,
      'arrow' => $this->_arrow,
      'value' => $this->_value,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
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
    return new static($name, $arrow, $value);
  }

  public function getNameUNTYPED(): Node {
    return $this->_name;
  }

  public function withName(Node $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new static($value, $this->_arrow, $this->_value);
  }

  public function hasName(): bool {
    return !$this->_name->isMissing();
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

  public function getArrowUNTYPED(): Node {
    return $this->_arrow;
  }

  public function withArrow(Node $value): this {
    if ($value === $this->_arrow) {
      return $this;
    }
    return new static($this->_name, $value, $this->_value);
  }

  public function hasArrow(): bool {
    return !$this->_arrow->isMissing();
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

  public function getValueUNTYPED(): Node {
    return $this->_value;
  }

  public function withValue(Node $value): this {
    if ($value === $this->_value) {
      return $this;
    }
    return new static($this->_name, $this->_arrow, $value);
  }

  public function hasValue(): bool {
    return !$this->_value->isMissing();
  }

  /**
   * @return ArrayIntrinsicExpression | BinaryExpression |
   * DarrayIntrinsicExpression | LambdaExpression | LiteralExpression |
   * ObjectCreationExpression | ScopeResolutionExpression | SubscriptExpression
   * | VariableExpression
   */
  public function getValue(): IExpression {
    return TypeAssert\instance_of(IExpression::class, $this->_value);
  }

  /**
   * @return ArrayIntrinsicExpression | BinaryExpression |
   * DarrayIntrinsicExpression | LambdaExpression | LiteralExpression |
   * ObjectCreationExpression | ScopeResolutionExpression | SubscriptExpression
   * | VariableExpression
   */
  public function getValuex(): IExpression {
    return $this->getValue();
  }
}
