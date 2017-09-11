<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<22cf903095d5da13920658f615c64202>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class SoftTypeSpecifier extends EditableSyntax {

  private EditableSyntax $_at;
  private EditableSyntax $_type;

  public function __construct(EditableSyntax $at, EditableSyntax $type) {
    parent::__construct('soft_type_specifier');
    $this->_at = $at;
    $this->_type = $type;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $at = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['soft_at'],
      $position,
      $source,
    );
    $position += $at->width();
    $type = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['soft_type'],
      $position,
      $source,
    );
    $position += $type->width();
    return new self($at, $type);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'at' => $this->_at;
    yield 'type' => $this->_type;
  }

  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $at = $this->_at->rewrite($rewriter, $parents);
    $type = $this->_type->rewrite($rewriter, $parents);
    if (
      $at === $this->_at &&
      $type === $this->_type
    ) {
      return $this;
    }
    return new self($at, $type);
  }

  public function raw_at(): EditableSyntax {
    return $this->_at;
  }

  public function with_at(EditableSyntax $value): this {
    if ($value === $this->_at) {
      return $this;
    }
    return new self($value, $this->_type);
  }

  public function at(): AtToken {
    return TypeAssert::isInstanceOf(AtToken::class, $this->_at);
  }

  public function raw_type(): EditableSyntax {
    return $this->_type;
  }

  public function with_type(EditableSyntax $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return new self($this->_at, $value);
  }

  public function type(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_type);
  }
}
