/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<f2c4f7b6b53ef8f0a861470c80921b08>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class PocketMappingIdDeclaration extends Node {

  const string SYNTAX_KIND = 'pocket_mapping_id_declaration';

  private ?Node $_name;
  private ?Node $_initializer;

  public function __construct(
    ?Node $name,
    ?Node $initializer,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_name = $name;
    $this->_initializer = $initializer;
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
    $name = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['pocket_mapping_id_name'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $name?->getWidth() ?? 0;
    $initializer = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['pocket_mapping_id_initializer'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $initializer?->getWidth() ?? 0;
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $name,
      /* HH_IGNORE_ERROR[4110] */ $initializer,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'name' => $this->_name,
      'initializer' => $this->_initializer,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $name = $this->_name === null ? null : $rewriter($this->_name, $parents);
    $initializer = $this->_initializer === null
      ? null
      : $rewriter($this->_initializer, $parents);
    if ($name === $this->_name && $initializer === $this->_initializer) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $name,
      /* HH_FIXME[4110] use `as` */ $initializer,
    );
  }

  public function getNameUNTYPED(): ?Node {
    return $this->_name;
  }

  public function withName(?Node $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new static($value, $this->_initializer);
  }

  public function hasName(): bool {
    return $this->_name !== null;
  }

  /**
   * @return unknown
   */
  public function getName(): ?Node {
    return $this->_name;
  }

  /**
   * @return unknown
   */
  public function getNamex(): Node {
    return TypeAssert\not_null($this->getName());
  }

  public function getInitializerUNTYPED(): ?Node {
    return $this->_initializer;
  }

  public function withInitializer(?Node $value): this {
    if ($value === $this->_initializer) {
      return $this;
    }
    return new static($this->_name, $value);
  }

  public function hasInitializer(): bool {
    return $this->_initializer !== null;
  }

  /**
   * @return unknown
   */
  public function getInitializer(): ?Node {
    return $this->_initializer;
  }

  /**
   * @return unknown
   */
  public function getInitializerx(): Node {
    return TypeAssert\not_null($this->getInitializer());
  }
}
