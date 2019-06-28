/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<9579ac4ca733b4f254b9aed7c684dd17>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class XHPSimpleClassAttribute extends Node {

  const string SYNTAX_KIND = 'xhp_simple_class_attribute';

  private Node $_type;

  public function __construct(
    Node $type,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_type = $type;
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
    $type = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['xhp_simple_class_attribute_type'],
      $file,
      $offset,
      $source,
      'SimpleTypeSpecifier',
    );
    $offset += $type->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static($type, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'type' => $this->_type,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $type = $rewriter($this->_type, $parents);
    if ($type === $this->_type) {
      return $this;
    }
    return new static($type);
  }

  public function getTypeUNTYPED(): Node {
    return $this->_type;
  }

  public function withType(SimpleTypeSpecifier $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return new static($value ?? Missing());
  }

  public function hasType(): bool {
    return !$this->_type->isMissing();
  }

  /**
   * @return SimpleTypeSpecifier
   */
  public function getType(): SimpleTypeSpecifier {
    return TypeAssert\instance_of(SimpleTypeSpecifier::class, $this->_type);
  }

  /**
   * @return SimpleTypeSpecifier
   */
  public function getTypex(): SimpleTypeSpecifier {
    return $this->getType();
  }
}
