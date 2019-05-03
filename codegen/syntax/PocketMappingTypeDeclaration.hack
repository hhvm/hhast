/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<7a2ef4ebb94e5306b72d9c92c8169dd3>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class PocketMappingTypeDeclaration extends EditableNode {

  private EditableNode $_keyword;
  private EditableNode $_name;
  private EditableNode $_equal;
  private EditableNode $_type;

  public function __construct(
    EditableNode $keyword,
    EditableNode $name,
    EditableNode $equal,
    EditableNode $type,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_keyword = $keyword;
    $this->_name = $name;
    $this->_equal = $equal;
    $this->_type = $type;
    parent::__construct('pocket_mapping_type_declaration', $source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
  ): this {
    $offset = $initial_offset;
    $keyword = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['pocket_mapping_type_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $keyword->getWidth();
    $name = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['pocket_mapping_type_name'],
      $file,
      $offset,
      $source,
    );
    $offset += $name->getWidth();
    $equal = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['pocket_mapping_type_equal'],
      $file,
      $offset,
      $source,
    );
    $offset += $equal->getWidth();
    $type = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['pocket_mapping_type_type'],
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
  public function getChildren(): dict<string, EditableNode> {
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
    vec<EditableNode> $parents = vec[],
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

  public function getKeywordUNTYPED(): EditableNode {
    return $this->_keyword;
  }

  public function withKeyword(EditableNode $value): this {
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
  public function getKeyword(): EditableNode {
    return $this->_keyword;
  }

  /**
   * @return unknown
   */
  public function getKeywordx(): EditableNode {
    return $this->getKeyword();
  }

  public function getNameUNTYPED(): EditableNode {
    return $this->_name;
  }

  public function withName(EditableNode $value): this {
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
  public function getName(): EditableNode {
    return $this->_name;
  }

  /**
   * @return unknown
   */
  public function getNamex(): EditableNode {
    return $this->getName();
  }

  public function getEqualUNTYPED(): EditableNode {
    return $this->_equal;
  }

  public function withEqual(EditableNode $value): this {
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
  public function getEqual(): EditableNode {
    return $this->_equal;
  }

  /**
   * @return unknown
   */
  public function getEqualx(): EditableNode {
    return $this->getEqual();
  }

  public function getTypeUNTYPED(): EditableNode {
    return $this->_type;
  }

  public function withType(EditableNode $value): this {
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
  public function getType(): EditableNode {
    return $this->_type;
  }

  /**
   * @return unknown
   */
  public function getTypex(): EditableNode {
    return $this->getType();
  }
}
