<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<3b405790a14afb374566412656ace987>>
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

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'left_angle' => $this->_left_angle;
    yield 'types' => $this->_types;
    yield 'right_angle' => $this->_right_angle;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $left_angle = $this->_left_angle->rewrite($rewriter, $child_parents);
    $types = $this->_types->rewrite($rewriter, $child_parents);
    $right_angle = $this->_right_angle->rewrite($rewriter, $child_parents);
    if (
      $left_angle === $this->_left_angle &&
      $types === $this->_types &&
      $right_angle === $this->_right_angle
    ) {
      $node = $this;
    } else {
      $node = new self($left_angle, $types, $right_angle);
    }
    return $rewriter($node, $parents);
  }

  public function left_angle(): LessThanToken {
    return $this->left_anglex();
  }

  public function left_anglex(): LessThanToken {
    return TypeAssert::isInstanceOf(LessThanToken::class, $this->_left_angle);
  }

  public function raw_left_angle(): EditableSyntax {
    return $this->_left_angle;
  }

  public function with_left_angle(EditableSyntax $value): this {
    return new self($value, $this->_types, $this->_right_angle);
  }

  public function types(): EditableList {
    return $this->typesx();
  }

  public function typesx(): EditableList {
    return TypeAssert::isInstanceOf(EditableList::class, $this->_types);
  }

  public function raw_types(): EditableSyntax {
    return $this->_types;
  }

  public function with_types(EditableSyntax $value): this {
    return new self($this->_left_angle, $value, $this->_right_angle);
  }

  public function right_angle(): ?GreaterThanToken {
    return $this->_right_angle->is_missing()
      ? null
      : TypeAssert::isInstanceOf(GreaterThanToken::class, $this->_right_angle);
  }

  public function right_anglex(): GreaterThanToken {
    return
      TypeAssert::isInstanceOf(GreaterThanToken::class, $this->_right_angle);
  }

  public function raw_right_angle(): EditableSyntax {
    return $this->_right_angle;
  }

  public function with_right_angle(EditableSyntax $value): this {
    return new self($this->_left_angle, $this->_types, $value);
  }
}
