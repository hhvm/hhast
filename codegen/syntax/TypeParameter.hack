/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<9c7b8f7a39e55897944263fde5ac227a>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class TypeParameter extends EditableNode {

  private EditableNode $_attribute_spec;
  private EditableNode $_reified;
  private EditableNode $_variance;
  private EditableNode $_name;
  private EditableNode $_constraints;

  public function __construct(
    EditableNode $attribute_spec,
    EditableNode $reified,
    EditableNode $variance,
    EditableNode $name,
    EditableNode $constraints,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_attribute_spec = $attribute_spec;
    $this->_reified = $reified;
    $this->_variance = $variance;
    $this->_name = $name;
    $this->_constraints = $constraints;
    parent::__construct('type_parameter', $source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
  ): this {
    $offset = $initial_offset;
    $attribute_spec = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['type_attribute_spec'],
      $file,
      $offset,
      $source,
    );
    $offset += $attribute_spec->getWidth();
    $reified = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['type_reified'],
      $file,
      $offset,
      $source,
    );
    $offset += $reified->getWidth();
    $variance = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['type_variance'],
      $file,
      $offset,
      $source,
    );
    $offset += $variance->getWidth();
    $name = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['type_name'],
      $file,
      $offset,
      $source,
    );
    $offset += $name->getWidth();
    $constraints = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['type_constraints'],
      $file,
      $offset,
      $source,
    );
    $offset += $constraints->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      $attribute_spec,
      $reified,
      $variance,
      $name,
      $constraints,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'attribute_spec' => $this->_attribute_spec,
      'reified' => $this->_reified,
      'variance' => $this->_variance,
      'name' => $this->_name,
      'constraints' => $this->_constraints,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<EditableNode> $parents = vec[],
  ): this {
    $parents[] = $this;
    $attribute_spec = $rewriter($this->_attribute_spec, $parents);
    $reified = $rewriter($this->_reified, $parents);
    $variance = $rewriter($this->_variance, $parents);
    $name = $rewriter($this->_name, $parents);
    $constraints = $rewriter($this->_constraints, $parents);
    if (
      $attribute_spec === $this->_attribute_spec &&
      $reified === $this->_reified &&
      $variance === $this->_variance &&
      $name === $this->_name &&
      $constraints === $this->_constraints
    ) {
      return $this;
    }
    return new static(
      $attribute_spec,
      $reified,
      $variance,
      $name,
      $constraints,
    );
  }

  public function getAttributeSpecUNTYPED(): EditableNode {
    return $this->_attribute_spec;
  }

  public function withAttributeSpec(EditableNode $value): this {
    if ($value === $this->_attribute_spec) {
      return $this;
    }
    return new static(
      $value,
      $this->_reified,
      $this->_variance,
      $this->_name,
      $this->_constraints,
    );
  }

  public function hasAttributeSpec(): bool {
    return !$this->_attribute_spec->isMissing();
  }

  /**
   * @return AttributeSpecification | null
   */
  public function getAttributeSpec(): ?AttributeSpecification {
    if ($this->_attribute_spec->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(
      AttributeSpecification::class,
      $this->_attribute_spec,
    );
  }

  /**
   * @return AttributeSpecification
   */
  public function getAttributeSpecx(): AttributeSpecification {
    return TypeAssert\instance_of(
      AttributeSpecification::class,
      $this->_attribute_spec,
    );
  }

  public function getReifiedUNTYPED(): EditableNode {
    return $this->_reified;
  }

  public function withReified(EditableNode $value): this {
    if ($value === $this->_reified) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $value,
      $this->_variance,
      $this->_name,
      $this->_constraints,
    );
  }

  public function hasReified(): bool {
    return !$this->_reified->isMissing();
  }

  /**
   * @return null | ReifyToken
   */
  public function getReified(): ?ReifyToken {
    if ($this->_reified->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(ReifyToken::class, $this->_reified);
  }

  /**
   * @return ReifyToken
   */
  public function getReifiedx(): ReifyToken {
    return TypeAssert\instance_of(ReifyToken::class, $this->_reified);
  }

  public function getVarianceUNTYPED(): EditableNode {
    return $this->_variance;
  }

  public function withVariance(EditableNode $value): this {
    if ($value === $this->_variance) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_reified,
      $value,
      $this->_name,
      $this->_constraints,
    );
  }

  public function hasVariance(): bool {
    return !$this->_variance->isMissing();
  }

  /**
   * @return null | PlusToken | MinusToken
   */
  public function getVariance(): ?EditableToken {
    if ($this->_variance->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableToken::class, $this->_variance);
  }

  /**
   * @return PlusToken | MinusToken
   */
  public function getVariancex(): EditableToken {
    return TypeAssert\instance_of(EditableToken::class, $this->_variance);
  }

  public function getNameUNTYPED(): EditableNode {
    return $this->_name;
  }

  public function withName(EditableNode $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_reified,
      $this->_variance,
      $value,
      $this->_constraints,
    );
  }

  public function hasName(): bool {
    return !$this->_name->isMissing();
  }

  /**
   * @return NameToken
   */
  public function getName(): NameToken {
    return TypeAssert\instance_of(NameToken::class, $this->_name);
  }

  /**
   * @return NameToken
   */
  public function getNamex(): NameToken {
    return $this->getName();
  }

  public function getConstraintsUNTYPED(): EditableNode {
    return $this->_constraints;
  }

  public function withConstraints(EditableNode $value): this {
    if ($value === $this->_constraints) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_reified,
      $this->_variance,
      $this->_name,
      $value,
    );
  }

  public function hasConstraints(): bool {
    return !$this->_constraints->isMissing();
  }

  /**
   * @return EditableList<EditableNode> | null
   */
  public function getConstraints(): ?EditableList<EditableNode> {
    if ($this->_constraints->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableList::class, $this->_constraints);
  }

  /**
   * @return EditableList<EditableNode>
   */
  public function getConstraintsx(): EditableList<EditableNode> {
    return TypeAssert\instance_of(EditableList::class, $this->_constraints);
  }
}
