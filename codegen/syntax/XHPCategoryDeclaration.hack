/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<e11a6be7f5869e0bd380e71bac79643a>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class XHPCategoryDeclaration extends EditableNode {

  private EditableNode $_keyword;
  private EditableNode $_categories;
  private EditableNode $_semicolon;

  public function __construct(
    EditableNode $keyword,
    EditableNode $categories,
    EditableNode $semicolon,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_keyword = $keyword;
    $this->_categories = $categories;
    $this->_semicolon = $semicolon;
    parent::__construct('xhp_category_declaration', $source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
  ): this {
    $offset = $initial_offset;
    $keyword = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['xhp_category_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $keyword->getWidth();
    $categories = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['xhp_category_categories'],
      $file,
      $offset,
      $source,
    );
    $offset += $categories->getWidth();
    $semicolon = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['xhp_category_semicolon'],
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
    return new static($keyword, $categories, $semicolon, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'keyword' => $this->_keyword,
      'categories' => $this->_categories,
      'semicolon' => $this->_semicolon,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    vec<EditableNode> $parents = vec[],
  ): this {
    $parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $parents);
    $categories = $this->_categories->rewrite($rewriter, $parents);
    $semicolon = $this->_semicolon->rewrite($rewriter, $parents);
    if (
      $keyword === $this->_keyword &&
      $categories === $this->_categories &&
      $semicolon === $this->_semicolon
    ) {
      return $this;
    }
    return new static($keyword, $categories, $semicolon);
  }

  public function getKeywordUNTYPED(): EditableNode {
    return $this->_keyword;
  }

  public function withKeyword(EditableNode $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static($value, $this->_categories, $this->_semicolon);
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  /**
   * @return unknown
   */
  public function getKeyword(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_keyword);
  }

  /**
   * @return unknown
   */
  public function getKeywordx(): EditableNode {
    return $this->getKeyword();
  }

  public function getCategoriesUNTYPED(): EditableNode {
    return $this->_categories;
  }

  public function withCategories(EditableNode $value): this {
    if ($value === $this->_categories) {
      return $this;
    }
    return new static($this->_keyword, $value, $this->_semicolon);
  }

  public function hasCategories(): bool {
    return !$this->_categories->isMissing();
  }

  /**
   * @return unknown
   */
  public function getCategories(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_categories);
  }

  /**
   * @return unknown
   */
  public function getCategoriesx(): EditableNode {
    return $this->getCategories();
  }

  public function getSemicolonUNTYPED(): EditableNode {
    return $this->_semicolon;
  }

  public function withSemicolon(EditableNode $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new static($this->_keyword, $this->_categories, $value);
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
