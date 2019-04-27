/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<be155d2c371a84dfc584135afeae7d52>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class TypeArguments extends EditableNode {

  private EditableNode $_left_angle;
  private EditableNode $_types;
  private EditableNode $_right_angle;

  public function __construct(
    EditableNode $left_angle,
    EditableNode $types,
    EditableNode $right_angle,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_left_angle = $left_angle;
    $this->_types = $types;
    $this->_right_angle = $right_angle;
    parent::__construct('type_arguments', $source_ref);
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
      /* UNSAFE_EXPR */ $json['type_arguments_left_angle'],
      $file,
      $offset,
      $source,
    );
    $offset += $left_angle->getWidth();
    $types = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['type_arguments_types'],
      $file,
      $offset,
      $source,
    );
    $offset += $types->getWidth();
    $right_angle = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['type_arguments_right_angle'],
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
    return new static($left_angle, $types, $right_angle, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'left_angle' => $this->_left_angle,
      'types' => $this->_types,
      'right_angle' => $this->_right_angle,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    vec<EditableNode> $parents = vec[],
  ): this {
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
    return new static($left_angle, $types, $right_angle);
  }

  public function getLeftAngleUNTYPED(): EditableNode {
    return $this->_left_angle;
  }

  public function withLeftAngle(EditableNode $value): this {
    if ($value === $this->_left_angle) {
      return $this;
    }
    return new static($value, $this->_types, $this->_right_angle);
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

  public function getTypesUNTYPED(): EditableNode {
    return $this->_types;
  }

  public function withTypes(EditableNode $value): this {
    if ($value === $this->_types) {
      return $this;
    }
    return new static($this->_left_angle, $value, $this->_right_angle);
  }

  public function hasTypes(): bool {
    return !$this->_types->isMissing();
  }

  /**
   * @return EditableList<ClassnameTypeSpecifier> |
   * EditableList<ClosureTypeSpecifier> | EditableList<DarrayTypeSpecifier> |
   * EditableList<EditableNode> | EditableList<DictionaryTypeSpecifier> |
   * EditableList<GenericTypeSpecifier> | EditableList<LikeTypeSpecifier> |
   * EditableList<MapArrayTypeSpecifier> | EditableList<NullableTypeSpecifier>
   * | EditableList<ReifiedTypeArgument> | EditableList<ShapeTypeSpecifier> |
   * EditableList<SimpleTypeSpecifier> | EditableList<SoftTypeSpecifier> |
   * EditableList<TupleTypeSpecifier> | EditableList<TypeConstant> |
   * EditableList<VectorArrayTypeSpecifier> | EditableList<VectorTypeSpecifier>
   */
  public function getTypes(): EditableList<EditableNode> {
    return TypeAssert\instance_of(EditableList::class, $this->_types);
  }

  /**
   * @return EditableList<ClassnameTypeSpecifier> |
   * EditableList<ClosureTypeSpecifier> | EditableList<DarrayTypeSpecifier> |
   * EditableList<EditableNode> | EditableList<DictionaryTypeSpecifier> |
   * EditableList<GenericTypeSpecifier> | EditableList<LikeTypeSpecifier> |
   * EditableList<MapArrayTypeSpecifier> | EditableList<NullableTypeSpecifier>
   * | EditableList<ReifiedTypeArgument> | EditableList<ShapeTypeSpecifier> |
   * EditableList<SimpleTypeSpecifier> | EditableList<SoftTypeSpecifier> |
   * EditableList<TupleTypeSpecifier> | EditableList<TypeConstant> |
   * EditableList<VectorArrayTypeSpecifier> | EditableList<VectorTypeSpecifier>
   */
  public function getTypesx(): EditableList<EditableNode> {
    return $this->getTypes();
  }

  public function getRightAngleUNTYPED(): EditableNode {
    return $this->_right_angle;
  }

  public function withRightAngle(EditableNode $value): this {
    if ($value === $this->_right_angle) {
      return $this;
    }
    return new static($this->_left_angle, $this->_types, $value);
  }

  public function hasRightAngle(): bool {
    return !$this->_right_angle->isMissing();
  }

  /**
   * @return null | GreaterThanToken
   */
  public function getRightAngle(): ?GreaterThanToken {
    if ($this->_right_angle->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(GreaterThanToken::class, $this->_right_angle);
  }

  /**
   * @return GreaterThanToken
   */
  public function getRightAnglex(): GreaterThanToken {
    return TypeAssert\instance_of(GreaterThanToken::class, $this->_right_angle);
  }
}
