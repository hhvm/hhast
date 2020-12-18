/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<9b717c5512dd1cd05cb6d41f36ce387f>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class TypeArguments extends Node {

  const string SYNTAX_KIND = 'type_arguments';

  private LessThanToken $_left_angle;
  private ?NodeList<ListItem<ITypeSpecifier>> $_types;
  private GreaterThanToken $_right_angle;

  public function __construct(
    LessThanToken $left_angle,
    ?NodeList<ListItem<ITypeSpecifier>> $types,
    GreaterThanToken $right_angle,
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
    $left_angle = $left_angle as nonnull;
    $offset += $left_angle->getWidth();
    $types = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['type_arguments_types'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'NodeList<ListItem<ITypeSpecifier>>',
    );
    $offset += $types?->getWidth() ?? 0;
    $right_angle = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['type_arguments_right_angle'],
      $file,
      $offset,
      $source,
      'GreaterThanToken',
    );
    $right_angle = $right_angle as nonnull;
    $offset += $right_angle->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $left_angle,
      /* HH_IGNORE_ERROR[4110] */ $types,
      /* HH_IGNORE_ERROR[4110] */ $right_angle,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'left_angle' => $this->_left_angle,
      'types' => $this->_types,
      'right_angle' => $this->_right_angle,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $left_angle = $rewriter($this->_left_angle, $parents);
    $types = $this->_types === null ? null : $rewriter($this->_types, $parents);
    $right_angle = $rewriter($this->_right_angle, $parents);
    if (
      $left_angle === $this->_left_angle &&
      $types === $this->_types &&
      $right_angle === $this->_right_angle
    ) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $left_angle,
      /* HH_FIXME[4110] use `as` */ $types,
      /* HH_FIXME[4110] use `as` */ $right_angle,
    );
  }

  public function getLeftAngleUNTYPED(): ?Node {
    return $this->_left_angle;
  }

  public function withLeftAngle(LessThanToken $value): this {
    if ($value === $this->_left_angle) {
      return $this;
    }
    return new static($value, $this->_types, $this->_right_angle);
  }

  public function hasLeftAngle(): bool {
    return $this->_left_angle !== null;
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

  public function getTypesUNTYPED(): ?Node {
    return $this->_types;
  }

  public function withTypes(?NodeList<ListItem<ITypeSpecifier>> $value): this {
    if ($value === $this->_types) {
      return $this;
    }
    return new static($this->_left_angle, $value, $this->_right_angle);
  }

  public function hasTypes(): bool {
    return $this->_types !== null;
  }

  /**
   * @return NodeList<ListItem<AttributizedSpecifier>> |
   * NodeList<ListItem<ITypeSpecifier>> |
   * NodeList<ListItem<ClassnameTypeSpecifier>> |
   * NodeList<ListItem<ClosureTypeSpecifier>> |
   * NodeList<ListItem<DarrayTypeSpecifier>> |
   * NodeList<ListItem<DictionaryTypeSpecifier>> |
   * NodeList<ListItem<GenericTypeSpecifier>> |
   * NodeList<ListItem<ISimpleCreationSpecifier>> |
   * NodeList<ListItem<KeysetTypeSpecifier>> |
   * NodeList<ListItem<LikeTypeSpecifier>> |
   * NodeList<ListItem<NullableTypeSpecifier>> |
   * NodeList<ListItem<ShapeTypeSpecifier>> |
   * NodeList<ListItem<SimpleTypeSpecifier>> |
   * NodeList<ListItem<TupleTypeSpecifier>> | NodeList<ListItem<TypeConstant>>
   * | NodeList<ListItem<VarrayTypeSpecifier>> |
   * NodeList<ListItem<VectorTypeSpecifier>> | null
   */
  public function getTypes(): ?NodeList<ListItem<ITypeSpecifier>> {
    return $this->_types;
  }

  /**
   * @return NodeList<ListItem<AttributizedSpecifier>> |
   * NodeList<ListItem<ITypeSpecifier>> |
   * NodeList<ListItem<ClassnameTypeSpecifier>> |
   * NodeList<ListItem<ClosureTypeSpecifier>> |
   * NodeList<ListItem<DarrayTypeSpecifier>> |
   * NodeList<ListItem<DictionaryTypeSpecifier>> |
   * NodeList<ListItem<GenericTypeSpecifier>> |
   * NodeList<ListItem<ISimpleCreationSpecifier>> |
   * NodeList<ListItem<KeysetTypeSpecifier>> |
   * NodeList<ListItem<LikeTypeSpecifier>> |
   * NodeList<ListItem<NullableTypeSpecifier>> |
   * NodeList<ListItem<ShapeTypeSpecifier>> |
   * NodeList<ListItem<SimpleTypeSpecifier>> |
   * NodeList<ListItem<TupleTypeSpecifier>> | NodeList<ListItem<TypeConstant>>
   * | NodeList<ListItem<VarrayTypeSpecifier>> |
   * NodeList<ListItem<VectorTypeSpecifier>>
   */
  public function getTypesx(): NodeList<ListItem<ITypeSpecifier>> {
    return TypeAssert\not_null($this->getTypes());
  }

  public function getRightAngleUNTYPED(): ?Node {
    return $this->_right_angle;
  }

  public function withRightAngle(GreaterThanToken $value): this {
    if ($value === $this->_right_angle) {
      return $this;
    }
    return new static($this->_left_angle, $this->_types, $value);
  }

  public function hasRightAngle(): bool {
    return $this->_right_angle !== null;
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
