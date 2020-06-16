/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<e3be7897ca2362d63fab567f890f3831>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class PocketAtomMappingDeclaration extends Node {

  const string SYNTAX_KIND = 'pocket_atom_mapping_declaration';

  private ?Node $_glyph;
  private ?Node $_name;
  private ?Node $_left_paren;
  private ?Node $_mappings;
  private ?Node $_right_paren;
  private ?Node $_semicolon;

  public function __construct(
    ?Node $glyph,
    ?Node $name,
    ?Node $left_paren,
    ?Node $mappings,
    ?Node $right_paren,
    ?Node $semicolon,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_glyph = $glyph;
    $this->_name = $name;
    $this->_left_paren = $left_paren;
    $this->_mappings = $mappings;
    $this->_right_paren = $right_paren;
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
    $glyph = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['pocket_atom_mapping_glyph'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $glyph?->getWidth() ?? 0;
    $name = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['pocket_atom_mapping_name'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $name?->getWidth() ?? 0;
    $left_paren = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['pocket_atom_mapping_left_paren'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $left_paren?->getWidth() ?? 0;
    $mappings = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['pocket_atom_mapping_mappings'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $mappings?->getWidth() ?? 0;
    $right_paren = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['pocket_atom_mapping_right_paren'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $right_paren?->getWidth() ?? 0;
    $semicolon = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['pocket_atom_mapping_semicolon'] ?? dict['kind' => 'missing'],
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
      /* HH_IGNORE_ERROR[4110] */ $glyph,
      /* HH_IGNORE_ERROR[4110] */ $name,
      /* HH_IGNORE_ERROR[4110] */ $left_paren,
      /* HH_IGNORE_ERROR[4110] */ $mappings,
      /* HH_IGNORE_ERROR[4110] */ $right_paren,
      /* HH_IGNORE_ERROR[4110] */ $semicolon,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'glyph' => $this->_glyph,
      'name' => $this->_name,
      'left_paren' => $this->_left_paren,
      'mappings' => $this->_mappings,
      'right_paren' => $this->_right_paren,
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
    $glyph = $this->_glyph === null ? null : $rewriter($this->_glyph, $parents);
    $name = $this->_name === null ? null : $rewriter($this->_name, $parents);
    $left_paren = $this->_left_paren === null
      ? null
      : $rewriter($this->_left_paren, $parents);
    $mappings = $this->_mappings === null
      ? null
      : $rewriter($this->_mappings, $parents);
    $right_paren = $this->_right_paren === null
      ? null
      : $rewriter($this->_right_paren, $parents);
    $semicolon = $this->_semicolon === null
      ? null
      : $rewriter($this->_semicolon, $parents);
    if (
      $glyph === $this->_glyph &&
      $name === $this->_name &&
      $left_paren === $this->_left_paren &&
      $mappings === $this->_mappings &&
      $right_paren === $this->_right_paren &&
      $semicolon === $this->_semicolon
    ) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $glyph,
      /* HH_FIXME[4110] use `as` */ $name,
      /* HH_FIXME[4110] use `as` */ $left_paren,
      /* HH_FIXME[4110] use `as` */ $mappings,
      /* HH_FIXME[4110] use `as` */ $right_paren,
      /* HH_FIXME[4110] use `as` */ $semicolon,
    );
  }

  public function getGlyphUNTYPED(): ?Node {
    return $this->_glyph;
  }

  public function withGlyph(?Node $value): this {
    if ($value === $this->_glyph) {
      return $this;
    }
    return new static(
      $value,
      $this->_name,
      $this->_left_paren,
      $this->_mappings,
      $this->_right_paren,
      $this->_semicolon,
    );
  }

  public function hasGlyph(): bool {
    return $this->_glyph !== null;
  }

  /**
   * @return unknown
   */
  public function getGlyph(): ?Node {
    return $this->_glyph;
  }

  /**
   * @return unknown
   */
  public function getGlyphx(): Node {
    return TypeAssert\not_null($this->getGlyph());
  }

  public function getNameUNTYPED(): ?Node {
    return $this->_name;
  }

  public function withName(?Node $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new static(
      $this->_glyph,
      $value,
      $this->_left_paren,
      $this->_mappings,
      $this->_right_paren,
      $this->_semicolon,
    );
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

  public function getLeftParenUNTYPED(): ?Node {
    return $this->_left_paren;
  }

  public function withLeftParen(?Node $value): this {
    if ($value === $this->_left_paren) {
      return $this;
    }
    return new static(
      $this->_glyph,
      $this->_name,
      $value,
      $this->_mappings,
      $this->_right_paren,
      $this->_semicolon,
    );
  }

  public function hasLeftParen(): bool {
    return $this->_left_paren !== null;
  }

  /**
   * @return unknown
   */
  public function getLeftParen(): ?Node {
    return $this->_left_paren;
  }

  /**
   * @return unknown
   */
  public function getLeftParenx(): Node {
    return TypeAssert\not_null($this->getLeftParen());
  }

  public function getMappingsUNTYPED(): ?Node {
    return $this->_mappings;
  }

  public function withMappings(?Node $value): this {
    if ($value === $this->_mappings) {
      return $this;
    }
    return new static(
      $this->_glyph,
      $this->_name,
      $this->_left_paren,
      $value,
      $this->_right_paren,
      $this->_semicolon,
    );
  }

  public function hasMappings(): bool {
    return $this->_mappings !== null;
  }

  /**
   * @return unknown
   */
  public function getMappings(): ?Node {
    return $this->_mappings;
  }

  /**
   * @return unknown
   */
  public function getMappingsx(): Node {
    return TypeAssert\not_null($this->getMappings());
  }

  public function getRightParenUNTYPED(): ?Node {
    return $this->_right_paren;
  }

  public function withRightParen(?Node $value): this {
    if ($value === $this->_right_paren) {
      return $this;
    }
    return new static(
      $this->_glyph,
      $this->_name,
      $this->_left_paren,
      $this->_mappings,
      $value,
      $this->_semicolon,
    );
  }

  public function hasRightParen(): bool {
    return $this->_right_paren !== null;
  }

  /**
   * @return unknown
   */
  public function getRightParen(): ?Node {
    return $this->_right_paren;
  }

  /**
   * @return unknown
   */
  public function getRightParenx(): Node {
    return TypeAssert\not_null($this->getRightParen());
  }

  public function getSemicolonUNTYPED(): ?Node {
    return $this->_semicolon;
  }

  public function withSemicolon(?Node $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new static(
      $this->_glyph,
      $this->_name,
      $this->_left_paren,
      $this->_mappings,
      $this->_right_paren,
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
