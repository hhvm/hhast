<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<f461e816a2f8bf9859d7823a52d516e0>>
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
  ) {
    parent::__construct('type_constant');
    $this->_left_type = $left_type;
    $this->_separator = $separator;
    $this->_right_type = $right_type;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
  ): this {
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
    return new static($left_type, $separator, $right_type);
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
   * @returns NameToken | TypeConstant | SelfToken | ThisToken | ParentToken
   */
  public function getLeftType(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_left_type);
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
   * @returns ColonColonToken
   */
  public function getSeparator(): ColonColonToken {
    return TypeAssert\instance_of(ColonColonToken::class, $this->_separator);
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
   * @returns NameToken
   */
  public function getRightType(): NameToken {
    return TypeAssert\instance_of(NameToken::class, $this->_right_type);
  }
}
