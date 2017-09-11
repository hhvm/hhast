<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<a1dbc30686bf9c788ce996f2245de71a>>
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

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $variance = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['type_variance'],
      $position,
      $source,
    );
    $position += $variance->width();
    $name = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['type_name'],
      $position,
      $source,
    );
    $position += $name->width();
    $constraints = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['type_constraints'],
      $position,
      $source,
    );
    $position += $constraints->width();
    return new self($variance, $name, $constraints);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'variance' => $this->_variance;
    yield 'name' => $this->_name;
    yield 'constraints' => $this->_constraints;
  }

  public function rewrite_children(
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

  public function raw_variance(): EditableSyntax {
    return $this->_variance;
  }

  public function with_variance(EditableSyntax $value): this {
    if ($value === $this->_variance) {
      return $this;
    }
    return new self($value, $this->_name, $this->_constraints);
  }

  public function hasVariance(): bool {
    return !$this->_variance->is_missing();
  }

  public function variance(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_variance);
  }

  public function raw_name(): EditableSyntax {
    return $this->_name;
  }

  public function with_name(EditableSyntax $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new self($this->_variance, $value, $this->_constraints);
  }

  public function hasName(): bool {
    return !$this->_name->is_missing();
  }

  public function name(): NameToken {
    return TypeAssert::isInstanceOf(NameToken::class, $this->_name);
  }

  public function raw_constraints(): EditableSyntax {
    return $this->_constraints;
  }

  public function with_constraints(EditableSyntax $value): this {
    if ($value === $this->_constraints) {
      return $this;
    }
    return new self($this->_variance, $this->_name, $value);
  }

  public function hasConstraints(): bool {
    return !$this->_constraints->is_missing();
  }

  public function constraints(): ?EditableList {
    if ($this->_constraints->is_missing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(EditableList::class, $this->_constraints);
  }

  public function constraintsx(): EditableList {
    return TypeAssert::isInstanceOf(EditableList::class, $this->_constraints);
  }
}
