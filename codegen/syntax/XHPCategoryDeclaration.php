<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<00fd2d7accab39707a0c786234540373>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class XHPCategoryDeclaration extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_categories;
  private EditableSyntax $_semicolon;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $categories,
    EditableSyntax $semicolon,
  ) {
    parent::__construct('xhp_category_declaration');
    $this->_keyword = $keyword;
    $this->_categories = $categories;
    $this->_semicolon = $semicolon;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['xhp_category_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $categories = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['xhp_category_categories'],
      $position,
      $source,
    );
    $position += $categories->width();
    $semicolon = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['xhp_category_semicolon'],
      $position,
      $source,
    );
    $position += $semicolon->width();
    return new self($keyword, $categories, $semicolon);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'categories' => $this->_categories;
    yield 'semicolon' => $this->_semicolon;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $categories = $this->_categories->rewrite($rewriter, $child_parents);
    $semicolon = $this->_semicolon->rewrite($rewriter, $child_parents);
    if (
      $keyword === $this->_keyword &&
      $categories === $this->_categories &&
      $semicolon === $this->_semicolon
    ) {
      $node = $this;
    } else {
      $node = new self($keyword, $categories, $semicolon);
    }
    return $rewriter($node, $parents);
  }

  public function keyword(): CategoryToken {
    return $this->keywordx();
  }

  public function keywordx(): CategoryToken {
    return TypeAssert::isInstanceOf(CategoryToken::class, $this->_keyword);
  }

  public function raw_keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self($value, $this->_categories, $this->_semicolon);
  }

  public function categories(): EditableList {
    return $this->categoriesx();
  }

  public function categoriesx(): EditableList {
    return TypeAssert::isInstanceOf(EditableList::class, $this->_categories);
  }

  public function raw_categories(): EditableSyntax {
    return $this->_categories;
  }

  public function with_categories(EditableSyntax $value): this {
    return new self($this->_keyword, $value, $this->_semicolon);
  }

  public function semicolon(): SemicolonToken {
    return $this->semicolonx();
  }

  public function semicolonx(): SemicolonToken {
    return TypeAssert::isInstanceOf(SemicolonToken::class, $this->_semicolon);
  }

  public function raw_semicolon(): EditableSyntax {
    return $this->_semicolon;
  }

  public function with_semicolon(EditableSyntax $value): this {
    return new self($this->_keyword, $this->_categories, $value);
  }
}
