/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<83a422ee4af5f9f07d1e4f9999108477>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class XHPCategoryDeclaration
  extends EditableNode
  implements IClassBodyDeclaration {

  const string SYNTAX_KIND = 'xhp_category_declaration';

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
    $keyword = EditableNode::fromJSON(
      /* HH_FIXME[4110] */ $json['xhp_category_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $keyword->getWidth();
    $categories = EditableNode::fromJSON(
      /* HH_FIXME[4110] */ $json['xhp_category_categories'],
      $file,
      $offset,
      $source,
    );
    $offset += $categories->getWidth();
    $semicolon = EditableNode::fromJSON(
      /* HH_FIXME[4110] */ $json['xhp_category_semicolon'],
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
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<EditableNode> $parents = vec[],
  ): this {
    $parents[] = $this;
    $keyword = $rewriter($this->_keyword, $parents);
    $categories = $rewriter($this->_categories, $parents);
    $semicolon = $rewriter($this->_semicolon, $parents);
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
    return $this->_keyword;
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
    return $this->_categories;
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
    return $this->_semicolon;
  }

  /**
   * @return unknown
   */
  public function getSemicolonx(): EditableNode {
    return $this->getSemicolon();
  }
}
