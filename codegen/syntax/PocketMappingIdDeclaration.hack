/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<66a46253f5421c0cec24d1d5d8edbd45>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class PocketMappingIdDeclaration extends Node {

  const string SYNTAX_KIND = 'pocket_mapping_id_declaration';

  private Node $_name;
  private Node $_initializer;

  public function __construct(
    Node $name,
    Node $initializer,
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
      /* HH_FIXME[4110] */ $json['pocket_mapping_id_name'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $name->getWidth();
    $initializer = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['pocket_mapping_id_initializer'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $initializer->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static($name, $initializer, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'name' => $this->_name,
      'initializer' => $this->_initializer,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $name = $rewriter($this->_name, $parents);
    $initializer = $rewriter($this->_initializer, $parents);
    if ($name === $this->_name && $initializer === $this->_initializer) {
      return $this;
    }
    return new static($name, $initializer);
  }

  public function getNameUNTYPED(): Node {
    return $this->_name;
  }

  public function withName(Node $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new static($value ?? Missing(), $this->_initializer);
  }

  public function hasName(): bool {
    return !$this->_name->isMissing();
  }

  /**
   * @return unknown
   */
  public function getName(): Node {
    return $this->_name;
  }

  /**
   * @return unknown
   */
  public function getNamex(): Node {
    return $this->getName();
  }

  public function getInitializerUNTYPED(): Node {
    return $this->_initializer;
  }

  public function withInitializer(Node $value): this {
    if ($value === $this->_initializer) {
      return $this;
    }
    return new static($this->_name, $value ?? Missing());
  }

  public function hasInitializer(): bool {
    return !$this->_initializer->isMissing();
  }

  /**
   * @return unknown
   */
  public function getInitializer(): Node {
    return $this->_initializer;
  }

  /**
   * @return unknown
   */
  public function getInitializerx(): Node {
    return $this->getInitializer();
  }
}
