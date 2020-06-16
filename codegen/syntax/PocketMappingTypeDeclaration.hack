/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<32b21b8fc7d731f1d41dc20cc2669256>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class PocketMappingTypeDeclaration extends Node {

  const string SYNTAX_KIND = 'pocket_mapping_type_declaration';

  private ?Node $_keyword;
  private ?Node $_name;
  private ?Node $_equal;
  private ?Node $_type;

  public function __construct(
    ?Node $keyword,
    ?Node $name,
    ?Node $equal,
    ?Node $type,
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
    string $_type_hint,
  ): this {
    $offset = $initial_offset;
    $keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['pocket_mapping_type_keyword'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $keyword?->getWidth() ?? 0;
    $name = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['pocket_mapping_type_name'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $name?->getWidth() ?? 0;
    $equal = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['pocket_mapping_type_equal'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $equal?->getWidth() ?? 0;
    $type = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['pocket_mapping_type_type'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $type?->getWidth() ?? 0;
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $keyword,
      /* HH_IGNORE_ERROR[4110] */ $name,
      /* HH_IGNORE_ERROR[4110] */ $equal,
      /* HH_IGNORE_ERROR[4110] */ $type,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'keyword' => $this->_keyword,
      'name' => $this->_name,
      'equal' => $this->_equal,
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
    $keyword = $this->_keyword === null
      ? null
      : $rewriter($this->_keyword, $parents);
    $name = $this->_name === null ? null : $rewriter($this->_name, $parents);
    $equal = $this->_equal === null ? null : $rewriter($this->_equal, $parents);
    $type = $this->_type === null ? null : $rewriter($this->_type, $parents);
    if (
      $keyword === $this->_keyword &&
      $name === $this->_name &&
      $equal === $this->_equal &&
      $type === $this->_type
    ) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $keyword,
      /* HH_FIXME[4110] use `as` */ $name,
      /* HH_FIXME[4110] use `as` */ $equal,
      /* HH_FIXME[4110] use `as` */ $type,
    );
  }

  public function getKeywordUNTYPED(): ?Node {
    return $this->_keyword;
  }

  public function withKeyword(?Node $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static($value, $this->_name, $this->_equal, $this->_type);
  }

  public function hasKeyword(): bool {
    return $this->_keyword !== null;
  }

  /**
   * @return unknown
   */
  public function getKeyword(): ?Node {
    return $this->_keyword;
  }

  /**
   * @return unknown
   */
  public function getKeywordx(): Node {
    return TypeAssert\not_null($this->getKeyword());
  }

  public function getNameUNTYPED(): ?Node {
    return $this->_name;
  }

  public function withName(?Node $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new static($this->_keyword, $value, $this->_equal, $this->_type);
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

  public function getEqualUNTYPED(): ?Node {
    return $this->_equal;
  }

  public function withEqual(?Node $value): this {
    if ($value === $this->_equal) {
      return $this;
    }
    return new static($this->_keyword, $this->_name, $value, $this->_type);
  }

  public function hasEqual(): bool {
    return $this->_equal !== null;
  }

  /**
   * @return unknown
   */
  public function getEqual(): ?Node {
    return $this->_equal;
  }

  /**
   * @return unknown
   */
  public function getEqualx(): Node {
    return TypeAssert\not_null($this->getEqual());
  }

  public function getTypeUNTYPED(): ?Node {
    return $this->_type;
  }

  public function withType(?Node $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return new static($this->_keyword, $this->_name, $this->_equal, $value);
  }

  public function hasType(): bool {
    return $this->_type !== null;
  }

  /**
   * @return unknown
   */
  public function getType(): ?Node {
    return $this->_type;
  }

  /**
   * @return unknown
   */
  public function getTypex(): Node {
    return TypeAssert\not_null($this->getType());
  }
}
