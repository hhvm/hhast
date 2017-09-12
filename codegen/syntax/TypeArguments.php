<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<e8405be492620a6d130cdffc23684aa4>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class TypeArguments extends EditableSyntax {

  private EditableSyntax $_left_angle;
  private EditableSyntax $_types;
  private EditableSyntax $_right_angle;

  public function __construct(
    EditableSyntax $left_angle,
    EditableSyntax $types,
    EditableSyntax $right_angle,
  ) {
    parent::__construct('type_arguments');
    $this->_left_angle = $left_angle;
    $this->_types = $types;
    $this->_right_angle = $right_angle;
  }

  <<__Override>>
  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $left_angle = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['type_arguments_left_angle'],
      $position,
      $source,
    );
    $position += $left_angle->width();
    $types = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['type_arguments_types'],
      $position,
      $source,
    );
    $position += $types->width();
    $right_angle = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['type_arguments_right_angle'],
      $position,
      $source,
    );
    $position += $right_angle->width();
    return new self($left_angle, $types, $right_angle);
  }

  <<__Override>>
  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'left_angle' => $this->_left_angle;
    yield 'types' => $this->_types;
    yield 'right_angle' => $this->_right_angle;
  }

  <<__Override>>
  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $left_angle = $this->_left_angle->rewrite($rewriter, $parents);
    $types = $this->_types->rewrite($rewriter, $parents);
    $right_angle = $this->_right_angle->rewrite($rewriter, $parents);
    if (
      $left_angle === $this->_left_angle &&
      $types === $this->_types &&
      $right_angle === $this->_right_angle
    ) {
      return $this;
    }
    return new self($left_angle, $types, $right_angle);
  }

  public function getLeftAngleUNTYPED(): EditableSyntax {
    return $this->_left_angle;
  }

  public function withLeftAngle(EditableSyntax $value): this {
    if ($value === $this->_left_angle) {
      return $this;
    }
    return new self($value, $this->_types, $this->_right_angle);
  }

  public function hasLeftAngle(): bool {
    return !$this->_left_angle->is_missing();
  }

  public function getLeftAngle(): LessThanToken {
    return TypeAssert::isInstanceOf(LessThanToken::class, $this->_left_angle);
  }

  public function getTypesUNTYPED(): EditableSyntax {
    return $this->_types;
  }

  public function withTypes(EditableSyntax $value): this {
    if ($value === $this->_types) {
      return $this;
    }
    return new self($this->_left_angle, $value, $this->_right_angle);
  }

  public function hasTypes(): bool {
    return !$this->_types->is_missing();
  }

  public function getTypes(): EditableList {
    return TypeAssert::isInstanceOf(EditableList::class, $this->_types);
  }

  public function getRightAngleUNTYPED(): EditableSyntax {
    return $this->_right_angle;
  }

  public function withRightAngle(EditableSyntax $value): this {
    if ($value === $this->_right_angle) {
      return $this;
    }
    return new self($this->_left_angle, $this->_types, $value);
  }

  public function hasRightAngle(): bool {
    return !$this->_right_angle->is_missing();
  }

  public function getRightAngle(): ?GreaterThanToken {
    if ($this->_right_angle->is_missing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(GreaterThanToken::class, $this->_right_angle);
  }

  public function getRightAnglex(): GreaterThanToken {
    return TypeAssert::isInstanceOf(GreaterThanToken::class, $this->_right_angle);
  }
}
