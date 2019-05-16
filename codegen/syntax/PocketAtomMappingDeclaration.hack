/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<c3ae3fee6b3b3996a6b29689c23fe0e5>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class PocketAtomMappingDeclaration extends EditableNode {

  const string SYNTAX_KIND = 'PocketAtomMappingDeclaration';

  private EditableNode $_glyph;
  private EditableNode $_name;
  private EditableNode $_left_paren;
  private EditableNode $_mappings;
  private EditableNode $_right_paren;
  private EditableNode $_semicolon;

  public function __construct(
    EditableNode $glyph,
    EditableNode $name,
    EditableNode $left_paren,
    EditableNode $mappings,
    EditableNode $right_paren,
    EditableNode $semicolon,
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
  ): this {
    $offset = $initial_offset;
    $glyph = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['pocket_atom_mapping_glyph'],
      $file,
      $offset,
      $source,
    );
    $offset += $glyph->getWidth();
    $name = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['pocket_atom_mapping_name'],
      $file,
      $offset,
      $source,
    );
    $offset += $name->getWidth();
    $left_paren = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['pocket_atom_mapping_left_paren'],
      $file,
      $offset,
      $source,
    );
    $offset += $left_paren->getWidth();
    $mappings = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['pocket_atom_mapping_mappings'],
      $file,
      $offset,
      $source,
    );
    $offset += $mappings->getWidth();
    $right_paren = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['pocket_atom_mapping_right_paren'],
      $file,
      $offset,
      $source,
    );
    $offset += $right_paren->getWidth();
    $semicolon = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['pocket_atom_mapping_semicolon'],
      $file,
      $offset,
      $source,
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
  public function getChildren(): dict<string, EditableNode> {
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
    vec<EditableNode> $parents = vec[],
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

  public function getGlyphUNTYPED(): EditableNode {
    return $this->_glyph;
  }

  public function withGlyph(EditableNode $value): this {
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
  public function getGlyph(): EditableNode {
    return $this->_glyph;
  }

  /**
   * @return unknown
   */
  public function getGlyphx(): EditableNode {
    return $this->getGlyph();
  }

  public function getNameUNTYPED(): EditableNode {
    return $this->_name;
  }

  public function withName(EditableNode $value): this {
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
  public function getName(): EditableNode {
    return $this->_name;
  }

  /**
   * @return unknown
   */
  public function getNamex(): EditableNode {
    return $this->getName();
  }

  public function getLeftParenUNTYPED(): EditableNode {
    return $this->_left_paren;
  }

  public function withLeftParen(EditableNode $value): this {
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
  public function getLeftParen(): EditableNode {
    return $this->_left_paren;
  }

  /**
   * @return unknown
   */
  public function getLeftParenx(): EditableNode {
    return $this->getLeftParen();
  }

  public function getMappingsUNTYPED(): EditableNode {
    return $this->_mappings;
  }

  public function withMappings(EditableNode $value): this {
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
  public function getMappings(): EditableNode {
    return $this->_mappings;
  }

  /**
   * @return unknown
   */
  public function getMappingsx(): EditableNode {
    return $this->getMappings();
  }

  public function getRightParenUNTYPED(): EditableNode {
    return $this->_right_paren;
  }

  public function withRightParen(EditableNode $value): this {
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
  public function getRightParen(): EditableNode {
    return $this->_right_paren;
  }

  /**
   * @return unknown
   */
  public function getRightParenx(): EditableNode {
    return $this->getRightParen();
  }

  public function getSemicolonUNTYPED(): EditableNode {
    return $this->_semicolon;
  }

  public function withSemicolon(EditableNode $value): this {
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
  public function getSemicolon(): EditableNode {
    return $this->_semicolon;
  }

  /**
   * @return unknown
   */
  public function getSemicolonx(): EditableNode {
    return $this->getSemicolon();
  }
}
