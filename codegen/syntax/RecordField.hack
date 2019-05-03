/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<57a306c2a0439110c22235f522335bc1>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class RecordField extends EditableNode {

  private EditableNode $_name;
  private EditableNode $_colon;
  private EditableNode $_type;
  private EditableNode $_init;
  private EditableNode $_comma;

  public function __construct(
    EditableNode $name,
    EditableNode $colon,
    EditableNode $type,
    EditableNode $init,
    EditableNode $comma,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_name = $name;
    $this->_colon = $colon;
    $this->_type = $type;
    $this->_init = $init;
    $this->_comma = $comma;
    parent::__construct('record_field', $source_ref);
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
      /* UNSAFE_EXPR */ $json['record_field_name'],
      $file,
      $offset,
      $source,
    );
    $offset += $name->getWidth();
    $colon = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['record_field_colon'],
      $file,
      $offset,
      $source,
    );
    $offset += $colon->getWidth();
    $type = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['record_field_type'],
      $file,
      $offset,
      $source,
    );
    $offset += $type->getWidth();
    $init = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['record_field_init'],
      $file,
      $offset,
      $source,
    );
    $offset += $init->getWidth();
    $comma = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['record_field_comma'],
      $file,
      $offset,
      $source,
    );
    $offset += $comma->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static($name, $colon, $type, $init, $comma, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'name' => $this->_name,
      'colon' => $this->_colon,
      'type' => $this->_type,
      'init' => $this->_init,
      'comma' => $this->_comma,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<EditableNode> $parents = vec[],
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
    return new static($name, $colon, $type, $init, $comma);
  }

  public function getNameUNTYPED(): EditableNode {
    return $this->_name;
  }

  public function withName(EditableNode $value): this {
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
    return !$this->_name->isMissing();
  }

  /**
   * @return
   */
  public function getName(): EditableNode {
    return $this->_name;
  }

  /**
   * @return
   */
  public function getNamex(): EditableNode {
    return $this->getName();
  }

  public function getColonUNTYPED(): EditableNode {
    return $this->_colon;
  }

  public function withColon(EditableNode $value): this {
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
    return !$this->_colon->isMissing();
  }

  /**
   * @return
   */
  public function getColon(): EditableNode {
    return $this->_colon;
  }

  /**
   * @return
   */
  public function getColonx(): EditableNode {
    return $this->getColon();
  }

  public function getTypeUNTYPED(): EditableNode {
    return $this->_type;
  }

  public function withType(EditableNode $value): this {
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
    return !$this->_type->isMissing();
  }

  /**
   * @return
   */
  public function getType(): EditableNode {
    return $this->_type;
  }

  /**
   * @return
   */
  public function getTypex(): EditableNode {
    return $this->getType();
  }

  public function getInitUNTYPED(): EditableNode {
    return $this->_init;
  }

  public function withInit(EditableNode $value): this {
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
    return !$this->_init->isMissing();
  }

  /**
   * @return
   */
  public function getInit(): EditableNode {
    return $this->_init;
  }

  /**
   * @return
   */
  public function getInitx(): EditableNode {
    return $this->getInit();
  }

  public function getCommaUNTYPED(): EditableNode {
    return $this->_comma;
  }

  public function withComma(EditableNode $value): this {
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
    return !$this->_comma->isMissing();
  }

  /**
   * @return
   */
  public function getComma(): EditableNode {
    return $this->_comma;
  }

  /**
   * @return
   */
  public function getCommax(): EditableNode {
    return $this->getComma();
  }
}
