/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<a5636ec0ebdc2643f9b3e51f18445fb9>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class TypeConstant extends EditableNode {

  private EditableNode $_left_type;
  private EditableNode $_separator;
  private EditableNode $_right_type;

  public function __construct(
    EditableNode $left_type,
    EditableNode $separator,
    EditableNode $right_type,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_left_type = $left_type;
    $this->_separator = $separator;
    $this->_right_type = $right_type;
    parent::__construct('type_constant', $source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
  ): this {
    $offset = $initial_offset;
    $left_type = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['type_constant_left_type'],
      $file,
      $offset,
      $source,
    );
    $offset += $left_type->getWidth();
    $separator = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['type_constant_separator'],
      $file,
      $offset,
      $source,
    );
    $offset += $separator->getWidth();
    $right_type = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['type_constant_right_type'],
      $file,
      $offset,
      $source,
    );
    $offset += $right_type->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static($left_type, $separator, $right_type, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'left_type' => $this->_left_type,
      'separator' => $this->_separator,
      'right_type' => $this->_right_type,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?vec<EditableNode> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $left_type = $this->_left_type->rewrite($rewriter, $parents);
    $separator = $this->_separator->rewrite($rewriter, $parents);
    $right_type = $this->_right_type->rewrite($rewriter, $parents);
    if (
      $left_type === $this->_left_type &&
      $separator === $this->_separator &&
      $right_type === $this->_right_type
    ) {
      return $this;
    }
    return new static($left_type, $separator, $right_type);
  }

  public function getLeftTypeUNTYPED(): EditableNode {
    return $this->_left_type;
  }

  public function withLeftType(EditableNode $value): this {
    if ($value === $this->_left_type) {
      return $this;
    }
    return new static($value, $this->_separator, $this->_right_type);
  }

  public function hasLeftType(): bool {
    return !$this->_left_type->isMissing();
  }

  /**
   * @return NameToken | ParentToken | SelfToken | ThisToken | TypeConstant
   */
  public function getLeftType(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_left_type);
  }

  /**
   * @return NameToken | ParentToken | SelfToken | ThisToken | TypeConstant
   */
  public function getLeftTypex(): EditableNode {
    return $this->getLeftType();
  }

  public function getSeparatorUNTYPED(): EditableNode {
    return $this->_separator;
  }

  public function withSeparator(EditableNode $value): this {
    if ($value === $this->_separator) {
      return $this;
    }
    return new static($this->_left_type, $value, $this->_right_type);
  }

  public function hasSeparator(): bool {
    return !$this->_separator->isMissing();
  }

  /**
   * @return ColonColonToken
   */
  public function getSeparator(): ColonColonToken {
    return TypeAssert\instance_of(ColonColonToken::class, $this->_separator);
  }

  /**
   * @return ColonColonToken
   */
  public function getSeparatorx(): ColonColonToken {
    return $this->getSeparator();
  }

  public function getRightTypeUNTYPED(): EditableNode {
    return $this->_right_type;
  }

  public function withRightType(EditableNode $value): this {
    if ($value === $this->_right_type) {
      return $this;
    }
    return new static($this->_left_type, $this->_separator, $value);
  }

  public function hasRightType(): bool {
    return !$this->_right_type->isMissing();
  }

  /**
   * @return NameToken
   */
  public function getRightType(): NameToken {
    return TypeAssert\instance_of(NameToken::class, $this->_right_type);
  }

  /**
   * @return NameToken
   */
  public function getRightTypex(): NameToken {
    return $this->getRightType();
  }
}
