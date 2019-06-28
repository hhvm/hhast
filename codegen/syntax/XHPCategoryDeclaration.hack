/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<ce967f3be9e9d6ae6fac0f1b8440a050>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class XHPCategoryDeclaration
  extends Node
  implements IClassBodyDeclaration {

  const string SYNTAX_KIND = 'xhp_category_declaration';

  private Node $_keyword;
  private Node $_categories;
  private Node $_semicolon;

  public function __construct(
    Node $keyword,
    Node $categories,
    Node $semicolon,
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
    string $_type_hint,
  ): this {
    $offset = $initial_offset;
    $keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['xhp_category_keyword'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $keyword->getWidth();
    $categories = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['xhp_category_categories'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $categories->getWidth();
    $semicolon = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['xhp_category_semicolon'],
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
    return new static($keyword, $categories, $semicolon, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'keyword' => $this->_keyword,
      'categories' => $this->_categories,
      'semicolon' => $this->_semicolon,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
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

  public function getKeywordUNTYPED(): Node {
    return $this->_keyword;
  }

  public function withKeyword(Node $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static(
      $value ?? Missing(),
      $this->_categories,
      $this->_semicolon,
    );
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  /**
   * @return unknown
   */
  public function getKeyword(): Node {
    return $this->_keyword;
  }

  /**
   * @return unknown
   */
  public function getKeywordx(): Node {
    return $this->getKeyword();
  }

  public function getCategoriesUNTYPED(): Node {
    return $this->_categories;
  }

  public function withCategories(Node $value): this {
    if ($value === $this->_categories) {
      return $this;
    }
    return new static($this->_keyword, $value ?? Missing(), $this->_semicolon);
  }

  public function hasCategories(): bool {
    return !$this->_categories->isMissing();
  }

  /**
   * @return unknown
   */
  public function getCategories(): Node {
    return $this->_categories;
  }

  /**
   * @return unknown
   */
  public function getCategoriesx(): Node {
    return $this->getCategories();
  }

  public function getSemicolonUNTYPED(): Node {
    return $this->_semicolon;
  }

  public function withSemicolon(Node $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new static($this->_keyword, $this->_categories, $value ?? Missing());
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
