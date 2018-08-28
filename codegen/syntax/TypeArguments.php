<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<7a044dabd0e63558effe698355e028e7>>
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
  ) {
    parent::__construct('type_arguments');
    $this->_left_angle = $left_angle;
    $this->_types = $types;
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
    return new static($left_angle, $types, $right_angle);
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
    ?vec<EditableNode> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
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
   * @returns LessThanToken
   */
  public function getLeftAngle(): LessThanToken {
    return TypeAssert\instance_of(LessThanToken::class, $this->_left_angle);
  }

  /**
   * @returns LessThanToken
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
   * @returns EditableList<ClassnameTypeSpecifier> |
   * EditableList<ClosureTypeSpecifier> | EditableList<DictionaryTypeSpecifier>
   * | EditableList<GenericTypeSpecifier> | EditableList<EditableNode> |
   * EditableList<MapArrayTypeSpecifier> | EditableList<NullableTypeSpecifier>
   * | EditableList<ShapeTypeSpecifier> | EditableList<SimpleTypeSpecifier> |
   * EditableList<TupleTypeSpecifier> | EditableList<TypeConstant> |
   * EditableList<VectorArrayTypeSpecifier>
   */
  public function getTypes(): EditableList<EditableNode> {
    return TypeAssert\instance_of(EditableList::class, $this->_types);
  }

  /**
   * @returns EditableList<ClassnameTypeSpecifier> |
   * EditableList<ClosureTypeSpecifier> | EditableList<DictionaryTypeSpecifier>
   * | EditableList<GenericTypeSpecifier> | EditableList<EditableNode> |
   * EditableList<MapArrayTypeSpecifier> | EditableList<NullableTypeSpecifier>
   * | EditableList<ShapeTypeSpecifier> | EditableList<SimpleTypeSpecifier> |
   * EditableList<TupleTypeSpecifier> | EditableList<TypeConstant> |
   * EditableList<VectorArrayTypeSpecifier>
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
   * @returns Missing | GreaterThanToken
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
