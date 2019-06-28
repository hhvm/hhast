/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<f34dd54c0507f29861a8be227c2a5fd5>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class TypeParameter extends Node {

  const string SYNTAX_KIND = 'type_parameter';

  private Node $_attribute_spec;
  private Node $_reified;
  private Node $_variance;
  private Node $_name;
  private Node $_constraints;

  public function __construct(
    Node $attribute_spec,
    Node $reified,
    Node $variance,
    Node $name,
    Node $constraints,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_attribute_spec = $attribute_spec;
    $this->_reified = $reified;
    $this->_variance = $variance;
    $this->_name = $name;
    $this->_constraints = $constraints;
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
      /* HH_FIXME[4110] */ $json['type_attribute_spec'],
      $file,
      $offset,
      $source,
      'AttributeSpecification',
    );
    $offset += $attribute_spec->getWidth();
    $reified = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['type_reified'],
      $file,
      $offset,
      $source,
      'ReifyToken',
    );
    $offset += $reified->getWidth();
    $variance = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['type_variance'],
      $file,
      $offset,
      $source,
      'Token',
    );
    $offset += $variance->getWidth();
    $name = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['type_name'],
      $file,
      $offset,
      $source,
      'NameToken',
    );
    $offset += $name->getWidth();
    $constraints = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['type_constraints'],
      $file,
      $offset,
      $source,
      'NodeList<TypeConstraint>',
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
  public function getChildren(): dict<string, Node> {
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
    vec<Node> $parents = vec[],
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

  public function getAttributeSpecUNTYPED(): Node {
    return $this->_attribute_spec;
  }

  public function withAttributeSpec(?AttributeSpecification $value): this {
    if ($value === $this->_attribute_spec) {
      return $this;
    }
    return new static(
      $value ?? Missing(),
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
    return TypeAssert\not_null($this->getAttributeSpec());
  }

  public function getReifiedUNTYPED(): Node {
    return $this->_reified;
  }

  public function withReified(?ReifyToken $value): this {
    if ($value === $this->_reified) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $value ?? Missing(),
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
    return TypeAssert\not_null($this->getReified());
  }

  public function getVarianceUNTYPED(): Node {
    return $this->_variance;
  }

  public function withVariance(?Token $value): this {
    if ($value === $this->_variance) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_reified,
      $value ?? Missing(),
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
  public function getVariance(): ?Token {
    if ($this->_variance->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(Token::class, $this->_variance);
  }

  /**
   * @return PlusToken | MinusToken
   */
  public function getVariancex(): Token {
    return TypeAssert\not_null($this->getVariance());
  }

  public function getNameUNTYPED(): Node {
    return $this->_name;
  }

  public function withName(NameToken $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_reified,
      $this->_variance,
      $value ?? Missing(),
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

  public function getConstraintsUNTYPED(): Node {
    return $this->_constraints;
  }

  public function withConstraints(?NodeList<TypeConstraint> $value): this {
    if ($value === $this->_constraints) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_reified,
      $this->_variance,
      $this->_name,
      $value ?? Missing(),
    );
  }

  public function hasConstraints(): bool {
    return !$this->_constraints->isMissing();
  }

  /**
   * @return NodeList<TypeConstraint> | null
   */
  public function getConstraints(): ?NodeList<TypeConstraint> {
    if ($this->_constraints->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(NodeList::class, $this->_constraints);
  }

  /**
   * @return NodeList<TypeConstraint>
   */
  public function getConstraintsx(): NodeList<TypeConstraint> {
    return TypeAssert\not_null($this->getConstraints());
  }
}
