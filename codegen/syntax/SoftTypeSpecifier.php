<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<4ec32a8c4936c5fbfc3bca3b6be3d32e>>
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

  <<__Override>>
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

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'at' => $this->_at;
    yield 'type' => $this->_type;
  }

  <<__Override>>
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

  public function getAtUNTYPED(): EditableSyntax {
    return $this->_at;
  }

  public function withAt(EditableSyntax $value): this {
    if ($value === $this->_at) {
      return $this;
    }
    return new self($value, $this->_type);
  }

  public function hasAt(): bool {
    return !$this->_at->is_missing();
  }

  public function getAt(): AtToken {
    return TypeAssert::isInstanceOf(AtToken::class, $this->_at);
  }

  public function getTypeUNTYPED(): EditableSyntax {
    return $this->_type;
  }

  public function withType(EditableSyntax $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return new self($this->_at, $value);
  }

  public function hasType(): bool {
    return !$this->_type->is_missing();
  }

  public function getType(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_type);
  }
}
