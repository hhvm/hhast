/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<1d1090749d73abe156e1ceaae85fe614>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class RecordDeclaration extends Node {

  const string SYNTAX_KIND = 'record_declaration';

  private Node $_attribute_spec;
  private Node $_keyword;
  private Node $_name;
  private Node $_left_brace;
  private Node $_fields;
  private Node $_right_brace;

  public function __construct(
    Node $attribute_spec,
    Node $keyword,
    Node $name,
    Node $left_brace,
    Node $fields,
    Node $right_brace,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_attribute_spec = $attribute_spec;
    $this->_keyword = $keyword;
    $this->_name = $name;
    $this->_left_brace = $left_brace;
    $this->_fields = $fields;
    $this->_right_brace = $right_brace;
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
    $attribute_spec = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['record_attribute_spec'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $attribute_spec->getWidth();
    $keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['record_keyword'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $keyword->getWidth();
    $name = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['record_name'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $name->getWidth();
    $left_brace = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['record_left_brace'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $left_brace->getWidth();
    $fields = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['record_fields'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $fields->getWidth();
    $right_brace = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['record_right_brace'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $right_brace->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      $attribute_spec,
      $keyword,
      $name,
      $left_brace,
      $fields,
      $right_brace,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'attribute_spec' => $this->_attribute_spec,
      'keyword' => $this->_keyword,
      'name' => $this->_name,
      'left_brace' => $this->_left_brace,
      'fields' => $this->_fields,
      'right_brace' => $this->_right_brace,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $attribute_spec = $rewriter($this->_attribute_spec, $parents);
    $keyword = $rewriter($this->_keyword, $parents);
    $name = $rewriter($this->_name, $parents);
    $left_brace = $rewriter($this->_left_brace, $parents);
    $fields = $rewriter($this->_fields, $parents);
    $right_brace = $rewriter($this->_right_brace, $parents);
    if (
      $attribute_spec === $this->_attribute_spec &&
      $keyword === $this->_keyword &&
      $name === $this->_name &&
      $left_brace === $this->_left_brace &&
      $fields === $this->_fields &&
      $right_brace === $this->_right_brace
    ) {
      return $this;
    }
    return new static(
      $attribute_spec,
      $keyword,
      $name,
      $left_brace,
      $fields,
      $right_brace,
    );
  }

  public function getAttributeSpecUNTYPED(): Node {
    return $this->_attribute_spec;
  }

  public function withAttributeSpec(Node $value): this {
    if ($value === $this->_attribute_spec) {
      return $this;
    }
    return new static(
      $value,
      $this->_keyword,
      $this->_name,
      $this->_left_brace,
      $this->_fields,
      $this->_right_brace,
    );
  }

  public function hasAttributeSpec(): bool {
    return !$this->_attribute_spec->isMissing();
  }

  /**
   * @return
   */
  public function getAttributeSpec(): Node {
    return $this->_attribute_spec;
  }

  /**
   * @return
   */
  public function getAttributeSpecx(): Node {
    return $this->getAttributeSpec();
  }

  public function getKeywordUNTYPED(): Node {
    return $this->_keyword;
  }

  public function withKeyword(Node $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $value,
      $this->_name,
      $this->_left_brace,
      $this->_fields,
      $this->_right_brace,
    );
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  /**
   * @return
   */
  public function getKeyword(): Node {
    return $this->_keyword;
  }

  /**
   * @return
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
    return new static(
      $this->_attribute_spec,
      $this->_keyword,
      $value,
      $this->_left_brace,
      $this->_fields,
      $this->_right_brace,
    );
  }

  public function hasName(): bool {
    return !$this->_name->isMissing();
  }

  /**
   * @return
   */
  public function getName(): Node {
    return $this->_name;
  }

  /**
   * @return
   */
  public function getNamex(): Node {
    return $this->getName();
  }

  public function getLeftBraceUNTYPED(): Node {
    return $this->_left_brace;
  }

  public function withLeftBrace(Node $value): this {
    if ($value === $this->_left_brace) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_keyword,
      $this->_name,
      $value,
      $this->_fields,
      $this->_right_brace,
    );
  }

  public function hasLeftBrace(): bool {
    return !$this->_left_brace->isMissing();
  }

  /**
   * @return
   */
  public function getLeftBrace(): Node {
    return $this->_left_brace;
  }

  /**
   * @return
   */
  public function getLeftBracex(): Node {
    return $this->getLeftBrace();
  }

  public function getFieldsUNTYPED(): Node {
    return $this->_fields;
  }

  public function withFields(Node $value): this {
    if ($value === $this->_fields) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_keyword,
      $this->_name,
      $this->_left_brace,
      $value,
      $this->_right_brace,
    );
  }

  public function hasFields(): bool {
    return !$this->_fields->isMissing();
  }

  /**
   * @return
   */
  public function getFields(): Node {
    return $this->_fields;
  }

  /**
   * @return
   */
  public function getFieldsx(): Node {
    return $this->getFields();
  }

  public function getRightBraceUNTYPED(): Node {
    return $this->_right_brace;
  }

  public function withRightBrace(Node $value): this {
    if ($value === $this->_right_brace) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_keyword,
      $this->_name,
      $this->_left_brace,
      $this->_fields,
      $value,
    );
  }

  public function hasRightBrace(): bool {
    return !$this->_right_brace->isMissing();
  }

  /**
   * @return
   */
  public function getRightBrace(): Node {
    return $this->_right_brace;
  }

  /**
   * @return
   */
  public function getRightBracex(): Node {
    return $this->getRightBrace();
  }
}
