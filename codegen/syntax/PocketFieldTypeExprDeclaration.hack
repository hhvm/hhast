/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<be9a0e3f5395303d3af5491bbaf71334>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class PocketFieldTypeExprDeclaration extends Node {

  const string SYNTAX_KIND = 'pocket_field_type_expr_declaration';

  private Node $_case;
  private Node $_type;
  private Node $_name;
  private Node $_semicolon;

  public function __construct(
    Node $case,
    Node $type,
    Node $name,
    Node $semicolon,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_case = $case;
    $this->_type = $type;
    $this->_name = $name;
    $this->_semicolon = $semicolon;
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
    $case = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['pocket_field_type_expr_case'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $case = $case as nonnull;
    $offset += $case->getWidth();
    $type = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['pocket_field_type_expr_type'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $type = $type as nonnull;
    $offset += $type->getWidth();
    $name = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['pocket_field_type_expr_name'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $name = $name as nonnull;
    $offset += $name->getWidth();
    $semicolon = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['pocket_field_type_expr_semicolon'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $semicolon = $semicolon as nonnull;
    $offset += $semicolon->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $case,
      /* HH_IGNORE_ERROR[4110] */ $type,
      /* HH_IGNORE_ERROR[4110] */ $name,
      /* HH_IGNORE_ERROR[4110] */ $semicolon,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'case' => $this->_case,
      'type' => $this->_type,
      'name' => $this->_name,
      'semicolon' => $this->_semicolon,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $case = $rewriter($this->_case, $parents);
    $type = $rewriter($this->_type, $parents);
    $name = $rewriter($this->_name, $parents);
    $semicolon = $rewriter($this->_semicolon, $parents);
    if (
      $case === $this->_case &&
      $type === $this->_type &&
      $name === $this->_name &&
      $semicolon === $this->_semicolon
    ) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $case,
      /* HH_FIXME[4110] use `as` */ $type,
      /* HH_FIXME[4110] use `as` */ $name,
      /* HH_FIXME[4110] use `as` */ $semicolon,
    );
  }

  public function getCaseUNTYPED(): ?Node {
    return $this->_case;
  }

  public function withCase(Node $value): this {
    if ($value === $this->_case) {
      return $this;
    }
    return new static($value, $this->_type, $this->_name, $this->_semicolon);
  }

  public function hasCase(): bool {
    return $this->_case !== null;
  }

  /**
   * @return unknown
   */
  public function getCase(): Node {
    return $this->_case;
  }

  /**
   * @return unknown
   */
  public function getCasex(): Node {
    return $this->getCase();
  }

  public function getTypeUNTYPED(): ?Node {
    return $this->_type;
  }

  public function withType(Node $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return new static($this->_case, $value, $this->_name, $this->_semicolon);
  }

  public function hasType(): bool {
    return $this->_type !== null;
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

  public function getNameUNTYPED(): ?Node {
    return $this->_name;
  }

  public function withName(Node $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new static($this->_case, $this->_type, $value, $this->_semicolon);
  }

  public function hasName(): bool {
    return $this->_name !== null;
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

  public function getSemicolonUNTYPED(): ?Node {
    return $this->_semicolon;
  }

  public function withSemicolon(Node $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new static($this->_case, $this->_type, $this->_name, $value);
  }

  public function hasSemicolon(): bool {
    return $this->_semicolon !== null;
  }

  /**
   * @return unknown
   */
  public function getSemicolon(): Node {
    return $this->_semicolon;
  }

  /**
   * @return unknown
   */
  public function getSemicolonx(): Node {
    return $this->getSemicolon();
  }
}
