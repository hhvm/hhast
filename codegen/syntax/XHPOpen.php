<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<36c2814cb8dc0f1fd4696964de0de0fd>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class XHPOpen extends EditableNode {

  private EditableNode $_left_angle;
  private EditableNode $_name;
  private EditableNode $_attributes;
  private EditableNode $_right_angle;

  public function __construct(
    EditableNode $left_angle,
    EditableNode $name,
    EditableNode $attributes,
    EditableNode $right_angle,
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
    string $file,
    int $offset,
    string $source,
  ): this {
    $left_angle = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['xhp_open_left_angle'],
      $file,
      $offset,
      $source,
    );
    $offset += $left_angle->getWidth();
    $name = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['xhp_open_name'],
      $file,
      $offset,
      $source,
    );
    $offset += $name->getWidth();
    $attributes = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['xhp_open_attributes'],
      $file,
      $offset,
      $source,
    );
    $offset += $attributes->getWidth();
    $right_angle = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['xhp_open_right_angle'],
      $file,
      $offset,
      $source,
    );
    $offset += $right_angle->getWidth();
    return new self($left_angle, $name, $attributes, $right_angle);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'left_angle' => $this->_left_angle,
      'name' => $this->_name,
      'attributes' => $this->_attributes,
      'right_angle' => $this->_right_angle,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?vec<EditableNode> $parents = null,
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

  public function getLeftAngleUNTYPED(): EditableNode {
    return $this->_left_angle;
  }

  public function withLeftAngle(EditableNode $value): this {
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

  public function getNameUNTYPED(): EditableNode {
    return $this->_name;
  }

  public function withName(EditableNode $value): this {
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

  public function getAttributesUNTYPED(): EditableNode {
    return $this->_attributes;
  }

  public function withAttributes(EditableNode $value): this {
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
   * @returns EditableList | Missing
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

  public function getRightAngleUNTYPED(): EditableNode {
    return $this->_right_angle;
  }

  public function withRightAngle(EditableNode $value): this {
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
   * @returns SlashGreaterThanToken | GreaterThanToken | Missing
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
