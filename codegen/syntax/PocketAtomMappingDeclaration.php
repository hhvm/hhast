<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<72c3072a81a6f16864a962d1c68d1b43>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class PocketAtomMappingDeclaration extends EditableNode {

  private EditableNode $_expression;
  private EditableNode $_left_paren;
  private EditableNode $_mappings;
  private EditableNode $_right_paren;
  private EditableNode $_semicolon;

  public function __construct(
    EditableNode $expression,
    EditableNode $left_paren,
    EditableNode $mappings,
    EditableNode $right_paren,
    EditableNode $semicolon,
  ) {
    parent::__construct('pocket_atom_mapping_declaration');
    $this->_expression = $expression;
    $this->_left_paren = $left_paren;
    $this->_mappings = $mappings;
    $this->_right_paren = $right_paren;
    $this->_semicolon = $semicolon;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
  ): this {
    $expression = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['pocket_atom_mapping_expression'],
      $file,
      $offset,
      $source,
    );
    $offset += $expression->getWidth();
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
    return new static(
      $expression,
      $left_paren,
      $mappings,
      $right_paren,
      $semicolon,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'expression' => $this->_expression,
      'left_paren' => $this->_left_paren,
      'mappings' => $this->_mappings,
      'right_paren' => $this->_right_paren,
      'semicolon' => $this->_semicolon,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?vec<EditableNode> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $expression = $this->_expression->rewrite($rewriter, $parents);
    $left_paren = $this->_left_paren->rewrite($rewriter, $parents);
    $mappings = $this->_mappings->rewrite($rewriter, $parents);
    $right_paren = $this->_right_paren->rewrite($rewriter, $parents);
    $semicolon = $this->_semicolon->rewrite($rewriter, $parents);
    if (
      $expression === $this->_expression &&
      $left_paren === $this->_left_paren &&
      $mappings === $this->_mappings &&
      $right_paren === $this->_right_paren &&
      $semicolon === $this->_semicolon
    ) {
      return $this;
    }
    return new static(
      $expression,
      $left_paren,
      $mappings,
      $right_paren,
      $semicolon,
    );
  }

  public function getExpressionUNTYPED(): EditableNode {
    return $this->_expression;
  }

  public function withExpression(EditableNode $value): this {
    if ($value === $this->_expression) {
      return $this;
    }
    return new static(
      $value,
      $this->_left_paren,
      $this->_mappings,
      $this->_right_paren,
      $this->_semicolon,
    );
  }

  public function hasExpression(): bool {
    return !$this->_expression->isMissing();
  }

  /**
   * @return unknown
   */
  public function getExpression(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_expression);
  }

  /**
   * @return unknown
   */
  public function getExpressionx(): EditableNode {
    return $this->getExpression();
  }

  public function getLeftParenUNTYPED(): EditableNode {
    return $this->_left_paren;
  }

  public function withLeftParen(EditableNode $value): this {
    if ($value === $this->_left_paren) {
      return $this;
    }
    return new static(
      $this->_expression,
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
    return TypeAssert\instance_of(EditableNode::class, $this->_left_paren);
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
      $this->_expression,
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
    return TypeAssert\instance_of(EditableNode::class, $this->_mappings);
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
      $this->_expression,
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
    return TypeAssert\instance_of(EditableNode::class, $this->_right_paren);
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
      $this->_expression,
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
    return TypeAssert\instance_of(EditableNode::class, $this->_semicolon);
  }

  /**
   * @return unknown
   */
  public function getSemicolonx(): EditableNode {
    return $this->getSemicolon();
  }
}
