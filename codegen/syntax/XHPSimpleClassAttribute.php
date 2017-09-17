<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<9a6c8aebb59ba40981697d2aef25fde0>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class XHPSimpleClassAttribute extends EditableSyntax {

  private EditableSyntax $_type;

  public function __construct(EditableSyntax $type) {
    parent::__construct('xhp_simple_class_attribute');
    $this->_type = $type;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $type = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['xhp_simple_class_attribute_type'],
      $position,
      $source,
    );
    $position += $type->getWidth();
    return new self($type);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'type' => $this->_type;
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $type = $this->_type->rewrite($rewriter, $parents);
    if ($type === $this->_type) {
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
    return !$this->_type->isMissing();
  }

  /**
   * @returns SimpleTypeSpecifier
   */
  public function getType(): SimpleTypeSpecifier {
    return TypeAssert\instance_of(SimpleTypeSpecifier::class, $this->_type);
  }
}
