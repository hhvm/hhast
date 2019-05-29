/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<21b990a99ef4a6d8aea5fa3351e73fea>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class AttributeSpecification extends Node {

  const string SYNTAX_KIND = 'attribute_specification';

  private Node $_left_double_angle;
  private Node $_attributes;
  private Node $_right_double_angle;

  public function __construct(
    Node $left_double_angle,
    Node $attributes,
    Node $right_double_angle,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_left_double_angle = $left_double_angle;
    $this->_attributes = $attributes;
    $this->_right_double_angle = $right_double_angle;
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
    $left_double_angle = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['attribute_specification_left_double_angle'],
      $file,
      $offset,
      $source,
    );
    $offset += $left_double_angle->getWidth();
    $attributes = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['attribute_specification_attributes'],
      $file,
      $offset,
      $source,
    );
    $offset += $attributes->getWidth();
    $right_double_angle = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['attribute_specification_right_double_angle'],
      $file,
      $offset,
      $source,
    );
    $offset += $right_double_angle->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      $left_double_angle,
      $attributes,
      $right_double_angle,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'left_double_angle' => $this->_left_double_angle,
      'attributes' => $this->_attributes,
      'right_double_angle' => $this->_right_double_angle,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $left_double_angle = $rewriter($this->_left_double_angle, $parents);
    $attributes = $rewriter($this->_attributes, $parents);
    $right_double_angle = $rewriter($this->_right_double_angle, $parents);
    if (
      $left_double_angle === $this->_left_double_angle &&
      $attributes === $this->_attributes &&
      $right_double_angle === $this->_right_double_angle
    ) {
      return $this;
    }
    return new static($left_double_angle, $attributes, $right_double_angle);
  }

  public function getLeftDoubleAngleUNTYPED(): Node {
    return $this->_left_double_angle;
  }

  public function withLeftDoubleAngle(Node $value): this {
    if ($value === $this->_left_double_angle) {
      return $this;
    }
    return new static($value, $this->_attributes, $this->_right_double_angle);
  }

  public function hasLeftDoubleAngle(): bool {
    return !$this->_left_double_angle->isMissing();
  }

  /**
   * @return LessThanLessThanToken
   */
  public function getLeftDoubleAngle(): LessThanLessThanToken {
    return TypeAssert\instance_of(
      LessThanLessThanToken::class,
      $this->_left_double_angle,
    );
  }

  /**
   * @return LessThanLessThanToken
   */
  public function getLeftDoubleAnglex(): LessThanLessThanToken {
    return $this->getLeftDoubleAngle();
  }

  public function getAttributesUNTYPED(): Node {
    return $this->_attributes;
  }

  public function withAttributes(Node $value): this {
    if ($value === $this->_attributes) {
      return $this;
    }
    return new static(
      $this->_left_double_angle,
      $value,
      $this->_right_double_angle,
    );
  }

  public function hasAttributes(): bool {
    return !$this->_attributes->isMissing();
  }

  /**
   * @return NodeList<ConstructorCall>
   */
  public function getAttributes(): NodeList<ConstructorCall> {
    return TypeAssert\instance_of(NodeList::class, $this->_attributes);
  }

  /**
   * @return NodeList<ConstructorCall>
   */
  public function getAttributesx(): NodeList<ConstructorCall> {
    return $this->getAttributes();
  }

  public function getRightDoubleAngleUNTYPED(): Node {
    return $this->_right_double_angle;
  }

  public function withRightDoubleAngle(Node $value): this {
    if ($value === $this->_right_double_angle) {
      return $this;
    }
    return new static($this->_left_double_angle, $this->_attributes, $value);
  }

  public function hasRightDoubleAngle(): bool {
    return !$this->_right_double_angle->isMissing();
  }

  /**
   * @return GreaterThanGreaterThanToken
   */
  public function getRightDoubleAngle(): GreaterThanGreaterThanToken {
    return TypeAssert\instance_of(
      GreaterThanGreaterThanToken::class,
      $this->_right_double_angle,
    );
  }

  /**
   * @return GreaterThanGreaterThanToken
   */
  public function getRightDoubleAnglex(): GreaterThanGreaterThanToken {
    return $this->getRightDoubleAngle();
  }
}
