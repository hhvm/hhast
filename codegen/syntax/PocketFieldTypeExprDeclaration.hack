/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<248b2a4d141e97d22aca4ea043618ab6>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class PocketFieldTypeExprDeclaration extends Node {

  const string SYNTAX_KIND = 'pocket_field_type_expr_declaration';

  private ?Node $_case;
  private ?Node $_type;
  private ?Node $_name;
  private ?Node $_semicolon;

  public function __construct(
    ?Node $case,
    ?Node $type,
    ?Node $name,
    ?Node $semicolon,
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
      /* HH_FIXME[4110] */ $json['pocket_field_type_expr_case'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $case?->getWidth() ?? 0;
    $type = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['pocket_field_type_expr_type'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $type?->getWidth() ?? 0;
    $name = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['pocket_field_type_expr_name'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $name?->getWidth() ?? 0;
    $semicolon = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['pocket_field_type_expr_semicolon'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $semicolon?->getWidth() ?? 0;
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
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $case = $this->_case === null ? null : $rewriter($this->_case, $parents);
    $type = $this->_type === null ? null : $rewriter($this->_type, $parents);
    $name = $this->_name === null ? null : $rewriter($this->_name, $parents);
    $semicolon = $this->_semicolon === null
      ? null
      : $rewriter($this->_semicolon, $parents);
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

  public function withCase(?Node $value): this {
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
  public function getCase(): ?Node {
    return $this->_case;
  }

  /**
   * @return unknown
   */
  public function getCasex(): Node {
    return TypeAssert\not_null($this->getCase());
  }

  public function getTypeUNTYPED(): ?Node {
    return $this->_type;
  }

  public function withType(?Node $value): this {
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
  public function getType(): ?Node {
    return $this->_type;
  }

  /**
   * @return unknown
   */
  public function getTypex(): Node {
    return TypeAssert\not_null($this->getType());
  }

  public function getNameUNTYPED(): ?Node {
    return $this->_name;
  }

  public function withName(?Node $value): this {
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
  public function getName(): ?Node {
    return $this->_name;
  }

  /**
   * @return unknown
   */
  public function getNamex(): Node {
    return TypeAssert\not_null($this->getName());
  }

  public function getSemicolonUNTYPED(): ?Node {
    return $this->_semicolon;
  }

  public function withSemicolon(?Node $value): this {
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
  public function getSemicolon(): ?Node {
    return $this->_semicolon;
  }

  /**
   * @return unknown
   */
  public function getSemicolonx(): Node {
    return TypeAssert\not_null($this->getSemicolon());
  }
}
