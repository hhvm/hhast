<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<0fcb04bfedf9dad8fa032ab71cd03e00>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class XHPClose extends EditableSyntax {

  private EditableSyntax $_left_angle;
  private EditableSyntax $_name;
  private EditableSyntax $_right_angle;

  public function __construct(
    EditableSyntax $left_angle,
    EditableSyntax $name,
    EditableSyntax $right_angle,
  ) {
    parent::__construct('xhp_close');
    $this->_left_angle = $left_angle;
    $this->_name = $name;
    $this->_right_angle = $right_angle;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $left_angle = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['xhp_close_left_angle'],
      $position,
      $source,
    );
    $position += $left_angle->width();
    $name = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['xhp_close_name'],
      $position,
      $source,
    );
    $position += $name->width();
    $right_angle = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['xhp_close_right_angle'],
      $position,
      $source,
    );
    $position += $right_angle->width();
    return new self($left_angle, $name, $right_angle);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'left_angle' => $this->_left_angle;
    yield 'name' => $this->_name;
    yield 'right_angle' => $this->_right_angle;
  }

  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $left_angle = $this->_left_angle->rewrite($rewriter, $parents);
    $name = $this->_name->rewrite($rewriter, $parents);
    $right_angle = $this->_right_angle->rewrite($rewriter, $parents);
    if (
      $left_angle === $this->_left_angle &&
      $name === $this->_name &&
      $right_angle === $this->_right_angle
    ) {
      return $this;
    }
    return new self($left_angle, $name, $right_angle);
  }

  public function left_angle(): EditableSyntax {
    return $this->left_anglex();
  }

  public function left_anglex(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_left_angle);
  }

  public function raw_left_angle(): EditableSyntax {
    return $this->_left_angle;
  }

  public function with_left_angle(EditableSyntax $value): this {
    return new self($value, $this->_name, $this->_right_angle);
  }

  public function name(): ?XHPElementNameToken {
    return $this->_name->is_missing() ? null : TypeAssert::isInstanceOf(XHPElementNameToken::class, $this->_name);
  }

  public function namex(): XHPElementNameToken {
    return TypeAssert::isInstanceOf(XHPElementNameToken::class, $this->_name);
  }

  public function raw_name(): EditableSyntax {
    return $this->_name;
  }

  public function with_name(EditableSyntax $value): this {
    return new self($this->_left_angle, $value, $this->_right_angle);
  }

  public function right_angle(): ?GreaterThanToken {
    return $this->_right_angle->is_missing() ? null : TypeAssert::isInstanceOf(GreaterThanToken::class, $this->_right_angle);
  }

  public function right_anglex(): GreaterThanToken {
    return TypeAssert::isInstanceOf(GreaterThanToken::class, $this->_right_angle);
  }

  public function raw_right_angle(): EditableSyntax {
    return $this->_right_angle;
  }

  public function with_right_angle(EditableSyntax $value): this {
    return new self($this->_left_angle, $this->_name, $value);
  }
}
