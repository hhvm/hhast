<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<5a2223bb91064688a9f604c3c038caac>>
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

  <<__Override>>
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
    $position += $left_angle->getWidth();
    $name = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['xhp_close_name'],
      $position,
      $source,
    );
    $position += $name->getWidth();
    $right_angle = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['xhp_close_right_angle'],
      $position,
      $source,
    );
    $position += $right_angle->getWidth();
    return new self($left_angle, $name, $right_angle);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'left_angle' => $this->_left_angle;
    yield 'name' => $this->_name;
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

  public function getLeftAngleUNTYPED(): EditableSyntax {
    return $this->_left_angle;
  }

  public function withLeftAngle(EditableSyntax $value): this {
    if ($value === $this->_left_angle) {
      return $this;
    }
    return new self($value, $this->_name, $this->_right_angle);
  }

  public function hasLeftAngle(): bool {
    return !$this->_left_angle->isMissing();
  }

  public function getLeftAngle(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_left_angle);
  }

  public function getNameUNTYPED(): EditableSyntax {
    return $this->_name;
  }

  public function withName(EditableSyntax $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new self($this->_left_angle, $value, $this->_right_angle);
  }

  public function hasName(): bool {
    return !$this->_name->isMissing();
  }

  public function getName(): ?XHPElementNameToken {
    if ($this->_name->isMissing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(XHPElementNameToken::class, $this->_name);
  }

  public function getNamex(): XHPElementNameToken {
    return TypeAssert::isInstanceOf(XHPElementNameToken::class, $this->_name);
  }

  public function getRightAngleUNTYPED(): EditableSyntax {
    return $this->_right_angle;
  }

  public function withRightAngle(EditableSyntax $value): this {
    if ($value === $this->_right_angle) {
      return $this;
    }
    return new self($this->_left_angle, $this->_name, $value);
  }

  public function hasRightAngle(): bool {
    return !$this->_right_angle->isMissing();
  }

  public function getRightAngle(): ?GreaterThanToken {
    if ($this->_right_angle->isMissing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(GreaterThanToken::class, $this->_right_angle);
  }

  public function getRightAnglex(): GreaterThanToken {
    return TypeAssert::isInstanceOf(GreaterThanToken::class, $this->_right_angle);
  }
}
