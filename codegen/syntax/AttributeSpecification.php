<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<e7ef761de9f44323eed826e36f233bb2>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

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

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $left_double_angle = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['attribute_specification_left_double_angle'],
      $position,
      $source,
    );
    $position += $left_double_angle->width();
    $attributes = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['attribute_specification_attributes'],
      $position,
      $source,
    );
    $position += $attributes->width();
    $right_double_angle = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['attribute_specification_right_double_angle'],
      $position,
      $source,
    );
    $position += $right_double_angle->width();
    return new self($left_double_angle, $attributes, $right_double_angle);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'left_double_angle' => $this->_left_double_angle;
    yield 'attributes' => $this->_attributes;
    yield 'right_double_angle' => $this->_right_double_angle;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $left_double_angle =
      $this->_left_double_angle->rewrite($rewriter, $child_parents);
    $attributes = $this->_attributes->rewrite($rewriter, $child_parents);
    $right_double_angle =
      $this->_right_double_angle->rewrite($rewriter, $child_parents);
    if (
      $left_double_angle === $this->_left_double_angle &&
      $attributes === $this->_attributes &&
      $right_double_angle === $this->_right_double_angle
    ) {
      $node = $this;
    } else {
      $node = new self($left_double_angle, $attributes, $right_double_angle);
    }
    return $rewriter($node, $parents);
  }

  public function left_double_angle(): LessThanLessThanToken {
    return $this->left_double_anglex();
  }

  public function left_double_anglex(): LessThanLessThanToken {
    return TypeAssert::isInstanceOf(
      LessThanLessThanToken::class,
      $this->_left_double_angle,
    );
  }

  public function raw_left_double_angle(): EditableSyntax {
    return $this->_left_double_angle;
  }

  public function with_left_double_angle(EditableSyntax $value): this {
    return new self($value, $this->_attributes, $this->_right_double_angle);
  }

  public function attributes(): EditableList {
    return $this->attributesx();
  }

  public function attributesx(): EditableList {
    return TypeAssert::isInstanceOf(EditableList::class, $this->_attributes);
  }

  public function raw_attributes(): EditableSyntax {
    return $this->_attributes;
  }

  public function with_attributes(EditableSyntax $value): this {
    return
      new self($this->_left_double_angle, $value, $this->_right_double_angle);
  }

  public function right_double_angle(): GreaterThanGreaterThanToken {
    return $this->right_double_anglex();
  }

  public function right_double_anglex(): GreaterThanGreaterThanToken {
    return TypeAssert::isInstanceOf(
      GreaterThanGreaterThanToken::class,
      $this->_right_double_angle,
    );
  }

  public function raw_right_double_angle(): EditableSyntax {
    return $this->_right_double_angle;
  }

  public function with_right_double_angle(EditableSyntax $value): this {
    return new self($this->_left_double_angle, $this->_attributes, $value);
  }
}
