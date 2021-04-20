/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<b35a59fc06a7f71aedac4344a9684e92>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class AttributeSpecification extends Node {

  const string SYNTAX_KIND = 'attribute_specification';

  private ?Node $_attributes;

  public function __construct(
    ?Node $attributes,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_attributes = $attributes;
    parent::__construct($source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<arraykey, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
    string $_type_hint,
  ): this {
    $offset = $initial_offset;
    $attributes = Node::fromJSON(
      ($json['attribute_specification_attributes'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $attributes?->getWidth() ?? 0;
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(/* HH_IGNORE_ERROR[4110] */ $attributes, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'attributes' => $this->_attributes,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $attributes = $this->_attributes === null
      ? null
      : $rewriter($this->_attributes, $parents);
    if ($attributes === $this->_attributes) {
      return $this;
    }
    return new static($attributes as ?Node);
  }

  public function getAttributesUNTYPED(): ?Node {
    return $this->_attributes;
  }

  public function withAttributes(?Node $value): this {
    if ($value === $this->_attributes) {
      return $this;
    }
    return new static($value);
  }

  public function hasAttributes(): bool {
    return $this->_attributes !== null;
  }

  /**
   * @return unknown
   */
  public function getAttributes(): ?Node {
    return $this->_attributes;
  }

  /**
   * @return unknown
   */
  public function getAttributesx(): Node {
    return TypeAssert\not_null($this->getAttributes());
  }
}
