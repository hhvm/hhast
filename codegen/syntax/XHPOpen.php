<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<e0cb7eea505ef686fd3fd73fd444243a>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class XHPOpen extends EditableSyntax {

  private EditableSyntax $_left_angle;
  private EditableSyntax $_name;
  private EditableSyntax $_attributes;
  private EditableSyntax $_right_angle;

  public function __construct(
    EditableSyntax $left_angle,
    EditableSyntax $name,
    EditableSyntax $attributes,
    EditableSyntax $right_angle,
  ) {
    parent::__construct('xhp_open');
    $this->_left_angle = $left_angle;
    $this->_name = $name;
    $this->_attributes = $attributes;
    $this->_right_angle = $right_angle;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $left_angle = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['xhp_open_left_angle'],
      $position,
      $source,
    );
    $position += $left_angle->getWidth();
    $name = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['xhp_open_name'],
      $position,
      $source,
    );
    $position += $name->getWidth();
    $attributes = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['xhp_open_attributes'],
      $position,
      $source,
    );
    $position += $attributes->getWidth();
    $right_angle = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['xhp_open_right_angle'],
      $position,
      $source,
    );
    $position += $right_angle->getWidth();
    return new self($left_angle, $name, $attributes, $right_angle);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'left_angle' => $this->_left_angle;
    yield 'name' => $this->_name;
    yield 'attributes' => $this->_attributes;
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
    $name = $this->_name->rewrite($rewriter, $parents);
    $attributes = $this->_attributes->rewrite($rewriter, $parents);
    $right_angle = $this->_right_angle->rewrite($rewriter, $parents);
    if (
      $left_angle === $this->_left_angle &&
      $name === $this->_name &&
      $attributes === $this->_attributes &&
      $right_angle === $this->_right_angle
    ) {
      return $this;
    }
    return new self($left_angle, $name, $attributes, $right_angle);
  }

  public function getLeftAngleUNTYPED(): EditableSyntax {
    return $this->_left_angle;
  }

  public function withLeftAngle(EditableSyntax $value): this {
    if ($value === $this->_left_angle) {
      return $this;
    }
    return
      new self($value, $this->_name, $this->_attributes, $this->_right_angle);
  }

  public function hasLeftAngle(): bool {
    return !$this->_left_angle->isMissing();
  }

  /**
   * @returns LessThanToken
   */
  public function getLeftAngle(): LessThanToken {
    return TypeAssert\instance_of(LessThanToken::class, $this->_left_angle);
  }

  public function getNameUNTYPED(): EditableSyntax {
    return $this->_name;
  }

  public function withName(EditableSyntax $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new self(
      $this->_left_angle,
      $value,
      $this->_attributes,
      $this->_right_angle,
    );
  }

  public function hasName(): bool {
    return !$this->_name->isMissing();
  }

  /**
   * @returns XHPElementNameToken
   */
  public function getName(): XHPElementNameToken {
    return TypeAssert\instance_of(XHPElementNameToken::class, $this->_name);
  }

  public function getAttributesUNTYPED(): EditableSyntax {
    return $this->_attributes;
  }

  public function withAttributes(EditableSyntax $value): this {
    if ($value === $this->_attributes) {
      return $this;
    }
    return
      new self($this->_left_angle, $this->_name, $value, $this->_right_angle);
  }

  public function hasAttributes(): bool {
    return !$this->_attributes->isMissing();
  }

  /**
   * @returns Missing | EditableList
   */
  public function getAttributes(): ?EditableList {
    if ($this->_attributes->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableList::class, $this->_attributes);
  }

  /**
   * @returns EditableList
   */
  public function getAttributesx(): EditableList {
    return TypeAssert\instance_of(EditableList::class, $this->_attributes);
  }

  public function getRightAngleUNTYPED(): EditableSyntax {
    return $this->_right_angle;
  }

  public function withRightAngle(EditableSyntax $value): this {
    if ($value === $this->_right_angle) {
      return $this;
    }
    return
      new self($this->_left_angle, $this->_name, $this->_attributes, $value);
  }

  public function hasRightAngle(): bool {
    return !$this->_right_angle->isMissing();
  }

  /**
   * @returns SlashGreaterThanToken | Missing | GreaterThanToken
   */
  public function getRightAngle(): ?EditableToken {
    if ($this->_right_angle->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableToken::class, $this->_right_angle);
  }

  /**
   * @returns SlashGreaterThanToken | GreaterThanToken
   */
  public function getRightAnglex(): EditableToken {
    return TypeAssert\instance_of(EditableToken::class, $this->_right_angle);
  }
}
