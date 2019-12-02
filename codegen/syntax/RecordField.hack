/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<6e68f4e3db924524fff85694b9b98ea9>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class RecordField extends Node {

  const string SYNTAX_KIND = 'record_field';

  private Node $_type;
  private Node $_name;
  private Node $_init;
  private Node $_semi;

  public function __construct(
    Node $type,
    Node $name,
    Node $init,
    Node $semi,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_type = $type;
    $this->_name = $name;
    $this->_init = $init;
    $this->_semi = $semi;
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
    $type = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['record_field_type'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $type = $type as nonnull;
    $offset += $type->getWidth();
    $name = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['record_field_name'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $name = $name as nonnull;
    $offset += $name->getWidth();
    $init = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['record_field_init'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $init = $init as nonnull;
    $offset += $init->getWidth();
    $semi = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['record_field_semi'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $semi = $semi as nonnull;
    $offset += $semi->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $type,
      /* HH_IGNORE_ERROR[4110] */ $name,
      /* HH_IGNORE_ERROR[4110] */ $init,
      /* HH_IGNORE_ERROR[4110] */ $semi,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'type' => $this->_type,
      'name' => $this->_name,
      'init' => $this->_init,
      'semi' => $this->_semi,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $type = $rewriter($this->_type, $parents);
    $name = $rewriter($this->_name, $parents);
    $init = $rewriter($this->_init, $parents);
    $semi = $rewriter($this->_semi, $parents);
    if (
      $type === $this->_type &&
      $name === $this->_name &&
      $init === $this->_init &&
      $semi === $this->_semi
    ) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $type,
      /* HH_FIXME[4110] use `as` */ $name,
      /* HH_FIXME[4110] use `as` */ $init,
      /* HH_FIXME[4110] use `as` */ $semi,
    );
  }

  public function getTypeUNTYPED(): ?Node {
    return $this->_type;
  }

  public function withType(Node $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return new static($value, $this->_name, $this->_init, $this->_semi);
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

  public function getNameUNTYPED(): ?Node {
    return $this->_name;
  }

  public function withName(Node $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new static($this->_type, $value, $this->_init, $this->_semi);
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

  public function getInitUNTYPED(): ?Node {
    return $this->_init;
  }

  public function withInit(Node $value): this {
    if ($value === $this->_init) {
      return $this;
    }
    return new static($this->_type, $this->_name, $value, $this->_semi);
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

  public function getSemiUNTYPED(): ?Node {
    return $this->_semi;
  }

  public function withSemi(Node $value): this {
    if ($value === $this->_semi) {
      return $this;
    }
    return new static($this->_type, $this->_name, $this->_init, $value);
  }

  public function hasSemi(): bool {
    return $this->_semi !== null;
  }

  /**
   * @return
   */
  public function getSemi(): Node {
    return $this->_semi;
  }

  /**
   * @return
   */
  public function getSemix(): Node {
    return $this->getSemi();
  }
}
