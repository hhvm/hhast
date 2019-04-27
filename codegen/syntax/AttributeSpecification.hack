/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<856d8ea2ac5b363fcc6d085a112a825c>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class AttributeSpecification extends EditableNode {

  private EditableNode $_left_double_angle;
  private EditableNode $_attributes;
  private EditableNode $_right_double_angle;

  public function __construct(
    EditableNode $left_double_angle,
    EditableNode $attributes,
    EditableNode $right_double_angle,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_left_double_angle = $left_double_angle;
    $this->_attributes = $attributes;
    $this->_right_double_angle = $right_double_angle;
    parent::__construct('attribute_specification', $source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
  ): this {
    $offset = $initial_offset;
    $left_double_angle = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['attribute_specification_left_double_angle'],
      $file,
      $offset,
      $source,
    );
    $offset += $left_double_angle->getWidth();
    $attributes = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['attribute_specification_attributes'],
      $file,
      $offset,
      $source,
    );
    $offset += $attributes->getWidth();
    $right_double_angle = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['attribute_specification_right_double_angle'],
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
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'left_double_angle' => $this->_left_double_angle,
      'attributes' => $this->_attributes,
      'right_double_angle' => $this->_right_double_angle,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?vec<EditableNode> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $left_double_angle = $this->_left_double_angle
      ->rewrite($rewriter, $parents);
    $attributes = $this->_attributes->rewrite($rewriter, $parents);
    $right_double_angle = $this->_right_double_angle
      ->rewrite($rewriter, $parents);
    if (
      $left_double_angle === $this->_left_double_angle &&
      $attributes === $this->_attributes &&
      $right_double_angle === $this->_right_double_angle
    ) {
      return $this;
    }
    return new static($left_double_angle, $attributes, $right_double_angle);
  }

  public function getLeftDoubleAngleUNTYPED(): EditableNode {
    return $this->_left_double_angle;
  }

  public function withLeftDoubleAngle(EditableNode $value): this {
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

  public function getAttributesUNTYPED(): EditableNode {
    return $this->_attributes;
  }

  public function withAttributes(EditableNode $value): this {
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
   * @return EditableList<ConstructorCall>
   */
  public function getAttributes(): EditableList<ConstructorCall> {
    return TypeAssert\instance_of(EditableList::class, $this->_attributes);
  }

  /**
   * @return EditableList<ConstructorCall>
   */
  public function getAttributesx(): EditableList<ConstructorCall> {
    return $this->getAttributes();
  }

  public function getRightDoubleAngleUNTYPED(): EditableNode {
    return $this->_right_double_angle;
  }

  public function withRightDoubleAngle(EditableNode $value): this {
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
