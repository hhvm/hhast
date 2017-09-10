<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<e5100102e784908cda0f832c81cdd668>>
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

  public function variance(): EditableSyntax {
    return $this->variancex();
  }

  public function variancex(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_variance);
  }

  public function raw_variance(): EditableSyntax {
    return $this->_variance;
  }

  public function with_variance(EditableSyntax $value): this {
    return new self($value, $this->_name, $this->_constraints);
  }

  public function name(): NameToken {
    return $this->namex();
  }

  public function namex(): NameToken {
    return TypeAssert::isInstanceOf(NameToken::class, $this->_name);
  }

  public function raw_name(): EditableSyntax {
    return $this->_name;
  }

  public function with_name(EditableSyntax $value): this {
    return new self($this->_variance, $value, $this->_constraints);
  }

  public function constraints(): ?EditableList {
    return $this->_constraints->is_missing() ? null : TypeAssert::isInstanceOf(EditableList::class, $this->_constraints);
  }

  public function constraintsx(): EditableList {
    return TypeAssert::isInstanceOf(EditableList::class, $this->_constraints);
  }

  public function raw_constraints(): EditableSyntax {
    return $this->_constraints;
  }

  public function with_constraints(EditableSyntax $value): this {
    return new self($this->_variance, $this->_name, $value);
  }
}
