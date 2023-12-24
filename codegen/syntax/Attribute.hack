/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<9bb2fa9544ee9459f94610f89d0157fb>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;
/* HHAST_IGNORE_ALL[5607] 5607 is ignored because of false positives when comparing a generic to a typed value */
/* HHAST_IGNORE_ALL[5624] HHAST_IGNORE_ALL[5639] 5624 and 5639 are ignored because they insist on using co(tra)variant generics. Could this break external consumers? */

<<__ConsistentConstruct>>
final class Attribute extends Node {

  const string SYNTAX_KIND = 'attribute';

  private ?Node $_at;
  private ?Node $_attribute_name;

  public function __construct(
    ?Node $at,
    ?Node $attribute_name,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_at = $at;
    $this->_attribute_name = $attribute_name;
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
    $at = Node::fromJSON(
      ($json['attribute_at'] ?? dict['kind' => 'missing']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $at?->getWidth() ?? 0;
    $attribute_name = Node::fromJSON(
      ($json['attribute_attribute_name'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $attribute_name?->getWidth() ?? 0;
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static($at, $attribute_name, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'at' => $this->_at,
      'attribute_name' => $this->_attribute_name,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $at = $this->_at === null ? null : $rewriter($this->_at, $parents);
    $attribute_name = $this->_attribute_name === null
      ? null
      : $rewriter($this->_attribute_name, $parents);
    if ($at === $this->_at && $attribute_name === $this->_attribute_name) {
      return $this;
    }
    return new static($at as ?Node, $attribute_name as ?Node);
  }

  public function getAtUNTYPED(): ?Node {
    return $this->_at;
  }

  public function withAt(?Node $value): this {
    if ($value === $this->_at) {
      return $this;
    }
    return new static($value, $this->_attribute_name);
  }

  public function hasAt(): bool {
    return $this->_at !== null;
  }

  /**
   * @return unknown
   */
  public function getAt(): ?Node {
    return $this->_at;
  }

  /**
   * @return unknown
   */
  public function getAtx(): Node {
    return TypeAssert\not_null($this->getAt());
  }

  public function getAttributeNameUNTYPED(): ?Node {
    return $this->_attribute_name;
  }

  public function withAttributeName(?Node $value): this {
    if ($value === $this->_attribute_name) {
      return $this;
    }
    return new static($this->_at, $value);
  }

  public function hasAttributeName(): bool {
    return $this->_attribute_name !== null;
  }

  /**
   * @return unknown
   */
  public function getAttributeName(): ?Node {
    return $this->_attribute_name;
  }

  /**
   * @return unknown
   */
  public function getAttributeNamex(): Node {
    return TypeAssert\not_null($this->getAttributeName());
  }
}
