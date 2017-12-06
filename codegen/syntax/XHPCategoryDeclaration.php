<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<55bbd276a8bb9a39a711b0b1b2d44716>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class XHPCategoryDeclaration extends EditableNode {

  private EditableNode $_keyword;
  private EditableNode $_categories;
  private EditableNode $_semicolon;

  public function __construct(
    EditableNode $keyword,
    EditableNode $categories,
    EditableNode $semicolon,
  ) {
    parent::__construct('xhp_category_declaration');
    $this->_keyword = $keyword;
    $this->_categories = $categories;
    $this->_semicolon = $semicolon;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
  ): this {
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
    return new self($keyword, $categories, $semicolon);
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
    ?vec<EditableNode> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
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
    return new self($keyword, $categories, $semicolon);
  }

  public function getKeywordUNTYPED(): EditableNode {
    return $this->_keyword;
  }

  public function withKeyword(EditableNode $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new self($value, $this->_categories, $this->_semicolon);
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  /**
   * @returns CategoryToken
   */
  public function getKeyword(): CategoryToken {
    return TypeAssert\instance_of(CategoryToken::class, $this->_keyword);
  }

  public function getCategoriesUNTYPED(): EditableNode {
    return $this->_categories;
  }

  public function withCategories(EditableNode $value): this {
    if ($value === $this->_categories) {
      return $this;
    }
    return new self($this->_keyword, $value, $this->_semicolon);
  }

  public function hasCategories(): bool {
    return !$this->_categories->isMissing();
  }

  /**
   * @returns EditableList
   */
  public function getCategories(): EditableList {
    return TypeAssert\instance_of(EditableList::class, $this->_categories);
  }

  public function getSemicolonUNTYPED(): EditableNode {
    return $this->_semicolon;
  }

  public function withSemicolon(EditableNode $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new self($this->_keyword, $this->_categories, $value);
  }

  public function hasSemicolon(): bool {
    return !$this->_semicolon->isMissing();
  }

  /**
   * @returns SemicolonToken
   */
  public function getSemicolon(): SemicolonToken {
    return TypeAssert\instance_of(SemicolonToken::class, $this->_semicolon);
  }
}
