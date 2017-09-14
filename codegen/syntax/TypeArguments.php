<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<74e79c9c440ce7d906ad55febaceaf1e>>
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
  public static function fromJSON(
    dict<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $left_angle = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['type_arguments_left_angle'],
      $position,
      $source,
    );
    $position += $left_angle->getWidth();
    $types = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['type_arguments_types'],
      $position,
      $source,
    );
    $position += $types->getWidth();
    $right_angle = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['type_arguments_right_angle'],
      $position,
      $source,
    );
    $position += $right_angle->getWidth();
    return new self($left_angle, $types, $right_angle);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'left_angle' => $this->_left_angle;
    yield 'types' => $this->_types;
    yield 'right_angle' => $this->_right_angle;
  }

  <<__Override>>
  public function rewriteDescendants(
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
    return !$this->_left_angle->isMissing();
  }

  /**
   * @returns LessThanToken
   */
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
    return !$this->_types->isMissing();
  }

  /**
   * @returns EditableList
   */
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
    return !$this->_right_angle->isMissing();
  }

  /**
   * @returns GreaterThanToken
   */
  public function getRightAngle(): ?GreaterThanToken {
    if ($this->_right_angle->isMissing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(GreaterThanToken::class, $this->_right_angle);
  }

  /**
   * @returns GreaterThanToken
   */
  public function getRightAnglex(): GreaterThanToken {
    return TypeAssert::isInstanceOf(GreaterThanToken::class, $this->_right_angle);
  }
}
