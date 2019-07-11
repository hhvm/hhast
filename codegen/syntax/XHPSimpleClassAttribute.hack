/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<5b17cf12fe82fbdcb29e763cb0dd228f>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class XHPSimpleClassAttribute extends Node {

  const string SYNTAX_KIND = 'xhp_simple_class_attribute';

  private SimpleTypeSpecifier $_type;

  public function __construct(
    SimpleTypeSpecifier $type,
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
    $type = $type as nonnull;
    $offset += $type->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(/* HH_IGNORE_ERROR[4110] */ $type, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'type' => $this->_type,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $type = $rewriter($this->_type, $parents);
    if ($type === $this->_type) {
      return $this;
    }
    return new static(/* HH_FIXME[4110] use `as` */ $type);
  }

  public function getTypeUNTYPED(): ?Node {
    return $this->_type;
  }

  public function withType(SimpleTypeSpecifier $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return new static($value);
  }

  public function hasType(): bool {
    return $this->_type !== null;
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
