<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<45cd1cfd96be34ec50d070b706fea206>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class XHPSimpleClassAttribute extends EditableSyntax {

  private EditableSyntax $_type;

  public function __construct(EditableSyntax $type) {
    parent::__construct('xhp_simple_class_attribute');
    $this->_type = $type;
  }

  <<__Override>>
  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $type = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['xhp_simple_class_attribute_type'],
      $position,
      $source,
    );
    $position += $type->width();
    return new self($type);
  }

  <<__Override>>
  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'type' => $this->_type;
  }

  <<__Override>>
  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $type = $this->_type->rewrite($rewriter, $parents);
    if (
      $type === $this->_type
    ) {
      return $this;
    }
    return new self($type);
  }

  public function getTypeUNTYPED(): EditableSyntax {
    return $this->_type;
  }

  public function withType(EditableSyntax $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return new self($value);
  }

  public function hasType(): bool {
    return !$this->_type->is_missing();
  }

  public function getType(): SimpleTypeSpecifier {
    return TypeAssert::isInstanceOf(SimpleTypeSpecifier::class, $this->_type);
  }
}
