/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<2d8d65931db58c9f4476d4e4dcf7c6c8>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class TypeParameter extends Node {

  const string SYNTAX_KIND = 'type_parameter';

  private ?OldAttributeSpecification $_attribute_spec;
  private ?ReifyToken $_reified;
  private ?Token $_variance;
  private NameToken $_name;
  private ?TypeParameters $_param_params;
  private ?NodeList<TypeConstraint> $_constraints;

  public function __construct(
    ?OldAttributeSpecification $attribute_spec,
    ?ReifyToken $reified,
    ?Token $variance,
    NameToken $name,
    ?TypeParameters $param_params,
    ?NodeList<TypeConstraint> $constraints,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_attribute_spec = $attribute_spec;
    $this->_reified = $reified;
    $this->_variance = $variance;
    $this->_name = $name;
    $this->_param_params = $param_params;
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
      /* HH_FIXME[4110] */ $json['type_attribute_spec'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'OldAttributeSpecification',
    );
    $offset += $attribute_spec?->getWidth() ?? 0;
    $reified = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['type_reified'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'ReifyToken',
    );
    $offset += $reified?->getWidth() ?? 0;
    $variance = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['type_variance'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Token',
    );
    $offset += $variance?->getWidth() ?? 0;
    $name = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['type_name'],
      $file,
      $offset,
      $source,
      'NameToken',
    );
    $name = $name as nonnull;
    $offset += $name->getWidth();
    $param_params = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['type_param_params'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'TypeParameters',
    );
    $offset += $param_params?->getWidth() ?? 0;
    $constraints = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['type_constraints'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'NodeList<TypeConstraint>',
    );
    $offset += $constraints?->getWidth() ?? 0;
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $attribute_spec,
      /* HH_IGNORE_ERROR[4110] */ $reified,
      /* HH_IGNORE_ERROR[4110] */ $variance,
      /* HH_IGNORE_ERROR[4110] */ $name,
      /* HH_IGNORE_ERROR[4110] */ $param_params,
      /* HH_IGNORE_ERROR[4110] */ $constraints,
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
      'param_params' => $this->_param_params,
      'constraints' => $this->_constraints,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $attribute_spec = $this->_attribute_spec === null
      ? null
      : $rewriter($this->_attribute_spec, $parents);
    $reified = $this->_reified === null
      ? null
      : $rewriter($this->_reified, $parents);
    $variance = $this->_variance === null
      ? null
      : $rewriter($this->_variance, $parents);
    $name = $rewriter($this->_name, $parents);
    $param_params = $this->_param_params === null
      ? null
      : $rewriter($this->_param_params, $parents);
    $constraints = $this->_constraints === null
      ? null
      : $rewriter($this->_constraints, $parents);
    if (
      $attribute_spec === $this->_attribute_spec &&
      $reified === $this->_reified &&
      $variance === $this->_variance &&
      $name === $this->_name &&
      $param_params === $this->_param_params &&
      $constraints === $this->_constraints
    ) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $attribute_spec,
      /* HH_FIXME[4110] use `as` */ $reified,
      /* HH_FIXME[4110] use `as` */ $variance,
      /* HH_FIXME[4110] use `as` */ $name,
      /* HH_FIXME[4110] use `as` */ $param_params,
      /* HH_FIXME[4110] use `as` */ $constraints,
    );
  }

  public function getAttributeSpecUNTYPED(): ?Node {
    return $this->_attribute_spec;
  }

  public function withAttributeSpec(?OldAttributeSpecification $value): this {
    if ($value === $this->_attribute_spec) {
      return $this;
    }
    return new static(
      $value,
      $this->_reified,
      $this->_variance,
      $this->_name,
      $this->_param_params,
      $this->_constraints,
    );
  }

  public function hasAttributeSpec(): bool {
    return $this->_attribute_spec !== null;
  }

  /**
   * @return null | OldAttributeSpecification
   */
  public function getAttributeSpec(): ?OldAttributeSpecification {
    return $this->_attribute_spec;
  }

  /**
   * @return OldAttributeSpecification
   */
  public function getAttributeSpecx(): OldAttributeSpecification {
    return TypeAssert\not_null($this->getAttributeSpec());
  }

  public function getReifiedUNTYPED(): ?Node {
    return $this->_reified;
  }

  public function withReified(?ReifyToken $value): this {
    if ($value === $this->_reified) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $value,
      $this->_variance,
      $this->_name,
      $this->_param_params,
      $this->_constraints,
    );
  }

  public function hasReified(): bool {
    return $this->_reified !== null;
  }

  /**
   * @return null | ReifyToken
   */
  public function getReified(): ?ReifyToken {
    return $this->_reified;
  }

  /**
   * @return ReifyToken
   */
  public function getReifiedx(): ReifyToken {
    return TypeAssert\not_null($this->getReified());
  }

  public function getVarianceUNTYPED(): ?Node {
    return $this->_variance;
  }

  public function withVariance(?Token $value): this {
    if ($value === $this->_variance) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_reified,
      $value,
      $this->_name,
      $this->_param_params,
      $this->_constraints,
    );
  }

  public function hasVariance(): bool {
    return $this->_variance !== null;
  }

  /**
   * @return null | PlusToken | MinusToken
   */
  public function getVariance(): ?Token {
    return $this->_variance;
  }

  /**
   * @return PlusToken | MinusToken
   */
  public function getVariancex(): Token {
    return TypeAssert\not_null($this->getVariance());
  }

  public function getNameUNTYPED(): ?Node {
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
      $value,
      $this->_param_params,
      $this->_constraints,
    );
  }

  public function hasName(): bool {
    return $this->_name !== null;
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

  public function getParamParamsUNTYPED(): ?Node {
    return $this->_param_params;
  }

  public function withParamParams(?TypeParameters $value): this {
    if ($value === $this->_param_params) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_reified,
      $this->_variance,
      $this->_name,
      $value,
      $this->_constraints,
    );
  }

  public function hasParamParams(): bool {
    return $this->_param_params !== null;
  }

  /**
   * @return null | TypeParameters
   */
  public function getParamParams(): ?TypeParameters {
    return $this->_param_params;
  }

  /**
   * @return TypeParameters
   */
  public function getParamParamsx(): TypeParameters {
    return TypeAssert\not_null($this->getParamParams());
  }

  public function getConstraintsUNTYPED(): ?Node {
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
      $this->_param_params,
      $value,
    );
  }

  public function hasConstraints(): bool {
    return $this->_constraints !== null;
  }

  /**
   * @return NodeList<TypeConstraint> | null
   */
  public function getConstraints(): ?NodeList<TypeConstraint> {
    return $this->_constraints;
  }

  /**
   * @return NodeList<TypeConstraint>
   */
  public function getConstraintsx(): NodeList<TypeConstraint> {
    return TypeAssert\not_null($this->getConstraints());
  }
}
