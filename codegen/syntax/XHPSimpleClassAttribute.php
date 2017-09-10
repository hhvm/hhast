<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<43d58359b23728a8fe69290e8f367c2a>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class XHPSimpleClassAttribute extends EditableSyntax {

  private EditableSyntax $_type;

  public function __construct(EditableSyntax $type) {
    parent::__construct('xhp_simple_class_attribute');
    $this->_type = $type;
  }

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

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'type' => $this->_type;
  }

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

  public function type(): SimpleTypeSpecifier {
    return $this->typex();
  }

  public function typex(): SimpleTypeSpecifier {
    return TypeAssert::isInstanceOf(SimpleTypeSpecifier::class, $this->_type);
  }

  public function raw_type(): EditableSyntax {
    return $this->_type;
  }

  public function with_type(EditableSyntax $value): this {
    return new self($value);
  }
}
