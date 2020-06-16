/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<c3a58dee134ce5cec98af1bfce2c835b>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class AttributizedSpecifier extends Node implements ITypeSpecifier {

  const string SYNTAX_KIND = 'attributized_specifier';

  private OldAttributeSpecification $_attribute_spec;
  private ITypeSpecifier $_type;

  public function __construct(
    OldAttributeSpecification $attribute_spec,
    ITypeSpecifier $type,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_attribute_spec = $attribute_spec;
    $this->_type = $type;
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
    $attribute_spec = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['attributized_specifier_attribute_spec'],
      $file,
      $offset,
      $source,
      'OldAttributeSpecification',
    );
    $attribute_spec = $attribute_spec as nonnull;
    $offset += $attribute_spec->getWidth();
    $type = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['attributized_specifier_type'],
      $file,
      $offset,
      $source,
      'ITypeSpecifier',
    );
    $type = $type as nonnull;
    $offset += $type->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $attribute_spec,
      /* HH_IGNORE_ERROR[4110] */ $type,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'attribute_spec' => $this->_attribute_spec,
      'type' => $this->_type,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $attribute_spec = $rewriter($this->_attribute_spec, $parents);
    $type = $rewriter($this->_type, $parents);
    if ($attribute_spec === $this->_attribute_spec && $type === $this->_type) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $attribute_spec,
      /* HH_FIXME[4110] use `as` */ $type,
    );
  }

  public function getAttributeSpecUNTYPED(): ?Node {
    return $this->_attribute_spec;
  }

  public function withAttributeSpec(OldAttributeSpecification $value): this {
    if ($value === $this->_attribute_spec) {
      return $this;
    }
    return new static($value, $this->_type);
  }

  public function hasAttributeSpec(): bool {
    return $this->_attribute_spec !== null;
  }

  /**
   * @return OldAttributeSpecification
   */
  public function getAttributeSpec(): OldAttributeSpecification {
    return TypeAssert\instance_of(
      OldAttributeSpecification::class,
      $this->_attribute_spec,
    );
  }

  /**
   * @return OldAttributeSpecification
   */
  public function getAttributeSpecx(): OldAttributeSpecification {
    return $this->getAttributeSpec();
  }

  public function getTypeUNTYPED(): ?Node {
    return $this->_type;
  }

  public function withType(ITypeSpecifier $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return new static($this->_attribute_spec, $value);
  }

  public function hasType(): bool {
    return $this->_type !== null;
  }

  /**
   * @return ClosureTypeSpecifier | DarrayTypeSpecifier | GenericTypeSpecifier
   * | NullableTypeSpecifier | SimpleTypeSpecifier | TupleTypeSpecifier
   */
  public function getType(): ITypeSpecifier {
    return TypeAssert\instance_of(ITypeSpecifier::class, $this->_type);
  }

  /**
   * @return ClosureTypeSpecifier | DarrayTypeSpecifier | GenericTypeSpecifier
   * | NullableTypeSpecifier | SimpleTypeSpecifier | TupleTypeSpecifier
   */
  public function getTypex(): ITypeSpecifier {
    return $this->getType();
  }
}
