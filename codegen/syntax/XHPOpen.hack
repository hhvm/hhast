/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<05fb2821fcb81307d0321e0ae9adc7c9>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class XHPOpen extends EditableNode {

  const string SYNTAX_KIND = 'xhp_open';

  private EditableNode $_left_angle;
  private EditableNode $_name;
  private EditableNode $_attributes;
  private EditableNode $_right_angle;

  public function __construct(
    EditableNode $left_angle,
    EditableNode $name,
    EditableNode $attributes,
    EditableNode $right_angle,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_left_angle = $left_angle;
    $this->_name = $name;
    $this->_attributes = $attributes;
    $this->_right_angle = $right_angle;
    parent::__construct($source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
  ): this {
    $offset = $initial_offset;
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
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      $left_angle,
      $name,
      $attributes,
      $right_angle,
      $source_ref,
    );
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
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<EditableNode> $parents = vec[],
  ): this {
    $parents[] = $this;
    $left_angle = $rewriter($this->_left_angle, $parents);
    $name = $rewriter($this->_name, $parents);
    $attributes = $rewriter($this->_attributes, $parents);
    $right_angle = $rewriter($this->_right_angle, $parents);
    if (
      $left_angle === $this->_left_angle &&
      $name === $this->_name &&
      $attributes === $this->_attributes &&
      $right_angle === $this->_right_angle
    ) {
      return $this;
    }
    return new static($left_angle, $name, $attributes, $right_angle);
  }

  public function getLeftAngleUNTYPED(): EditableNode {
    return $this->_left_angle;
  }

  public function withLeftAngle(EditableNode $value): this {
    if ($value === $this->_left_angle) {
      return $this;
    }
    return new static(
      $value,
      $this->_name,
      $this->_attributes,
      $this->_right_angle,
    );
  }

  public function hasLeftAngle(): bool {
    return !$this->_left_angle->isMissing();
  }

  /**
   * @return LessThanToken
   */
  public function getLeftAngle(): LessThanToken {
    return TypeAssert\instance_of(LessThanToken::class, $this->_left_angle);
  }

  /**
   * @return LessThanToken
   */
  public function getLeftAnglex(): LessThanToken {
    return $this->getLeftAngle();
  }

  public function getNameUNTYPED(): EditableNode {
    return $this->_name;
  }

  public function withName(EditableNode $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new static(
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
   * @return XHPElementNameToken
   */
  public function getName(): XHPElementNameToken {
    return TypeAssert\instance_of(XHPElementNameToken::class, $this->_name);
  }

  /**
   * @return XHPElementNameToken
   */
  public function getNamex(): XHPElementNameToken {
    return $this->getName();
  }

  public function getAttributesUNTYPED(): EditableNode {
    return $this->_attributes;
  }

  public function withAttributes(EditableNode $value): this {
    if ($value === $this->_attributes) {
      return $this;
    }
    return new static(
      $this->_left_angle,
      $this->_name,
      $value,
      $this->_right_angle,
    );
  }

  public function hasAttributes(): bool {
    return !$this->_attributes->isMissing();
  }

  /**
   * @return EditableList<EditableNode> | null
   */
  public function getAttributes(): ?EditableList<EditableNode> {
    if ($this->_attributes->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableList::class, $this->_attributes);
  }

  /**
   * @return EditableList<EditableNode>
   */
  public function getAttributesx(): EditableList<EditableNode> {
    return TypeAssert\not_null($this->getAttributes());
  }

  public function getRightAngleUNTYPED(): EditableNode {
    return $this->_right_angle;
  }

  public function withRightAngle(EditableNode $value): this {
    if ($value === $this->_right_angle) {
      return $this;
    }
    return new static(
      $this->_left_angle,
      $this->_name,
      $this->_attributes,
      $value,
    );
  }

  public function hasRightAngle(): bool {
    return !$this->_right_angle->isMissing();
  }

  /**
   * @return SlashGreaterThanToken | GreaterThanToken
   */
  public function getRightAngle(): EditableToken {
    return TypeAssert\instance_of(EditableToken::class, $this->_right_angle);
  }

  /**
   * @return SlashGreaterThanToken | GreaterThanToken
   */
  public function getRightAnglex(): EditableToken {
    return $this->getRightAngle();
  }
}
