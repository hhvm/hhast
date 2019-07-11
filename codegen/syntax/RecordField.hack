/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<7b0fa20b1789e212beb66ba242cea713>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class RecordField extends Node {

  const string SYNTAX_KIND = 'record_field';

  private Node $_name;
  private Node $_colon;
  private Node $_type;
  private Node $_init;
  private Node $_comma;

  public function __construct(
    Node $name,
    Node $colon,
    Node $type,
    Node $init,
    Node $comma,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_name = $name;
    $this->_colon = $colon;
    $this->_type = $type;
    $this->_init = $init;
    $this->_comma = $comma;
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
      /* HH_FIXME[4110] */ $json['record_field_name'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $name = $name as nonnull;
    $offset += $name->getWidth();
    $colon = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['record_field_colon'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $colon = $colon as nonnull;
    $offset += $colon->getWidth();
    $type = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['record_field_type'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $type = $type as nonnull;
    $offset += $type->getWidth();
    $init = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['record_field_init'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $init = $init as nonnull;
    $offset += $init->getWidth();
    $comma = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['record_field_comma'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $comma = $comma as nonnull;
    $offset += $comma->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $name,
      /* HH_IGNORE_ERROR[4110] */ $colon,
      /* HH_IGNORE_ERROR[4110] */ $type,
      /* HH_IGNORE_ERROR[4110] */ $init,
      /* HH_IGNORE_ERROR[4110] */ $comma,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'name' => $this->_name,
      'colon' => $this->_colon,
      'type' => $this->_type,
      'init' => $this->_init,
      'comma' => $this->_comma,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $name = $rewriter($this->_name, $parents);
    $colon = $rewriter($this->_colon, $parents);
    $type = $rewriter($this->_type, $parents);
    $init = $rewriter($this->_init, $parents);
    $comma = $rewriter($this->_comma, $parents);
    if (
      $name === $this->_name &&
      $colon === $this->_colon &&
      $type === $this->_type &&
      $init === $this->_init &&
      $comma === $this->_comma
    ) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $name,
      /* HH_FIXME[4110] use `as` */ $colon,
      /* HH_FIXME[4110] use `as` */ $type,
      /* HH_FIXME[4110] use `as` */ $init,
      /* HH_FIXME[4110] use `as` */ $comma,
    );
  }

  public function getNameUNTYPED(): ?Node {
    return $this->_name;
  }

  public function withName(Node $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new static(
      $value,
      $this->_colon,
      $this->_type,
      $this->_init,
      $this->_comma,
    );
  }

  public function hasName(): bool {
    return $this->_name !== null;
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

  public function getColonUNTYPED(): ?Node {
    return $this->_colon;
  }

  public function withColon(Node $value): this {
    if ($value === $this->_colon) {
      return $this;
    }
    return new static(
      $this->_name,
      $value,
      $this->_type,
      $this->_init,
      $this->_comma,
    );
  }

  public function hasColon(): bool {
    return $this->_colon !== null;
  }

  /**
   * @return
   */
  public function getColon(): Node {
    return $this->_colon;
  }

  /**
   * @return
   */
  public function getColonx(): Node {
    return $this->getColon();
  }

  public function getTypeUNTYPED(): ?Node {
    return $this->_type;
  }

  public function withType(Node $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return new static(
      $this->_name,
      $this->_colon,
      $value,
      $this->_init,
      $this->_comma,
    );
  }

  public function hasType(): bool {
    return $this->_type !== null;
  }

  /**
   * @return
   */
  public function getType(): Node {
    return $this->_type;
  }

  /**
   * @return
   */
  public function getTypex(): Node {
    return $this->getType();
  }

  public function getInitUNTYPED(): ?Node {
    return $this->_init;
  }

  public function withInit(Node $value): this {
    if ($value === $this->_init) {
      return $this;
    }
    return new static(
      $this->_name,
      $this->_colon,
      $this->_type,
      $value,
      $this->_comma,
    );
  }

  public function hasInit(): bool {
    return $this->_init !== null;
  }

  /**
   * @return
   */
  public function getInit(): Node {
    return $this->_init;
  }

  /**
   * @return
   */
  public function getInitx(): Node {
    return $this->getInit();
  }

  public function getCommaUNTYPED(): ?Node {
    return $this->_comma;
  }

  public function withComma(Node $value): this {
    if ($value === $this->_comma) {
      return $this;
    }
    return new static(
      $this->_name,
      $this->_colon,
      $this->_type,
      $this->_init,
      $value,
    );
  }

  public function hasComma(): bool {
    return $this->_comma !== null;
  }

  /**
   * @return
   */
  public function getComma(): Node {
    return $this->_comma;
  }

  /**
   * @return
   */
  public function getCommax(): Node {
    return $this->getComma();
  }
}
