/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<6afb3f7b3497231cd3fd6c2f48ffd221>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class TypeArguments extends Node {

  const string SYNTAX_KIND = 'type_arguments';

  private Node $_left_angle;
  private Node $_types;
  private Node $_right_angle;

  public function __construct(
    Node $left_angle,
    Node $types,
    Node $right_angle,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_left_angle = $left_angle;
    $this->_types = $types;
    $this->_right_angle = $right_angle;
    parent::__construct($source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
    string $_type_hint,
  ): this {
    $offset = $initial_offset;
    $left_angle = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['type_arguments_left_angle'],
      $file,
      $offset,
      $source,
      'LessThanToken',
    );
    $offset += $left_angle->getWidth();
    $types = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['type_arguments_types'],
      $file,
      $offset,
      $source,
      'NodeList<ListItem<ITypeSpecifier>>',
    );
    $offset += $types->getWidth();
    $right_angle = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['type_arguments_right_angle'],
      $file,
      $offset,
      $source,
      'GreaterThanToken',
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
  public function getChildren(): dict<string, Node> {
    return dict[
      'left_angle' => $this->_left_angle,
      'types' => $this->_types,
      'right_angle' => $this->_right_angle,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $left_angle = $rewriter($this->_left_angle, $parents);
    $types = $rewriter($this->_types, $parents);
    $right_angle = $rewriter($this->_right_angle, $parents);
    if (
      $left_angle === $this->_left_angle &&
      $types === $this->_types &&
      $right_angle === $this->_right_angle
    ) {
      return $this;
    }
    return new static($left_angle, $types, $right_angle);
  }

  public function getLeftAngleUNTYPED(): Node {
    return $this->_left_angle;
  }

  public function withLeftAngle(Node $value): this {
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

  public function getTypesUNTYPED(): Node {
    return $this->_types;
  }

  public function withTypes(Node $value): this {
    if ($value === $this->_types) {
      return $this;
    }
    return new static($this->_left_angle, $value, $this->_right_angle);
  }

  public function hasTypes(): bool {
    return !$this->_types->isMissing();
  }

  /**
   * @return NodeList<ListItem<ClassnameTypeSpecifier>> |
   * NodeList<ListItem<ClosureTypeSpecifier>> |
   * NodeList<ListItem<DarrayTypeSpecifier>> |
   * NodeList<ListItem<ITypeSpecifier>> |
   * NodeList<ListItem<DictionaryTypeSpecifier>> |
   * NodeList<ListItem<GenericTypeSpecifier>> |
   * NodeList<ListItem<ISimpleCreationSpecifier>> |
   * NodeList<ListItem<LikeTypeSpecifier>> |
   * NodeList<ListItem<MapArrayTypeSpecifier>> |
   * NodeList<ListItem<NullableTypeSpecifier>> |
   * NodeList<ListItem<ShapeTypeSpecifier>> |
   * NodeList<ListItem<SimpleTypeSpecifier>> |
   * NodeList<ListItem<SoftTypeSpecifier>> |
   * NodeList<ListItem<TupleTypeSpecifier>> | NodeList<ListItem<TypeConstant>>
   * | NodeList<ListItem<VectorArrayTypeSpecifier>> |
   * NodeList<ListItem<VectorTypeSpecifier>>
   */
  public function getTypes(): NodeList<ListItem<ITypeSpecifier>> {
    return TypeAssert\instance_of(NodeList::class, $this->_types);
  }

  /**
   * @return NodeList<ListItem<ClassnameTypeSpecifier>> |
   * NodeList<ListItem<ClosureTypeSpecifier>> |
   * NodeList<ListItem<DarrayTypeSpecifier>> |
   * NodeList<ListItem<ITypeSpecifier>> |
   * NodeList<ListItem<DictionaryTypeSpecifier>> |
   * NodeList<ListItem<GenericTypeSpecifier>> |
   * NodeList<ListItem<ISimpleCreationSpecifier>> |
   * NodeList<ListItem<LikeTypeSpecifier>> |
   * NodeList<ListItem<MapArrayTypeSpecifier>> |
   * NodeList<ListItem<NullableTypeSpecifier>> |
   * NodeList<ListItem<ShapeTypeSpecifier>> |
   * NodeList<ListItem<SimpleTypeSpecifier>> |
   * NodeList<ListItem<SoftTypeSpecifier>> |
   * NodeList<ListItem<TupleTypeSpecifier>> | NodeList<ListItem<TypeConstant>>
   * | NodeList<ListItem<VectorArrayTypeSpecifier>> |
   * NodeList<ListItem<VectorTypeSpecifier>>
   */
  public function getTypesx(): NodeList<ListItem<ITypeSpecifier>> {
    return $this->getTypes();
  }

  public function getRightAngleUNTYPED(): Node {
    return $this->_right_angle;
  }

  public function withRightAngle(Node $value): this {
    if ($value === $this->_right_angle) {
      return $this;
    }
    return new static($this->_left_angle, $this->_types, $value);
  }

  public function hasRightAngle(): bool {
    return !$this->_right_angle->isMissing();
  }

  /**
   * @return GreaterThanToken
   */
  public function getRightAngle(): GreaterThanToken {
    return TypeAssert\instance_of(GreaterThanToken::class, $this->_right_angle);
  }

  /**
   * @return GreaterThanToken
   */
  public function getRightAnglex(): GreaterThanToken {
    return $this->getRightAngle();
  }
}
