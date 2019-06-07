/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<7714f704bf3a975a5ad0f3c5e200425f>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class PocketAtomMappingDeclaration extends Node {

  const string SYNTAX_KIND = 'pocket_atom_mapping_declaration';

  private Node $_glyph;
  private Node $_name;
  private Node $_left_paren;
  private Node $_mappings;
  private Node $_right_paren;
  private Node $_semicolon;

  public function __construct(
    Node $glyph,
    Node $name,
    Node $left_paren,
    Node $mappings,
    Node $right_paren,
    Node $semicolon,
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
      /* HH_FIXME[4110] */ $json['pocket_atom_mapping_glyph'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $glyph->getWidth();
    $name = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['pocket_atom_mapping_name'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $name->getWidth();
    $left_paren = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['pocket_atom_mapping_left_paren'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $left_paren->getWidth();
    $mappings = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['pocket_atom_mapping_mappings'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $mappings->getWidth();
    $right_paren = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['pocket_atom_mapping_right_paren'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $right_paren->getWidth();
    $semicolon = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['pocket_atom_mapping_semicolon'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $semicolon->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      $glyph,
      $name,
      $left_paren,
      $mappings,
      $right_paren,
      $semicolon,
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
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $glyph = $rewriter($this->_glyph, $parents);
    $name = $rewriter($this->_name, $parents);
    $left_paren = $rewriter($this->_left_paren, $parents);
    $mappings = $rewriter($this->_mappings, $parents);
    $right_paren = $rewriter($this->_right_paren, $parents);
    $semicolon = $rewriter($this->_semicolon, $parents);
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
      $glyph,
      $name,
      $left_paren,
      $mappings,
      $right_paren,
      $semicolon,
    );
  }

  public function getGlyphUNTYPED(): Node {
    return $this->_glyph;
  }

  public function withGlyph(Node $value): this {
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
    return !$this->_glyph->isMissing();
  }

  /**
   * @return unknown
   */
  public function getGlyph(): Node {
    return $this->_glyph;
  }

  /**
   * @return unknown
   */
  public function getGlyphx(): Node {
    return $this->getGlyph();
  }

  public function getNameUNTYPED(): Node {
    return $this->_name;
  }

  public function withName(Node $value): this {
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
    return !$this->_name->isMissing();
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

  public function getLeftParenUNTYPED(): Node {
    return $this->_left_paren;
  }

  public function withLeftParen(Node $value): this {
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
    return !$this->_left_paren->isMissing();
  }

  /**
   * @return unknown
   */
  public function getLeftParen(): Node {
    return $this->_left_paren;
  }

  /**
   * @return unknown
   */
  public function getLeftParenx(): Node {
    return $this->getLeftParen();
  }

  public function getMappingsUNTYPED(): Node {
    return $this->_mappings;
  }

  public function withMappings(Node $value): this {
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
    return !$this->_mappings->isMissing();
  }

  /**
   * @return unknown
   */
  public function getMappings(): Node {
    return $this->_mappings;
  }

  /**
   * @return unknown
   */
  public function getMappingsx(): Node {
    return $this->getMappings();
  }

  public function getRightParenUNTYPED(): Node {
    return $this->_right_paren;
  }

  public function withRightParen(Node $value): this {
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
    return !$this->_right_paren->isMissing();
  }

  /**
   * @return unknown
   */
  public function getRightParen(): Node {
    return $this->_right_paren;
  }

  /**
   * @return unknown
   */
  public function getRightParenx(): Node {
    return $this->getRightParen();
  }

  public function getSemicolonUNTYPED(): Node {
    return $this->_semicolon;
  }

  public function withSemicolon(Node $value): this {
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
    return !$this->_semicolon->isMissing();
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
