<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<327bc04bd08311ef7c7ea154f82fb418>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class XHPClose extends EditableNode {

  private EditableNode $_left_angle;
  private EditableNode $_name;
  private EditableNode $_right_angle;

  public function __construct(
    EditableNode $left_angle,
    EditableNode $name,
    EditableNode $right_angle,
  ) {
    parent::__construct('xhp_close');
    $this->_left_angle = $left_angle;
    $this->_name = $name;
    $this->_right_angle = $right_angle;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $left_angle = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['xhp_close_left_angle'],
      $position,
      $source,
    );
    $position += $left_angle->getWidth();
    $name = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['xhp_close_name'],
      $position,
      $source,
    );
    $position += $name->getWidth();
    $right_angle = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['xhp_close_right_angle'],
      $position,
      $source,
    );
    $position += $right_angle->getWidth();
    return new self($left_angle, $name, $right_angle);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableNode> {
    return dict[
      'left_angle' => $this->_left_angle,
      'name' => $this->_name,
      'right_angle' => $this->_right_angle,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?Traversable<EditableNode> $parents = null,
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

  public function getLeftAngleUNTYPED(): EditableNode {
    return $this->_left_angle;
  }

  public function withLeftAngle(EditableNode $value): this {
    if ($value === $this->_left_angle) {
      return $this;
    }
    return new self($value, $this->_name, $this->_right_angle);
  }

  public function hasLeftAngle(): bool {
    return !$this->_left_angle->isMissing();
  }

  /**
   * @returns LessThanSlashToken | EndOfFileToken
   */
  public function getLeftAngle(): EditableToken {
    return TypeAssert\instance_of(EditableToken::class, $this->_left_angle);
  }

  public function getNameUNTYPED(): EditableNode {
    return $this->_name;
  }

  public function withName(EditableNode $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new self($this->_left_angle, $value, $this->_right_angle);
  }

  public function hasName(): bool {
    return !$this->_name->isMissing();
  }

  /**
   * @returns XHPElementNameToken | Missing
   */
  public function getName(): ?XHPElementNameToken {
    if ($this->_name->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(XHPElementNameToken::class, $this->_name);
  }

  /**
   * @returns XHPElementNameToken
   */
  public function getNamex(): XHPElementNameToken {
    return TypeAssert\instance_of(XHPElementNameToken::class, $this->_name);
  }

  public function getRightAngleUNTYPED(): EditableNode {
    return $this->_right_angle;
  }

  public function withRightAngle(EditableNode $value): this {
    if ($value === $this->_right_angle) {
      return $this;
    }
    return new self($this->_left_angle, $this->_name, $value);
  }

  public function hasRightAngle(): bool {
    return !$this->_right_angle->isMissing();
  }

  /**
   * @returns GreaterThanToken | Missing
   */
  public function getRightAngle(): ?GreaterThanToken {
    if ($this->_right_angle->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(GreaterThanToken::class, $this->_right_angle);
  }

  /**
   * @returns GreaterThanToken
   */
  public function getRightAnglex(): GreaterThanToken {
    return TypeAssert\instance_of(GreaterThanToken::class, $this->_right_angle);
  }
}
