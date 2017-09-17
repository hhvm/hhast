<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<f5e41aa305d03bad4f27c9d3316814e6>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class AttributeSpecification extends EditableSyntax {

  private EditableSyntax $_left_double_angle;
  private EditableSyntax $_attributes;
  private EditableSyntax $_right_double_angle;

  public function __construct(
    EditableSyntax $left_double_angle,
    EditableSyntax $attributes,
    EditableSyntax $right_double_angle,
  ) {
    parent::__construct('attribute_specification');
    $this->_left_double_angle = $left_double_angle;
    $this->_attributes = $attributes;
    $this->_right_double_angle = $right_double_angle;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $left_double_angle = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['attribute_specification_left_double_angle'],
      $position,
      $source,
    );
    $position += $left_double_angle->getWidth();
    $attributes = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['attribute_specification_attributes'],
      $position,
      $source,
    );
    $position += $attributes->getWidth();
    $right_double_angle = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['attribute_specification_right_double_angle'],
      $position,
      $source,
    );
    $position += $right_double_angle->getWidth();
    return new self($left_double_angle, $attributes, $right_double_angle);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'left_double_angle' => $this->_left_double_angle;
    yield 'attributes' => $this->_attributes;
    yield 'right_double_angle' => $this->_right_double_angle;
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $left_double_angle =
      $this->_left_double_angle->rewrite($rewriter, $parents);
    $attributes = $this->_attributes->rewrite($rewriter, $parents);
    $right_double_angle =
      $this->_right_double_angle->rewrite($rewriter, $parents);
    if (
      $left_double_angle === $this->_left_double_angle &&
      $attributes === $this->_attributes &&
      $right_double_angle === $this->_right_double_angle
    ) {
      return $this;
    }
    return new self($left_double_angle, $attributes, $right_double_angle);
  }

  public function getLeftDoubleAngleUNTYPED(): EditableSyntax {
    return $this->_left_double_angle;
  }

  public function withLeftDoubleAngle(EditableSyntax $value): this {
    if ($value === $this->_left_double_angle) {
      return $this;
    }
    return new self($value, $this->_attributes, $this->_right_double_angle);
  }

  public function hasLeftDoubleAngle(): bool {
    return !$this->_left_double_angle->isMissing();
  }

  /**
   * @returns LessThanLessThanToken
   */
  public function getLeftDoubleAngle(): LessThanLessThanToken {
    return TypeAssert\instance_of(
      LessThanLessThanToken::class,
      $this->_left_double_angle,
    );
  }

  public function getAttributesUNTYPED(): EditableSyntax {
    return $this->_attributes;
  }

  public function withAttributes(EditableSyntax $value): this {
    if ($value === $this->_attributes) {
      return $this;
    }
    return
      new self($this->_left_double_angle, $value, $this->_right_double_angle);
  }

  public function hasAttributes(): bool {
    return !$this->_attributes->isMissing();
  }

  /**
   * @returns EditableList
   */
  public function getAttributes(): EditableList {
    return TypeAssert\instance_of(EditableList::class, $this->_attributes);
  }

  public function getRightDoubleAngleUNTYPED(): EditableSyntax {
    return $this->_right_double_angle;
  }

  public function withRightDoubleAngle(EditableSyntax $value): this {
    if ($value === $this->_right_double_angle) {
      return $this;
    }
    return new self($this->_left_double_angle, $this->_attributes, $value);
  }

  public function hasRightDoubleAngle(): bool {
    return !$this->_right_double_angle->isMissing();
  }

  /**
   * @returns GreaterThanGreaterThanToken
   */
  public function getRightDoubleAngle(): GreaterThanGreaterThanToken {
    return TypeAssert\instance_of(
      GreaterThanGreaterThanToken::class,
      $this->_right_double_angle,
    );
  }
}
