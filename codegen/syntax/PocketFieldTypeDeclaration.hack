/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<c33a0b74208c1f6326fb03b4776893f6>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class PocketFieldTypeDeclaration extends Node {

  const string SYNTAX_KIND = 'pocket_field_type_declaration';

  private ?Node $_case;
  private ?Node $_type;
  private ?Node $_type_parameter;
  private ?Node $_semicolon;

  public function __construct(
    ?Node $case,
    ?Node $type,
    ?Node $type_parameter,
    ?Node $semicolon,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_case = $case;
    $this->_type = $type;
    $this->_type_parameter = $type_parameter;
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
      /* HH_FIXME[4110] */ $json['pocket_field_type_case'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $case?->getWidth() ?? 0;
    $type = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['pocket_field_type_type'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $type?->getWidth() ?? 0;
    $type_parameter = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['pocket_field_type_type_parameter'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $type_parameter?->getWidth() ?? 0;
    $semicolon = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['pocket_field_type_semicolon'] ?? dict['kind' => 'missing'],
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
      /* HH_IGNORE_ERROR[4110] */ $type_parameter,
      /* HH_IGNORE_ERROR[4110] */ $semicolon,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'case' => $this->_case,
      'type' => $this->_type,
      'type_parameter' => $this->_type_parameter,
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
    $type_parameter = $this->_type_parameter === null
      ? null
      : $rewriter($this->_type_parameter, $parents);
    $semicolon = $this->_semicolon === null
      ? null
      : $rewriter($this->_semicolon, $parents);
    if (
      $case === $this->_case &&
      $type === $this->_type &&
      $type_parameter === $this->_type_parameter &&
      $semicolon === $this->_semicolon
    ) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $case,
      /* HH_FIXME[4110] use `as` */ $type,
      /* HH_FIXME[4110] use `as` */ $type_parameter,
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
    return new static(
      $value,
      $this->_type,
      $this->_type_parameter,
      $this->_semicolon,
    );
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
    return new static(
      $this->_case,
      $value,
      $this->_type_parameter,
      $this->_semicolon,
    );
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

  public function getTypeParameterUNTYPED(): ?Node {
    return $this->_type_parameter;
  }

  public function withTypeParameter(?Node $value): this {
    if ($value === $this->_type_parameter) {
      return $this;
    }
    return new static($this->_case, $this->_type, $value, $this->_semicolon);
  }

  public function hasTypeParameter(): bool {
    return $this->_type_parameter !== null;
  }

  /**
   * @return unknown
   */
  public function getTypeParameter(): ?Node {
    return $this->_type_parameter;
  }

  /**
   * @return unknown
   */
  public function getTypeParameterx(): Node {
    return TypeAssert\not_null($this->getTypeParameter());
  }

  public function getSemicolonUNTYPED(): ?Node {
    return $this->_semicolon;
  }

  public function withSemicolon(?Node $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new static(
      $this->_case,
      $this->_type,
      $this->_type_parameter,
      $value,
    );
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
