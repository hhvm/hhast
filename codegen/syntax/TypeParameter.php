<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<1f525f216c8e7423b7505a199214246f>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class TypeParameter extends EditableSyntax {

  private EditableSyntax $_variance;
  private EditableSyntax $_name;
  private EditableSyntax $_constraints;

  public function __construct(
    EditableSyntax $variance,
    EditableSyntax $name,
    EditableSyntax $constraints,
  ) {
    parent::__construct('type_parameter');
    $this->_variance = $variance;
    $this->_name = $name;
    $this->_constraints = $constraints;
  }

  <<__Override>>
  public static function fromJSON(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $variance = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['type_variance'],
      $position,
      $source,
    );
    $position += $variance->getWidth();
    $name = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['type_name'],
      $position,
      $source,
    );
    $position += $name->getWidth();
    $constraints = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['type_constraints'],
      $position,
      $source,
    );
    $position += $constraints->getWidth();
    return new self($variance, $name, $constraints);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'variance' => $this->_variance;
    yield 'name' => $this->_name;
    yield 'constraints' => $this->_constraints;
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $variance = $this->_variance->rewrite($rewriter, $parents);
    $name = $this->_name->rewrite($rewriter, $parents);
    $constraints = $this->_constraints->rewrite($rewriter, $parents);
    if (
      $variance === $this->_variance &&
      $name === $this->_name &&
      $constraints === $this->_constraints
    ) {
      return $this;
    }
    return new self($variance, $name, $constraints);
  }

  public function getVarianceUNTYPED(): EditableSyntax {
    return $this->_variance;
  }

  public function withVariance(EditableSyntax $value): this {
    if ($value === $this->_variance) {
      return $this;
    }
    return new self($value, $this->_name, $this->_constraints);
  }

  public function hasVariance(): bool {
    return !$this->_variance->isMissing();
  }

  public function getVariance(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_variance);
  }

  public function getNameUNTYPED(): EditableSyntax {
    return $this->_name;
  }

  public function withName(EditableSyntax $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new self($this->_variance, $value, $this->_constraints);
  }

  public function hasName(): bool {
    return !$this->_name->isMissing();
  }

  public function getName(): NameToken {
    return TypeAssert::isInstanceOf(NameToken::class, $this->_name);
  }

  public function getConstraintsUNTYPED(): EditableSyntax {
    return $this->_constraints;
  }

  public function withConstraints(EditableSyntax $value): this {
    if ($value === $this->_constraints) {
      return $this;
    }
    return new self($this->_variance, $this->_name, $value);
  }

  public function hasConstraints(): bool {
    return !$this->_constraints->isMissing();
  }

  public function getConstraints(): ?EditableList {
    if ($this->_constraints->isMissing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(EditableList::class, $this->_constraints);
  }

  public function getConstraintsx(): EditableList {
    return TypeAssert::isInstanceOf(EditableList::class, $this->_constraints);
  }
}
