/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<75cd785db25deddda7ca08cb073d4e56>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class PocketMappingIdDeclaration extends EditableNode {

  private EditableNode $_name;
  private EditableNode $_initializer;

  public function __construct(
    EditableNode $name,
    EditableNode $initializer,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_name = $name;
    $this->_initializer = $initializer;
    parent::__construct('pocket_mapping_id_declaration', $source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
  ): this {
    $offset = $initial_offset;
    $name = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['pocket_mapping_id_name'],
      $file,
      $offset,
      $source,
    );
    $offset += $name->getWidth();
    $initializer = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['pocket_mapping_id_initializer'],
      $file,
      $offset,
      $source,
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
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'name' => $this->_name,
      'initializer' => $this->_initializer,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    vec<EditableNode> $parents = vec[],
  ): this {
    $parents[] = $this;
    $name = $this->_name->rewrite($rewriter, $parents);
    $initializer = $this->_initializer->rewrite($rewriter, $parents);
    if ($name === $this->_name && $initializer === $this->_initializer) {
      return $this;
    }
    return new static($name, $initializer);
  }

  public function getNameUNTYPED(): EditableNode {
    return $this->_name;
  }

  public function withName(EditableNode $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new static($value, $this->_initializer);
  }

  public function hasName(): bool {
    return !$this->_name->isMissing();
  }

  /**
   * @return unknown
   */
  public function getName(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_name);
  }

  /**
   * @return unknown
   */
  public function getNamex(): EditableNode {
    return $this->getName();
  }

  public function getInitializerUNTYPED(): EditableNode {
    return $this->_initializer;
  }

  public function withInitializer(EditableNode $value): this {
    if ($value === $this->_initializer) {
      return $this;
    }
    return new static($this->_name, $value);
  }

  public function hasInitializer(): bool {
    return !$this->_initializer->isMissing();
  }

  /**
   * @return unknown
   */
  public function getInitializer(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_initializer);
  }

  /**
   * @return unknown
   */
  public function getInitializerx(): EditableNode {
    return $this->getInitializer();
  }
}
