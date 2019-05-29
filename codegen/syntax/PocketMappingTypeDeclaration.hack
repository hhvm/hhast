/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<650e45924bd4b6bb6c7b67d572eefe32>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class PocketMappingTypeDeclaration extends Node {

  const string SYNTAX_KIND = 'pocket_mapping_type_declaration';

  private Node $_keyword;
  private Node $_name;
  private Node $_equal;
  private Node $_type;

  public function __construct(
    Node $keyword,
    Node $name,
    Node $equal,
    Node $type,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_keyword = $keyword;
    $this->_name = $name;
    $this->_equal = $equal;
    $this->_type = $type;
    parent::__construct($source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
  ): this {
    $offset = $initial_offset;
    $keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['pocket_mapping_type_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $keyword->getWidth();
    $name = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['pocket_mapping_type_name'],
      $file,
      $offset,
      $source,
    );
    $offset += $name->getWidth();
    $equal = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['pocket_mapping_type_equal'],
      $file,
      $offset,
      $source,
    );
    $offset += $equal->getWidth();
    $type = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['pocket_mapping_type_type'],
      $file,
      $offset,
      $source,
    );
    $offset += $type->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static($keyword, $name, $equal, $type, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'keyword' => $this->_keyword,
      'name' => $this->_name,
      'equal' => $this->_equal,
      'type' => $this->_type,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $keyword = $rewriter($this->_keyword, $parents);
    $name = $rewriter($this->_name, $parents);
    $equal = $rewriter($this->_equal, $parents);
    $type = $rewriter($this->_type, $parents);
    if (
      $keyword === $this->_keyword &&
      $name === $this->_name &&
      $equal === $this->_equal &&
      $type === $this->_type
    ) {
      return $this;
    }
    return new static($keyword, $name, $equal, $type);
  }

  public function getKeywordUNTYPED(): Node {
    return $this->_keyword;
  }

  public function withKeyword(Node $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static($value, $this->_name, $this->_equal, $this->_type);
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  /**
   * @return unknown
   */
  public function getKeyword(): Node {
    return $this->_keyword;
  }

  /**
   * @return unknown
   */
  public function getKeywordx(): Node {
    return $this->getKeyword();
  }

  public function getNameUNTYPED(): Node {
    return $this->_name;
  }

  public function withName(Node $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new static($this->_keyword, $value, $this->_equal, $this->_type);
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

  public function getEqualUNTYPED(): Node {
    return $this->_equal;
  }

  public function withEqual(Node $value): this {
    if ($value === $this->_equal) {
      return $this;
    }
    return new static($this->_keyword, $this->_name, $value, $this->_type);
  }

  public function hasEqual(): bool {
    return !$this->_equal->isMissing();
  }

  /**
   * @return unknown
   */
  public function getEqual(): Node {
    return $this->_equal;
  }

  /**
   * @return unknown
   */
  public function getEqualx(): Node {
    return $this->getEqual();
  }

  public function getTypeUNTYPED(): Node {
    return $this->_type;
  }

  public function withType(Node $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return new static($this->_keyword, $this->_name, $this->_equal, $value);
  }

  public function hasType(): bool {
    return !$this->_type->isMissing();
  }

  /**
   * @return unknown
   */
  public function getType(): Node {
    return $this->_type;
  }

  /**
   * @return unknown
   */
  public function getTypex(): Node {
    return $this->getType();
  }
}
