<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<e7cd16d96d0d88bf26e9c0833c3328a4>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class TypeParameter extends EditableNode {

  private EditableNode $_reified;
  private EditableNode $_variance;
  private EditableNode $_name;
  private EditableNode $_constraints;

  public function __construct(
    EditableNode $reified,
    EditableNode $variance,
    EditableNode $name,
    EditableNode $constraints,
  ) {
    parent::__construct('type_parameter');
    $this->_reified = $reified;
    $this->_variance = $variance;
    $this->_name = $name;
    $this->_constraints = $constraints;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
  ): this {
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
    return new static($reified, $variance, $name, $constraints);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'reified' => $this->_reified,
      'variance' => $this->_variance,
      'name' => $this->_name,
      'constraints' => $this->_constraints,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?vec<EditableNode> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $reified = $this->_reified->rewrite($rewriter, $parents);
    $variance = $this->_variance->rewrite($rewriter, $parents);
    $name = $this->_name->rewrite($rewriter, $parents);
    $constraints = $this->_constraints->rewrite($rewriter, $parents);
    if (
      $reified === $this->_reified &&
      $variance === $this->_variance &&
      $name === $this->_name &&
      $constraints === $this->_constraints
    ) {
      return $this;
    }
    return new static($reified, $variance, $name, $constraints);
  }

  public function getReifiedUNTYPED(): EditableNode {
    return $this->_reified;
  }

  public function withReified(EditableNode $value): this {
    if ($value === $this->_reified) {
      return $this;
    }
    return
      new static($value, $this->_variance, $this->_name, $this->_constraints);
  }

  public function hasReified(): bool {
    return !$this->_reified->isMissing();
  }

  /**
   * @return null | ReifiedToken
   */
  public function getReified(): ?ReifiedToken {
    if ($this->_reified->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(ReifiedToken::class, $this->_reified);
  }

  /**
   * @return ReifiedToken
   */
  public function getReifiedx(): ReifiedToken {
    return TypeAssert\instance_of(ReifiedToken::class, $this->_reified);
  }

  public function getVarianceUNTYPED(): EditableNode {
    return $this->_variance;
  }

  public function withVariance(EditableNode $value): this {
    if ($value === $this->_variance) {
      return $this;
    }
    return
      new static($this->_reified, $value, $this->_name, $this->_constraints);
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
    return new static($this->_reified, $this->_variance, $this->_name, $value);
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
